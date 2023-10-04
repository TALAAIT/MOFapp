import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:syncfusion_flutter_pdf/pdf.dart';

///This function gets the filepath to the filesystem then reads [signatureData] as list bytes
///and apply the position statically after applying the .


//TODO() Dynamic positioning.
//TODO() Interactive onScroll on dragging the signature to the next page.
//TODO() creating new filepath on the system to make a copy from the original pdf to avoid overwriting the original PDF.

Future<void> addSignatureToPdf(ByteData? signatureData, String filePath) async {
  final PdfDocument document = PdfDocument(inputBytes: File(filePath).readAsBytesSync());

  final PdfBitmap signatureBitmap = PdfBitmap(
      signatureData!.buffer.asUint8List()
  );

  document.pages[0].graphics.drawImage(
      signatureBitmap, const Rect.fromLTWH(50, 50, 300, 300)
  );

  List<int> bytes = await document.save();

  File(filePath).writeAsBytesSync(bytes);

  document.dispose();
}
