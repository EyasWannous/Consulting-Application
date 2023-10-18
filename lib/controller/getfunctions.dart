import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:clinic_app/controller/sharedpreferences.dart';
import 'package:clinic_app/models/consultsforexpert_model.dart';
import 'package:clinic_app/models/expertsearch_model.dart';
import 'package:clinic_app/models/favexpertslist_model.dart';
import 'package:clinic_app/models/myprofile_model.dart';

import '../Screens/user_homepage.dart';
import '../models/consultsfromuser_model.dart';
import '../models/expertlist_model.dart';
import '../models/expertprofilebyid_model.dart';

//String url = "http://192.168.1.21:9000/api/";
String url = "http://127.0.0.1:8000/api/";

Future<void> getlogout(BuildContext context) async {
  SharedPreferences gettoken = await SharedPreferences.getInstance();
  http.Response response = await http.get(
    Uri.parse('${url}logout'),
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${gettoken.getString('access_token')}',
    },
  );

  if (response.statusCode == 200) {
    Navigator.of(context).pushReplacementNamed("back to login");
  } else {
    throw Exception((e) => log(e));
  }
}

Future<List<ServicesByCatId>> getexpertsincat(int id) async {
  SharedPreferences gettoken = await SharedPreferences.getInstance();
  List<ServicesByCatId> listServicesByCatId = [];
  // List<String> listexperts = [];
  // List<String> listexpertsid = [];
  ServicesByCatId servicesByCatId;
  http.Response response =
      await http.get(Uri.parse('${url}categories/$id/services'), headers: {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${gettoken.getString('access_token')}',
  });
  if (response.statusCode == 200) {
    var allData = EData.fromJson(json.decode(response.body));
    for (var item in allData.data!) {
      servicesByCatId = ServicesByCatId(
          expertId: item.expertId,
          userName: item.expert?.user?.name,
          categoryName: item.category?.name,
          price: item.price,
          imagePath: item.expert?.imagePath);
      listServicesByCatId.add(servicesByCatId);
      // listexperts.add((item.expert?.user?.name).toString()); //For Search
      // listexpertsid.add(item.expertId.toString());
    }
    // await saveexperts(listexperts);
    // await saveexpertsid(listexpertsid);
    return listServicesByCatId;
  } else {
    throw Exception((e) => log(e));
  }
}

Future<List<ExpertSearch>> getexpertsincatforsearch(int id) async {
  SharedPreferences gettoken = await SharedPreferences.getInstance();
  List<ExpertSearch> listexperts = [];
  ExpertSearch expertsearch;
  http.Response response =
      await http.get(Uri.parse('${url}categories/$id/services'), headers: {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${gettoken.getString('access_token')}',
  });
  if (response.statusCode == 200) {
    var allData = EData.fromJson(json.decode(response.body));
    for (var item in allData.data!) {
      expertsearch = ExpertSearch(
          name: (item.expert?.user?.name).toString(), id: item.expertId);
      listexperts.add(expertsearch);
    }
    return listexperts;
  } else {
    throw Exception((e) => log(e));
  }
}

Future<ExpertProfileFormUser> getexpertprofilebyid(int id) async {
  SharedPreferences gettoken = await SharedPreferences.getInstance();
  // log(token);
  ExpertProfileFormUser expertProfileFormUser;
  http.Response response = await http.get(
    Uri.parse('${url}experts/$id'),
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${gettoken.getString('access_token')}',
    },
  );

  if (response.statusCode == 200) {
    var exdata = ExpertProfileById.fromJson(jsonDecode(response.body));
    expertProfileFormUser = ExpertProfileFormUser(
        isFavourite: exdata.isFavourite,
        rating: exdata.rating,
        address: exdata.data?.address,
        imagePath: exdata.data?.imagePath,
        experience: exdata.data?.experience,
        name: exdata.data?.user?.name,
        email: exdata.data?.user?.email,
        phoneNumber: exdata.data?.user?.phoneNumber,
        balance: exdata.data?.user?.balance);
    return expertProfileFormUser;
  } else {
    throw Exception((e) => log(e));
  }
}

