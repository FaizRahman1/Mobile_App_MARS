import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<void> signUp(String email, String password) async {
  final response = await http.post(
    Uri.parse('https://your-backend-url/signup'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    // User successfully registered
  } else {
    // Handle errors
  }
}

Future<void> signIn(String? email, String? password) async {
  final response = await http.post(
    Uri.parse('https://mars-mobile.azurewebsites.net/api/Login/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': email.toString(),
      'password': password.toString(),
    }),
  );

  if (response.statusCode == 200) {
    final sessionData = jsonDecode(response.body);
    print("sampai 200");
    // Store session data on the client-side
    await storeSessionData(sessionData);
  } else {
    print(response.statusCode);
  }
}

Future<void> storeSessionData(Map<String, dynamic> sessionData) async {
  final token = sessionData['token'] as String?;
  if (token != null) {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('user_token', token);
  } else {
    throw Exception('Token is null or missing in session data');
  }
}

Future<String?> getUserToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('user_token');
}

void navigateToNextScreen(BuildContext context) async {
  final userToken = await getUserToken();
  if (userToken != null) {
    // User is logged in, navigate to a home screen
    Navigator.of(context).pushReplacementNamed('/home');
  } else {
    // User is not logged in, navigate to a login screen
    Navigator.of(context).pushReplacementNamed('/login');
  }
}

Future<void> clearSessionData() async {
  final prefs = await SharedPreferences.getInstance();

  // Remove the session data
  await prefs.remove(
      'user_token'); // Replace 'user_token' with your session data key(s)
}
