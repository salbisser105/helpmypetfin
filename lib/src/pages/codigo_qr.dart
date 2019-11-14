
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui'as ui;
import 'dart:async';
import 'package:flutter/material.dart' as prefix0;
import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart' as prefix1;
import 'package:qr_flutter/qr_flutter.dart';

class CodigoQRPage extends StatefulWidget {


@override
_CodigoQRPageState createState() => _CodigoQRPageState();
}

class _CodigoQRPageState extends State <CodigoQRPage> {
  GlobalKey globalKey = new GlobalKey();

  static const double _topSectionTopPading = 50.0;
  static const double _topSectionBottomPadding = 20.0;
  static const double _topSectionHeight = 50.0;
  static const _kShareChannel = const MethodChannel('image_gallery_saver');

  
  String _dataString = "Crea tu codigo!";
  String _inputErrorText;
  final TextEditingController _textController =  TextEditingController();

  
     @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Codigo QR"),
      ),
         body: _contentWidget(),
         floatingActionButton: _crearBotones(context),
    );
  }
  static Future<bool> share() async {
    // invokeMethod returns a Future<T> which can be inferred as bool
    // in this context.
    return _kShareChannel.invokeMethod('share');
  }

   _captureAndSharePng() async { 
   try {    
      RenderRepaintBoundary boundary = globalKey.currentContext.findRenderObject(); 
      var image = await boundary.toImage();
      ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();       
      final tempDir = await getTemporaryDirectory();
      final file = await new File('${tempDir.path}/image.png').create();
      await file.writeAsBytes(pngBytes);
       final channel = const MethodChannel('channel:me.alfian.share/share');
      channel.invokeMethod('shareFile', 'image.png');
     } catch(e) {
      print(e.toString());
   }
}

//  _captureAndSharePng() async {
//     try {
//       RenderRepaintBoundary boundary = globalKey.currentContext.findRenderObject();
//       ui.Image image = await boundary.toImage();
//       final ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
//       final Uint8List pngBytes = byteData.buffer.asUint8List();
            
//        final tempDir = await getTemporaryDirectory();
//             print(tempDir.path);
//             final file = await new File('${tempDir.path}/image.png').create();
            
//             await file.writeAsBytes(pngBytes);

//             final _kSharechannel = const MethodChannel('image_gallery_saver');
//             _kSharechannel.invokeMethod('share', 'image.png');

//           print(_kSharechannel);
//           } catch(e) {
//             print(e.toString());
          
//           }
//        }

      takeScreenShot() async{
     RenderRepaintBoundary boundary = globalKey.currentContext.findRenderObject();
     ui.Image image = await boundary.toImage();
     final directory = await getTemporaryDirectory();
      ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();
     print(directory);
     File imgFile =new File('$directory/screenshot.png');
    imgFile.writeAsBytes(pngBytes);
    print(imgFile);
  }

       
        _contentWidget() {
          final bodyHeight = MediaQuery.of(context).size.height - MediaQuery.of(context).viewInsets.bottom;
          return  Container(
            color: const Color(0xFFFFFFFF),
            child:  Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    top: _topSectionTopPading,
                    left: 20.0,
                    right: 10.0,
                    bottom: _topSectionBottomPadding,
                  ),
                  child:  Container(
                    height: _topSectionHeight,
                    child:  Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          child:  TextField(
                            controller: _textController,
                            decoration:  InputDecoration(
                              hintText: "Enter a custom message",
                              errorText: _inputErrorText,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child:  FlatButton(
                            child:  Text("SUBMIT"),
                            onPressed: () {
                              setState((){
                                _dataString = _textController.text;
                                _inputErrorText = null;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child:  Center(
                    child: RepaintBoundary(
                      key: globalKey,
                      child: QrImage(
                        data: _dataString,
                        size: 0.5 * bodyHeight,
                      //  onError: (ex) {
                      //    print("[QR] ERROR - $ex");
                      //    setState((){
                      //      _inputErrorText = "Error! Maybe your input value is too long?";
                      //    });
                      //  },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }

//          createDirectory() async {
//      var path = await _localPath;
//      Directory('$path/CapturedImages').create(recursive: true);
//  }

//   static Future<String> get _localPath async {
//     final directory = await getApplicationDocumentsDirectory();
//     return directory.path;
// }
      
    //     Future<Directory> getTemporaryDirectory() async {
    //       var path = await _localPath;
    //  Directory('$path/CapturedImages').create(recursive: true);
    //       // final String path =
    //       //     await _channel.invokeMethod<String>('getTemporaryDirectory');
    //       if (path == null) {
    //         return null;
    //       }
    //       return Directory(path);
    //     }
       Widget _crearBotones(BuildContext context) {

         return Row(
            mainAxisAlignment: MainAxisAlignment.end,
           children: <Widget>[   
           new FloatingActionButton(
             heroTag: "home",
        child: Icon(Icons.home),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
      new FloatingActionButton(
        heroTag: "save",
        child: Icon(Icons.share),
        onPressed: takeScreenShot,
      )
         ],
         );          
        }
}

