import 'package:ems_frontend/api/api_services.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void login() async {
    await ApiServices().login(username: 'anuj', password: 1234).then(
      (value) {
        if (value['message'] == 'success') {
          setState(() {
            centerText = '${value['access']}\n${value['refresh']}';
          });
        } else {
          setState(() {
            centerText = value['message'].toString();
          });
        }
      },
    );
  }

  String centerText = 'Loading...';

  @override
  void initState() {
    super.initState();
    login();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Text(centerText),
      ),
    );
  }
}
