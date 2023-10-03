import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SendDocument extends StatelessWidget {
  const SendDocument({super.key});

  @override
  Widget build(BuildContext context) {
    final buttonSize = Size(200, 60); // حجم الزرين

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF103357),
        title: const Text(
          ' قائمة المستندات',
          style: TextStyle(fontSize: 24), // حجم النص
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              'assets/images/pic1.png',
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
                primary: Color(0xFF103357), // لون الزر
                onPrimary: Color.fromARGB(255, 250, 219, 151), // لون النص على الزر
                textStyle: TextStyle(fontSize: 18), // حجم النص على الزر
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) =>
                      //TODO() implement the functionality to open the form.
                    const Placeholder()
                  ),
                );
              },
              child: Text('ملف جديد'),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: buttonSize.width,
            height: buttonSize.height,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF103357), // لون الزر
                onPrimary: Color.fromARGB(255, 250, 219, 151),// لون النص على الزر
                textStyle: TextStyle(fontSize: 18), // حجم النص على الزر
              ),
              onPressed: () { Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) =>
                    //TODO() implement the functionality to view the document.
                      const Placeholder()
                ),
              );
              },
              child: const Text('الملفات'),
            ),
          ),
        ],
      ),
    );
  }
}
