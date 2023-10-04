import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:image/image.dart' as img;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import '../util/remove_image_background.dart';

Future<ByteData?> captureSignature(BuildContext context) async {
  ByteData? byteData;

  //TODO() remove theme colors and font styles to a central class.
  var color = Colors.white;
  var strokeWidth = 5.0;

  final GlobalKey<SfSignaturePadState> _signatureKey = GlobalKey();

  await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            height: 300,
            width: 400,
            child: Column(
              children: <Widget>[
                SfSignaturePad(
                  backgroundColor: color,
                  key: _signatureKey,
                  minimumStrokeWidth: strokeWidth,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        _signatureKey.currentState!.clear();
                      },
                      child: const Text("Clear"),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        var localContext = context;

                        ui.Image image =
                        await _signatureKey.currentState!.toImage();
                        byteData = await image.toByteData(format: ui.ImageByteFormat.png);
                        Uint8List? values = byteData?.buffer.asUint8List();
                        if (values != null) {
                          img.Image decodedImage = img.decodeImage(values)!;
                          img.Image processedImage = makeTransparentBackground(decodedImage, 200);
                          Uint8List processedBytes = Uint8List.fromList(img.encodePng(processedImage));
                          byteData = ByteData.sublistView(processedBytes);
                        } else {
                          //TODO() handle nul exception.
                        }
                        //TODO() remove calling context from async gap, this can cause potential bugs in production environment.
                        Navigator.of(localContext).pop();
                      },
                      child: const Text("Save"),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      });
  return byteData;
}