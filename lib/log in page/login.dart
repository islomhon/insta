import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram1/log%20in%20page/ikkinshilogin.dart';
import 'package:instagram1/theme/theme_provired.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  // Check if user is already logged in
  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    });

    if (isLoggedIn) {
      // Navigate to the next page if already logged in
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => loginstatus()),
      );
    }
  }

  // Save login status to SharedPreferences
  Future<void> saveLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeProvired>(context).isDarkmoode;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Provider.of<ThemeProvired>(context, listen: false)
                            .toogleTheme();
                      },
                      child: Icon(
                        isDarkMode ? CupertinoIcons.moon_fill : Icons.sunny,
                        size: 35,
                      ),
                    ),
                    CupertinoSwitch(
                      value: isDarkMode,
                      onChanged: (value) {
                        Provider.of<ThemeProvired>(context, listen: false)
                            .toogleTheme();
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                Text(
                  'Instagram',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontFamily: "insta",
                  ),
                ),
                SizedBox(height: 50),
                CircleAvatar(
                  radius: 65,
                  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      image: DecorationImage(
                        image: AssetImage("images/i31.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "gaa_bi_sgm",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 30),
                Container(
                  width: 330,
                  height: 50,
                  child: Center(
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () async {
                          await saveLoginStatus(); // Save login status
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => loginstatus(),
                            ),
                          );
                        },
                        child: Text(
                          'Log in',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "Switch accounts",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 90,
            child: Column(
              children: [
                Divider(
                  color: Colors.grey,
                  thickness: 2,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Sign up.",
                        style: TextStyle(
                          fontSize: 13,
                          decoration: TextDecoration.underline,
                          decorationThickness: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
