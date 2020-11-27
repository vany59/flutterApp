import 'package:app/api.dart';
import 'package:app/components/roundedInput.dart';
import 'package:app/constant.dart';
import 'package:app/store/main_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: COLOR_PRIMARY,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  var api = new HttpService();

  @override
  Widget build(BuildContext context) {
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: COLOR_PRIMARY,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          // api.login('login');
          // api.post('/stock/list', 'test');
          print(store['login']);
        },
        child: Text(
          'LOGIN',
          textAlign: TextAlign.center,
          style: style.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RoundedInput(
                    hint: 'Username',
                    model: 'login',
                    field: 'username',
                    icon: Icon(CupertinoIcons.person),
                  ),
                  SizedBox(height: 25.0),
                  RoundedInput(
                    hint: 'Password',
                    model: 'login',
                    field: 'password',
                    icon: Icon(CupertinoIcons.lock),
                    type: Type.password,
                  ),
                  SizedBox(height: 35.0),
                  loginButon,
                  SizedBox(
                    height: 15.0,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
