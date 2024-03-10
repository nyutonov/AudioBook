import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utills/constants/utils.dart';

class SharedPreferenceService {
  static setUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('is_login', true);
    await prefs.setString('user_name', user.displayName ?? '');
    await prefs.setString('email', user.email ?? '');
    await prefs.setString('photo', user.photoURL ?? '');
  }

  static getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    CurrentUser.isLogin = prefs.getBool('is_login') ?? false;
    CurrentUser.userName = prefs.getString('user_name') ?? '';
    CurrentUser.email = prefs.getString('email') ?? '';
    CurrentUser.photo = prefs.getString('photo') ?? '';
  }
}