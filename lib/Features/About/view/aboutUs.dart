import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              margin: EdgeInsets.all(12),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "موسوعة أهل البيت عليهم السلام، موسوعة شاملة لسيرة اهل البيت عليهم السلام برمجة وتصميم: دجلة لتقنية المعلومات",
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
            Text("الاصدار: 1.2")
          ],
        ),
      ),
    );
  }
}
