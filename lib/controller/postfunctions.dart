import 'dart:convert';
import 'dart:io';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:clinic_app/controller/sharedpreferences.dart';

//String url = "http://192.168.1.21:9000/api/";
String url = "http://127.0.0.1:8000/api/";

Future<void> postlogin(
    String email, String password, BuildContext context) async {
  http.Response response = await http.post(
    Uri.parse('${url}login'),
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    if (jsonDecode(response.body)['is_expert'] == 0) {
      Navigator.of(context).pushReplacementNamed('user homepage');
    } else {
      Navigator.of(context).pushReplacementNamed('expert homepage');
    }
    await savetoken(jsonDecode(response.body)['access_token']);
    return;
  } else if (response.statusCode == 404) {
    if (jsonDecode(response.body)['message'] == "Invalid Password") {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(jsonDecode(response.body)['message'])));
    }
    if (jsonDecode(response.body)['message'] == "Account Not Found") {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Account Not Found')));
    }
    return;
  } else {
    throw Exception((e) => log(e));
  }
}

Future<void> postusersignup(String name, String email, String password,
    int phone, int isexpert, int wallet, BuildContext context) async {
  http.Response response = await http.post(
    Uri.parse('${url}register'),
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'phone_number': phone,
      'balance': wallet,
      'is_expert': isexpert,
    }),
  );

  if (response.statusCode == 200) {
    Navigator.of(context).pushReplacementNamed("user homepage");
    await savetoken(jsonDecode(response.body)['access_token']);
    return;
  }
  if (response.statusCode == 422) {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('The email has already been taken.')));
    return;
  } else {
    throw Exception((e) => log(e));
  }
}

Future<void> postexpertsignup(
    String name,
    String email,
    String password,
    int phone,
    int isexpert,
    int wallet,
    String address,
    String experience,
    BuildContext context) async {
  http.Response response = await http.post(
    Uri.parse('${url}register'),
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'phone_number': phone,
      'balance': wallet,
      'is_expert': isexpert,
      'experience': experience,
      'address': address,
    }),
  );
  if (response.statusCode == 200 || response.statusCode == 201) {
    Navigator.of(context).pushReplacementNamed("expert homepage");
    await savetoken(jsonDecode(response.body)['access_token']);
    return;
  }
  if (response.statusCode == 422) {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('The email has already been taken.')));
    return;
  } else {
    throw Exception((e) => log(e));
  }
}

Future<void> postexpertsignupwithimage(
    String name,
    String email,
    String password,
    int phone,
    int isexpert,
    int wallet,
    String address,
    String experience,
    File image,
    BuildContext context) async {
  var headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };
  var request = http.MultipartRequest('POST', Uri.parse('${url}register'));
  request.fields.addAll({
    'name': name,
    'email': email,
    'password': password,
    'phone_number': phone.toString(),
    'balance': wallet.toString(),
    'is_expert': '1',
    'experience': experience,
    'address': address
  });
  request.files.add(await http.MultipartFile.fromPath('image', image.path));
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    Navigator.of(context).pushReplacementNamed("expert homepage");
    await savetoken(
        jsonDecode(await response.stream.bytesToString())['access_token']);
    log(jsonDecode(await response.stream.bytesToString())['access_token']);
    return;
  }
  if (response.statusCode == 422) {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('The email has already been taken.')));
    return;
  } else {
    log(response.reasonPhrase!);
  }
}

Future<void> postaddtime(String day, String from, String to) async {
  SharedPreferences gettoken = await SharedPreferences.getInstance();
  http.Response response = await http.post(
    Uri.parse('${url}register'),
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${gettoken.getString('access_token')}',
    },
    body: jsonEncode(<String, dynamic>{
      'day': day,
      'start_hour': from,
      'end_hour': to,
    }),
  );
  if (response.statusCode == 200 || response.statusCode == 201) {
    return;
  } else {
    throw Exception((e) => log(e));
  }
}

Future<void> postaddmoreservices(
    int price1, int price2, int price3, int price4, int price5) async {
  SharedPreferences gettoken = await SharedPreferences.getInstance();
  http.Response response = await http.post(
    Uri.parse('${url}services2'),
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${gettoken.getString('access_token')}',
    },
    body: jsonEncode(<String, dynamic>{
      'price1': price1,
      'price2': price2,
      'price3': price3,
      'price4': price4,
      'price5': price5,
    }),
  );
  if (response.statusCode == 200 || response.statusCode == 201) {
    return;
  } else {
    throw Exception((e) => log(e));
  }
}
