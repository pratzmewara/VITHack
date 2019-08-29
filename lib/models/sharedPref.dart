import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class SharedPreferencesTest {

 Future<String>  getPersonName() async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();

   final key = 'PersonName';
   String value = prefs.getString(key);
   return value;
 }

 setPersonName(String value) async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();

   final key = 'PersonName';
   prefs.setString(key, value);
   print('saved $value');
   prefs.setString("PersonName", value);
 }

  Future<String>  getPersonID() async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();

   final key = 'PersonID';
   String value = prefs.getString(key);
   return value;
 }

 setPersonID(String value) async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();

   final key = 'PersonID';
   prefs.setString(key, value);
   print('saved $value');
   prefs.setString("PersonID", value);
 }

  Future<bool>  getLogincheck() async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();

   final key = 'logincheck';
   bool value = prefs.getBool(key);
   return value;
 }

 setLogincheck(bool value) async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();

   final key = 'logincheck';

   prefs.setBool(key, value);
   print('saved $value');
   prefs.setBool("logincheck", value);
 }
}