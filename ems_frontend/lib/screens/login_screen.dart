import 'package:ems_frontend/api/api_services.dart';
import 'package:ems_frontend/reusables/contants_variables.dart';
import 'package:ems_frontend/screens/home_screen.dart';
import 'package:ems_frontend/screens/register_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;
  bool passwordVisible = true;
  void login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      await ApiServices()
          .login(
              username: usernameController.text,
              password: passwordController.text)
          .then(
        (value) {
          setState(() {
            isLoading = false;
          });
          if (value['message'] == 'success') {
            if (mounted) {
              Navigator.pushReplacement(
                  context, MyCustomPageRoute(route: const HomeScreen()));
            }
          } else {
            if (mounted) {
              showCustomSnackbar(
                context: context,
                textContent: value['message'].toString(),
              );
            }
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            appName,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          Text(
                            "Employee Management System",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ],
                      ),
                      const Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                    ],
                  ),
                  Text(
                    'Login to access . . .',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontSize: 40),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    hintText: 'username',
                    textController: usernameController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    hintText: 'password',
                    obscureText: passwordVisible,
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                        icon: passwordVisible
                            ? Icon(
                                Icons.visibility,
                                color: backgroundColor,
                              )
                            : Icon(Icons.visibility_off,
                                color: backgroundColor)),
                    textController: passwordController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    btnChild: Text(
                      isLoading ? 'Please Wait...' : 'Login',
                      textAlign: TextAlign.center,
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: backgroundColor,
                                fontSize: 50,
                              ),
                    ),
                    onTap: () {
                      login();
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MyCustomPageRoute(route: const RegisterScreen()));
                        },
                        child: Text(
                          'Register here',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