Future<List<FavExpertsToShow>> getfavexperts() async {
  SharedPreferences gettoken = await SharedPreferences.getInstance();
  List<FavExpertsToShow> expertstoshow = [];
  FavExpertsToShow expertToShow;
  http.Response response = await http.get(
    Uri.parse('${url}favourites'),
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${gettoken.getString('access_token')}',
    },
  );

  if (response.statusCode == 200) {
    var favdata = FavExperts.fromJson(jsonDecode(response.body));
    for (var item in favdata.data!) {
      expertToShow = FavExpertsToShow(
          expertId: int.parse(item.expertId.toString()),
          imagePath: (item.expert?.imagePath).toString(),
          name: item.expert?.user?.name.toString());
      expertstoshow.add(expertToShow);
    }
    return expertstoshow;
  } else {
    throw Exception((e) => log(e));
  }
}

Future<int> getbalance() async {
  SharedPreferences gettoken = await SharedPreferences.getInstance();
  http.Response response = await http.get(
    Uri.parse('${url}profile'),
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${gettoken.getString('access_token')}',
    },
  );

  if (response.statusCode == 200) {
    log(jsonDecode(response.body)["data"]["balance"]);
    //await savebalance(jsonDecode(response.body)["data"]["balance"]);
    balance = jsonDecode(response.body)["data"]["balance"];
    return jsonDecode(response.body)["data"]["balance"];
  } else {
    throw Exception((e) => log(e));
  }
}

Future<List<ConsultsToShow>> gethistoryconsults() async {
  SharedPreferences gettoken = await SharedPreferences.getInstance();
  Consults consults;
  List<ConsultsToShow> listtoshow = [];
  ConsultsToShow toShow;
  http.Response response = await http.get(
    Uri.parse('${url}taken_consults'),
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${gettoken.getString('access_token')}',
    },
  );

  if (response.statusCode == 200) {
    consults = Consults.fromJson(jsonDecode(response.body));
    for (var item in consults.data!) {
      if (item.isCompleted != 1) continue;
      toShow = ConsultsToShow(
          expertId: item.expertId,
          categoryId: item.categoryId,
          appointment: item.appointment,
          isCompleted: item.isCompleted,
          rating: item.rating,
          name: item.expert?.user?.name,
          imagePath: item.expert?.imagePath,
          catergoryName: item.category?.name);
      listtoshow.add(toShow);
    }
    return listtoshow;
  } else {
    throw Exception((e) => log(e));
  }
}

Future<List<ConsultsToShow>> getpendingconsults() async {
  SharedPreferences gettoken = await SharedPreferences.getInstance();
  Consults consults;
  List<ConsultsToShow> listtoshow = [];
  ConsultsToShow toShow;
  http.Response response = await http.get(
    Uri.parse('${url}taken_consults'),
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${gettoken.getString('access_token')}',
    },
  );

  if (response.statusCode == 200) {
    consults = Consults.fromJson(jsonDecode(response.body));
    for (var item in consults.data!) {
      if (item.isCompleted != 0) continue;
      toShow = ConsultsToShow(
          expertId: item.expertId,
          categoryId: item.categoryId,
          appointment: item.appointment,
          isCompleted: item.isCompleted,
          rating: item.rating,
          name: item.expert?.user?.name,
          imagePath: item.expert?.imagePath,
          catergoryName: item.category?.name);
      listtoshow.add(toShow);
    }
    return listtoshow;
  } else {
    throw Exception((e) => log(e));
  }
}

Future<MyProfileToShow> getmyprofile() async {
  SharedPreferences gettoken = await SharedPreferences.getInstance();
  http.Response response = await http.get(
    Uri.parse('${url}profile'),
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${gettoken.getString('access_token')}',
    },
  );

  if (response.statusCode == 200) {
    MyProfile myProfile = MyProfile.fromJson(jsonDecode(response.body));
    MyProfileToShow myProfileToShow = MyProfileToShow(
        address: myProfile.data?.address,
        imagePath: myProfile.data?.imagePath,
        email: myProfile.data?.user?.email,
        experience: myProfile.data?.experience,
        name: myProfile.data?.user?.name,
        phoneNumber: myProfile.data?.user?.phoneNumber,
        balance: myProfile.data?.user?.balance);
    return myProfileToShow;
  } else {
    throw Exception((e) => log(e));
  }
}

