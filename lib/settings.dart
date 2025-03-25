import 'package:flutter/material.dart';


class MySettings extends StatelessWidget {
  const MySettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Настройки',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.white,
      ),
      home:  SettingsScreen(),
    );
  }
}



class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isFaceIDEnabled = false;
  bool isPinEnabled = true;
  bool isScreenshotEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
            Navigator.pop(context);
          },
        ),
        title: Text('Настройки'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Handle menu button press
            },
          ),
        ]
              ),
      body: ListView(
        children: [
          Container(height: 10),
          _buildSettingItem("Видимость карт и счетов"),
          _buildSettingItem("Сменить пароль"),
          _buildSettingItem("Сменить номер телефона"),
          _buildSwitchItem("Вход по TouchFace ID", isFaceIDEnabled, (value) {
            setState(() {
              isFaceIDEnabled = value;
            });
          }),
          _buildSwitchItem("Вход по PIN-коду", isPinEnabled, (value) {
            setState(() {
              isPinEnabled = value;
            });
          }),
          _buildSwitchItem("Скриншот и запись экрана", isScreenshotEnabled, (value) {
            setState(() {
              isScreenshotEnabled = value;
            });
          }),
          _buildSettingItem("Язык приложения"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: GestureDetector(
              onTap: () {
                // Логика выхода
              },
              child: Text(
                "Выйти из аккаунта",
                style: TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Divider()
        ],
      ),
    );
  }

  Widget _buildSettingItem(String title) {
    return Column(
      children: [
        ListTile(
          title: Text(title),
          onTap: () {},
        ),
        Divider(height: 1),
      ],
    );
  }

  Widget _buildSwitchItem(String title, bool value, Function(bool) onChanged) {
    return Column(
      children: [
        ListTile(
          title: Text(title),
          trailing: Switch(
            value: value,
            activeColor: Colors.blue,
            onChanged: onChanged,
          ),
        ),
        Divider(height: 1),
      ],
    );
  }
}