import 'package:flutter_web/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  final String _footerImage =
      'https://www.spiria.com/site/assets/files/2790/flutter-bandeau.-large.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, size) {
          return Container(
            width: size.maxWidth,
            height: size.maxHeight,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _headWidget(size),
                  _bodyWidget(size),
                  _footerWidget(size),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _isSmallScreen(BoxConstraints size) {
    return size.maxWidth > 800 ? false : true;
  }

  _headWidget(BoxConstraints size) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xFF282c4f), Color(0xFF7d69ff)])),
        child: CustomPaint(
          painter: CurvePainter(),
          child: Container(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  flex: 2,
                                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: Image.network(
                      'https://cdn-images-1.medium.com/max/1600/1*TFZQzyVAHLVXI_wNreokGA.png',
                      height: 80,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                  text: 'Сергей ',
                                  style: TextStyle(color: Color(0xff4d86e7)),
                                ),
                                TextSpan(
                                    text: 'Лазарев',
                                    style: TextStyle(color: Color(0xFFe3961c)))
                              ]),
                        ),
                        Text(
                          'Junior',
                          style: TextStyle(
                            color: Colors.white,
                              fontSize: 18,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            height: 180,
          ),
        ),
      ),
    );
  }

  _bodyWidget(BoxConstraints size) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: size.maxWidth,
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xFF282c4f), Color(0xFF7d69ff)])),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
            Center(
                child: Wrap(
              children: _blocks(),
            )),
            Center(
              child: Container(
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, left: 50, right: 50),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    gradient: LinearGradient(
                        colors: [Color(0xff148251), Color(0xFF17c477)])),
                child: Text('Пример приложения на Flutter'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                height: 400,
                padding: EdgeInsets.all(20),
                child: _exampleList(),
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }

  _footerWidget(BoxConstraints size) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            height: size.maxHeight * 0.1,
            width: size.maxWidth,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      _footerImage,
                    )))));
  }

  _picture(String src) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Image.network(src),
    );
  }

  _exampleList() {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        _picture(
            'https://github.com/FroseMan97/Match-Manager/raw/master/screens/Screenshot_1559030901.png'),
        _picture(
            'https://github.com/FroseMan97/Match-Manager/raw/master/screens/Screenshot_1559030557.png'),
        _picture(
            'https://github.com/FroseMan97/Match-Manager/raw/master/screens/Screenshot_1559030805.png'),
        _picture(
            'https://github.com/FroseMan97/Match-Manager/raw/master/screens/Screenshot_1559030820.png'),
        _picture(
            'https://github.com/FroseMan97/Match-Manager/raw/master/screens/Screenshot_1559031869.png'),
      ],
    );
  }

  List<Widget> _blocks() {
    return [
      _textBloc('О себе', _aboutList()),
      _textBloc('Опыт', _experienceList()),
      _textBloc('Профессиональные ожидания', _expectationsList()),
    ];
  }

  _textBloc(String head, List<Widget> list) {
    return Container(
        decoration: BoxDecoration(
          
            color: Color(0xFFe3961c),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(30),
        
        width: 300,
        child: Column(
          children: <Widget>[
            Text(
              head,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto'),
            ),
            Column(children: list)
          ],
        ));
  }

  _aboutList() {
    return [
      ListTile(
        title: Text('Возраст'),
        subtitle: Text(
            '${(DateTime.now().difference(DateTime(1997, 12, 28)).inDays / 365).round()} год'),
      ),
      ListTile(
        title: Text('Образование'),
        subtitle: Text('студент 3 курса ЛЭТИ'),
      )
    ];
  }

  _experienceList() {
    return [
      ListTile(
        title: Text('Flutter'),
        subtitle:
            Text('- BLoC паттерн (MVVM), RxDart\n- попробовал Flutter Web'),
      ),
      ListTile(
        title: Text('Firebase'),
        subtitle: Text('- Firestore\n- Auth'),
      ),
      ListTile(
        title: Text('Java'),
        subtitle: Text(
            '- изучали ООП в универе, писали курсач\n- планирую за лето почитать по Android, а именно Retrofit, Dagger, Rx, применение MVP, MVVM, Life cycles'),
      )
    ];
  }

  _expectationsList() {
    return [
      ListTile(
          subtitle: Text(
              '- получить опыт нативной разработки\n- понять, как правильно проектировать архитектуру приложения\n- узнать, чем отличается iOS и Android разработка\n- попробовать устроиться на работу в известную компанию'))
    ];
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    path.lineTo(0, size.height * 0.85);
    path.quadraticBezierTo(size.width * 0.10, size.height * 0.70,
        size.width * 0.17, size.height * 0.90);
    path.quadraticBezierTo(
        size.width * 0.20, size.height, size.width * 0.25, size.height * 0.90);
    path.quadraticBezierTo(size.width * 0.40, size.height * 0.40,
        size.width * 0.50, size.height * 0.70);
    path.quadraticBezierTo(size.width * 0.60, size.height * 0.85,
        size.width * 0.65, size.height * 0.65);
    path.quadraticBezierTo(
        size.width * 0.70, size.height * 0.90, size.width, 0);
    path.close();

    paint.color = Color(0xFFe3961c);
    canvas.drawPath(path, paint);

    path = Path();
    path.lineTo(0, size.height * 0.50);
    path.quadraticBezierTo(size.width * 0.10, size.height * 0.80,
        size.width * 0.15, size.height * 0.60);
    path.quadraticBezierTo(size.width * 0.20, size.height * 0.45,
        size.width * 0.27, size.height * 0.60);
    path.quadraticBezierTo(
        size.width * 0.45, size.height, size.width * 0.50, size.height * 0.80);
    path.quadraticBezierTo(size.width * 0.55, size.height * 0.45,
        size.width * 0.75, size.height * 0.75);
    path.quadraticBezierTo(
        size.width * 0.85, size.height * 0.93, size.width, size.height * 0.60);
    path.lineTo(size.width, 0);
    path.close();

    paint.color = Color(0xFFd749ba);
    canvas.drawPath(path, paint);

    path = Path();
    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(size.width * 0.10, size.height * 0.55,
        size.width * 0.22, size.height * 0.70);
    path.quadraticBezierTo(size.width * 0.30, size.height * 0.90,
        size.width * 0.40, size.height * 0.75);
    path.quadraticBezierTo(size.width * 0.52, size.height * 0.50,
        size.width * 0.65, size.height * 0.70);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.85, size.width, size.height * 0.60);
    path.lineTo(size.width, 0);
    path.close();

    paint.color = Color(0xFF282c4f);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
