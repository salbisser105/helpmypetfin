


import 'dart:async';

import 'package:helpmypetfin/src/models/scan_model.dart';

class ValidatorsScan {
  final validarGeo = StreamTransformer<List<ScanModel>,List<ScanModel>>.fromHandlers(
    handleData: ( scans, sink) {

      final geoScans = scans.where((s)=> s.tipo == 'geo').toList();
      sink.add(geoScans);

    }
  );

  final validarHttp = StreamTransformer<List<ScanModel>,List<ScanModel>>.fromHandlers(
    handleData: ( scans, sink) {

      final httpScans = scans.where((s)=> s.tipo == 'http').toList();
      sink.add(httpScans);

    }
  );

}