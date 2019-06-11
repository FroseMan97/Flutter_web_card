import 'package:flutter_web/material.dart';

import 'main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale.fromSubtags(countryCode: 'RU'),
   
      title: 'Сайт Сергея Лазарева',
   
      home: MainPage(),
    );
  }
}
