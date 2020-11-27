import 'dart:convert';
import 'package:app/store/main_store.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HttpService {
  final url = "http://localhost:3000";

  getList(String path) async {
    http.Response res = await http.get(url + path);
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      return body;
    } else {
      throw 'cant get';
    }
  }

  post(String path, String model) async {
    var body = store[model];
    print(body);
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // var token = prefs.getString('access_token');

    // http.Response res = await http.post(
    //   url + path,
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //     'authorization': 'Bearer ' + token,
    //   },
    //   body: jsonEncode(body),
    // );

    // if (res.statusCode == 200) {
    //   var body = jsonDecode(res.body);
    //   return body;
    // } else {
    //   throw 'cant post';
    // }
  }

  login(String model) async {
    var body = store[model].obj;
    http.Response res = await http.post(
      url + '/login',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    );
    var resBody = jsonDecode(res.body);
    var code = resBody['code'];
    if (code == 200) {
      var data = resBody['data'];
      var token = data['access_token'];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('access_token', token);
      print(token);
    }
  }
}
