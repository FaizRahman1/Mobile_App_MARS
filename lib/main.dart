import 'package:bridgeinsp_new/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MARS - TEMAN INSPECTION',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(title: 'MARS - TEMAN INSPECTION |Login '),
      //initialRoute: "/",
      //onGenerateRoute: RouteGenerator().generateRoute,
      /*home: RepositoryProvider(
        create: (context) => LoginRepository(),
        child: const LoginForm(),
      ),*/
    );
  }
}
