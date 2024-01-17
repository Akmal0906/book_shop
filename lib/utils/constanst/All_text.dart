import 'package:flutter/material.dart';

abstract class AllText {
  static const String splash = 'Welcome to';
  static const String apbar = 'Silver books';
  static const String showMore = 'Show more';
  static const String have = 'Mavjud';
  static const String haveNot = 'Mavjud emas';
  static const String signUp = 'Sign Up';
  static const String signIn = 'Sign In';
  static const String userName = 'UserName';
  static const String email = 'Email';
  static const String password = 'Password';
  static const String repPassword = 'Repeat Password';
  static const String createAccount = 'Create new Account';
  static const String google = 'Google';
  static const String facebook = 'FaceBook';
  static const String enterPassUser = 'Enter password and Username';
  static const String logIn = 'Log In';
  static const String logOut = 'Log out';
  static const String searchTitle = 'Write the title of the book';
  static const String searchState = 'not yet searched';
  static const String wentWrong = 'Went Wrong';
  static const String didNotHave = 'Do not exist data';
  static const String pleaseWait = 'Please waiting';
  static const String didNotAdd = 'not yet added';
  static const String signSuccess = 'you are successully registered';
  static const String or = 'Or';
  static const String haveAccount = 'if you have an account?';
  static const String haveNotAccount = 'Do not have you an account?';
  static const String didNotReg = 'you are not registered yet';
}

List tabbarTexts = ['Ommabop', 'Detektiv', 'Xajviy'];
TextStyle customStyle =
    const TextStyle(color: Colors.black, fontFamily: 'textFont');

List<dynamic> signUserList = ['username', 'password1', 'password2', 'email'];

List<Icon> listIcon = [
  const Icon(Icons.favorite),
  const Icon(Icons.people),
  const Icon(Icons.menu_book_sharp),
  const Icon(Icons.logout_rounded),
];

List<String> listTitle = ['Favorites', 'Friends', 'Free books', 'Log out'];

List<String> listUrl = [
  'https://iambookish.pythonanywhere.com/book/lastbooks/',
  '',
  '',
  'https://iambookish.pythonanywhere.com/book/all'
];
