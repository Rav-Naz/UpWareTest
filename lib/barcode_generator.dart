import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:barcode/barcode.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BarcodeGeneratorPage extends StatefulWidget {
  const BarcodeGeneratorPage({Key? key}) : super(key: key);

  @override
  State<BarcodeGeneratorPage> createState() => _BarcodeGeneratorPageState();
}

String buildBarcode(
    Barcode bc,
    String data, {
      String? filename,
      double? width,
      double? height,
      double? fontHeight,
    }) {
  /// Create the Barcode
  final svg = bc.toSvg(
    data,
    width: width ?? 200,
    height: height ?? 80,
    fontHeight: fontHeight,
  );

  return svg;
}

class _BarcodeGeneratorPageState extends State<BarcodeGeneratorPage> {

  @override
  Widget build(BuildContext context) {

    const String codeText = 'CODE 80';

    final barcode = buildBarcode(
      Barcode.code39(),
      codeText,
    );
    final qr = buildBarcode(
      Barcode.qrCode(),
      codeText,
    );

    return Container(
        alignment: Alignment.center,
        child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.string(barcode),
              SvgPicture.string(qr),
              Text('Scan result : $codeText',
                  style: TextStyle(fontSize: 20))
            ]));

  }
}