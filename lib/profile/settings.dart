import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram1/theme/theme_provired.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isAccountOpen = true; // "Ochilgan/yopilgan" akkaunt holati

  @override
  void initState() {
    super.initState();
    _loadAccountStatus();
  }

  Future<void> _loadAccountStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isAccountOpen = prefs.getBool('isAccountOpen') ?? true;
    });
  }

  Future<void> toggleAccountStatus() async {
    setState(() {
      isAccountOpen = !isAccountOpen; // Holatni o'zgartirish
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isAccountOpen', isAccountOpen);
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvired>(
        context); // Providerni optimallashtirib chaqiramiz

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("S E T T I N G S")),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              _buildSettingsTile(
                context: context,
                title: "T H E M E",
                switchValue: themeProvider.isDarkmoode,
                onChanged: (value) => themeProvider.toogleTheme(),
              ),
              const SizedBox(height: 20), // Oraliqni ajratish uchun
              _buildSettingsTile(
                context: context,
                title: isAccountOpen
                    ? "O P E N  A C C O U N T"
                    : "C L O S E D  A C C O U N T",
                switchValue: isAccountOpen,
                onChanged: (value) => toggleAccountStatus(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Kichik `Settings` elementini quruvchi yordamchi funksiya
  Widget _buildSettingsTile({
    required BuildContext context,
    required String title,
    required bool switchValue,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 16)),
          CupertinoSwitch(
            value: switchValue,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
