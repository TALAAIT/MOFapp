import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talla_pdf/util/file_util.dart';

class SendDocument extends StatefulWidget {

  const SendDocument({super.key});

  @override
  State<SendDocument> createState() => _SendDocumentState();
}

class _SendDocumentState extends State<SendDocument> {

  final FileUtil fileUtil = FileUtil();
  bool isFilePicked  = false;

  @override
  Widget build(BuildContext context) {
    const buttonSize = Size(200, 60);


    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF103357),
        title: const Text(
          '',
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              'assets/images/ministrylogo.png',
              width: 150,
              height: 150,
            ),
          ),
          const SizedBox(height: 100),
          SizedBox(
            width: buttonSize.width,
            height: buttonSize.height,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 250, 219, 151), backgroundColor: const Color(0xFF103357),
                textStyle: const TextStyle(fontSize: 18),
              ),
              onPressed: () {
                fileUtil.pickedFile().then((pickedFile) {

                  if (pickedFile != null) {
                    print( "file path result : $pickedFile");
                    setState(() {
                      isFilePicked = true;
                    });

                    //TODO() to pass the filepath of the pdf and retrieve it in the next destination.

                  } else {
                    //TODO() Add appropriate error handling.
                  }
                });
              },
              child: const Text('pick a file'),
            ),
          ),
          const SizedBox(height: 20),
          if (isFilePicked)
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.file_copy),
                Text('Picked File.'),
              ],
            ),
        ],
      ),
    );
  }
}
