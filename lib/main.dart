import 'package:flutter/material.dart';
import 'dart:async';

import 'package:instagram1/log%20in%20page/login.dart';
import 'package:instagram1/theme/theme_provired.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvired(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvired>(context).themeData,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Splash screen uchun vaqt belgilash (2 soniya)
    Timer(const Duration(seconds: 2), () {
      // Loadingdan keyin asosiy sahifaga o'tadi
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Loading ekranda logotip yoki boshqa elementlar
            Padding(
              padding: const EdgeInsets.only(top: 250),
              child: Container(
                width: 100,
                height: 100,
                child: Image.asset("images1/tnstagramlogo.png"),
              ),
            ),
            SizedBox(
              height: 180,
            ),
            Text(
              'Instagram',
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: "insta",
              ),
            ), // Loading animatsiyasi
            
          ],
        ),
      ),
    );
  }
}
