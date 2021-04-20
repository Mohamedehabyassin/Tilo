import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tilo/auth/authService.dart';
import 'package:tilo/model/user_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tilo/screen/authenticate/log_in.dart';
import 'package:tilo/screen/authenticate/sign_up.dart';
import 'package:tilo/screen/home/home.dart';
import 'package:tilo/screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {'/SignUpScreen':((context)=>SignUpScreen()),
          '/LoginScreen':((context)=>LoginScreen()),
          '/HomeScreen':((context)=>HomeScreen()),
        },
        home: SplashScreen(),
      ),
    );
  }
}

