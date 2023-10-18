import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

savetoken(String acc) async {
  SharedPreferences token = await SharedPreferences.getInstance();
  token.setString('access_token', acc);
  log(acc);
}

saveexperts(List<String> experts) async {
  SharedPreferences expertsnames = await SharedPreferences.getInstance();
  expertsnames.setStringList('expert_name', experts);
  // print(experts);
}

savebalance(int balance) async {
  SharedPreferences wallet = await SharedPreferences.getInstance();
  wallet.setInt('balance', balance);
  // print(balance);
}

savetime(String times) async {
  SharedPreferences time = await SharedPreferences.getInstance();
  time.setString('time', times);
  // print(balance);
}
// saveexpertsid(List<String> experts) async {
//   SharedPreferences expertsid = await SharedPreferences.getInstance();
//   expertsid.setStringList('expert_id', experts);
//   print(experts);
// }

// gettoken() async {
//   SharedPreferences gettoken = await SharedPreferences.getInstance();
//   gettoken.getString('access_token');
//   // print(gettoken.getString('access_token'));
// }
