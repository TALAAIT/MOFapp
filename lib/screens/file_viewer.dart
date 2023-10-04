import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import '../util/pdf_merge_signature.dart';
import '../widgets/signature_pad.dart';

class FileViewerScreen extends StatefulWidget {
  final String filePath;



  FileViewerScreen({super.key, required this.filePath});

  @override
  _FileViewerScreenState createState() => _FileViewerScreenState();
}

class _FileViewerScreenState extends State<FileViewerScreen> {
  late PDFViewController pdfController;
  int pages = 0;
  int currentPage = 0;
   GlobalKey _pdfKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('pdf viewer'),
        actions: [
          IconButton(
            icon: const Icon(
                Icons.arrow_upward
            ),
            onPressed: () {
              pdfController.setPage(currentPage - 1);
            },
          ),
          IconButton(
            icon: const Icon(Icons.arrow_downward),
            onPressed: () {
              pdfController.setPage(currentPage + 1);
            },
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              final signatureData = await
              captureSignature(context);

              //This add signature on the pdf.
              if (signatureData != null) {
                await addSignatureToPdf(signatureData, widget.filePath);
                setState(() {
                  _pdfKey = GlobalKey();
                });
              } else {
                //TODO() error handling.
              }

            },
          )
        ],
      ),
      body: PDFView(
        key: _pdfKey,
        filePath: widget.filePath,
        onViewCreated: (controller) {
          pdfController = controller;
        },
        onPageChanged: (current, total) {
          setState(() {
            currentPage = current!;
            pages = total!;
          });
        },
      ),
    );
  }
}