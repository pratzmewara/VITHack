import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class SharedPreferencesTest {

//  Future<bool> getLoginCheck() async{
//    final SharedPreferences prefs = await SharedPreferences.getInstance();
//
//    final key = 'check';
//    bool value = prefs.getBool(key);
//    return value;
//  }
//
//  setLoginCheck(bool value) async{
//    final SharedPreferences prefs = await SharedPreferences.getInstance();
//
//    final key = 'check';
//    prefs.setBool(key, value);
//
//  }

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

 }

 Future<String>  getEmail() async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();

   final key = 'email';
   String value = prefs.getString(key);
   return value;
 }

 setEmail(String value) async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();

   final key = 'email';
   prefs.setString(key, value);
 }
 Future<String>  getToken() async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();

   final key = 'token';
   String value = prefs.getString(key);
   return value;
 }

 setToken(String value) async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();

   final key = 'token';
   prefs.setString(key, value);
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

  Future<String>  getLogincheck() async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();

   final key = 'logincheck';
   String value = prefs.getString(key);
   return value;
 }

 setLogincheck(String value) async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();

   final key = 'logincheck';

   prefs.setString(key, value);

 }
}