Future<List<ConsultsForExpertToShow>> getpendingconsultsforexpert() async {
  SharedPreferences gettoken = await SharedPreferences.getInstance();
  ConsultsForExpert consultsForExpert;
  List<ConsultsForExpertToShow> listtoshow = [];
  ConsultsForExpertToShow toShow;
  http.Response response = await http.get(
    Uri.parse('${url}given_consults'),
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${gettoken.getString('access_token')}',
    },
  );

  if (response.statusCode == 200) {
    consultsForExpert = ConsultsForExpert.fromJson(jsonDecode(response.body));
    for (var item in consultsForExpert.data!) {
      if (item.isCompleted != 0) continue;
      toShow = ConsultsForExpertToShow(
          expertId: item.expertId,
          categoryId: item.categoryId,
          appointment: item.appointment,
          isCompleted: item.isCompleted,
          rating: item.rating,
          name: item.user?.name,
          catergoryName: item.category?.name);
      listtoshow.add(toShow);
    }
    return listtoshow;
  } else {
    throw Exception((e) => log(e));
  }
}

Future<List<ConsultsForExpertToShow>> gethistoryconsultsforexpert() async {
  SharedPreferences gettoken = await SharedPreferences.getInstance();
  ConsultsForExpert consultsForExpert;
  List<ConsultsForExpertToShow> listtoshow = [];
  ConsultsForExpertToShow toShow;
  http.Response response = await http.get(
    Uri.parse('${url}given_consults'),
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${gettoken.getString('access_token')}',
    },
  );

  if (response.statusCode == 200) {
    consultsForExpert = ConsultsForExpert.fromJson(jsonDecode(response.body));
    for (var item in consultsForExpert.data!) {
      if (item.isCompleted != 1) continue;
      toShow = ConsultsForExpertToShow(
          expertId: item.expertId,
          categoryId: item.categoryId,
          appointment: item.appointment,
          isCompleted: item.isCompleted,
          rating: item.rating,
          name: item.user?.name,
          catergoryName: item.category?.name);
      listtoshow.add(toShow);
    }
    return listtoshow;
  } else {
    throw Exception((e) => log(e));
  }
}

Future<String> gettimestobook(DateTime date, int id) async {
  SharedPreferences gettoken = await SharedPreferences.getInstance();
  http.Response response = await http.post(
    Uri.parse('${url}experts/$id/time'),
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${gettoken.getString('access_token')}',
    },
    body: jsonEncode(<String, dynamic>{
      'appointment': (DateFormat.yMd().format(date)).toString(),
    }),
  );
  if (response.statusCode == 200 || response.statusCode == 201) {
    savetime(jsonDecode(response.body)['data']);
    return jsonDecode(response.body)['data'];
  } else {
    throw Exception((e) => log(e));
  }
}

// Future<List<ServicesByCatId>> getallexperts(String token) async {
//   List<ServicesByCatId> listServicesByCatId = [];
//   ServicesByCatId servicesByCatId;
//   http.Response response = await http.get(Uri.parse('${url}experts'), headers: {
//     'Accept': 'application/json',
//     'Content-Type': 'application/json',
//     'Authorization': 'Bearer $token',
//   });
//   if (response.statusCode == 200) {
//     var allData = EData.fromJson(json.decode(response.body));
//     for (Data item in allData.data!) {
//       servicesByCatId = ServicesByCatId(
//           expertId: item.expertId,
//           userName: item.expert?.user?.name,
//           categoryName: item.category?.name,
//           price: item.price,
//           imagePath: item.expert?.imagePath);
//       listServicesByCatId.add(servicesByCatId);
//     }
//     return listServicesByCatId;
//   } else {
//     throw Exception((e) => log(e));
//   }
// }
