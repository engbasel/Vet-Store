import 'package:shared_preferences/shared_preferences.dart';

oldgetprefs() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var username = preferences.getString('username');

  print('USer name and password saved in local storge');
  print('===========================================');
  print(username);
  print('===========================================');
}
// -------------------------------------------------------

getprefs({
  email,
  username,
  cityname,
  animaltype,
  phone,
}) async {
  String? username;
  String? phone;
  String? email;
  String? animaltype;
  String? cityname;

  SharedPreferences preferences = await SharedPreferences.getInstance();

  username = preferences.getString('username');
  phone = preferences.getString('phone');
  animaltype = preferences.getString('animaltype');
  cityname = preferences.getString('cityname');
  email = preferences.getString('email');

  print('===========================================');
  print(username);
  print('===========================================');

  print('===========================================');
  print(phone);
  print('===========================================');

  print('===========================================');
  print(cityname);
  print('===========================================');

  print('===========================================');
  print(email);
  print('===========================================');

  print('===========================================');
  print(animaltype);
  print('===========================================');
}
