import 'package:ems_frontend/reusables/contants_variables.dart';
import 'package:ems_frontend/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  bool passwordVisible = true;
  final usernameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final dateJoinedController = TextEditingController();
  final dobController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();
  void datePicker(BuildContext context,
      {required TextEditingController controller}) async {
    final rawDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2024),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
            data: ThemeData().copyWith(
              colorScheme: ColorScheme.dark(
                primary: headingTextColor!,
                surface: backgroundColor,
                onSurface: headingTextColor!,
              ),
            ),
            child: child!);
      },
    );
    final parsedDate = DateFormat('yyyy-MM-dd');
    final formatDate = parsedDate.format(rawDate!);
    setState(() {
      controller.text = formatDate.toString();
    });
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
                    'Register here . . .',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontSize: 40),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    hintText: 'First Name',
                    textController: firstNameController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    hintText: 'Last Name',
                    textController: lastNameController,
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
                    hintText: 'email',
                    textController: emailController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    readOnly: true,
                    hintText: 'Joining Date',
                    textController: dateJoinedController,
                    suffixIcon: IconButton(
                      onPressed: () {
                        datePicker(context, controller: dateJoinedController);
                      },
                      icon: Icon(
                        Icons.calendar_view_month_sharp,
                        color: backgroundColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    readOnly: true,
                    hintText: 'Date of Birth',
                    textController: dobController,
                    suffixIcon: IconButton(
                      onPressed: () {
                        datePicker(context, controller: dobController);
                      },
                      icon: Icon(
                        Icons.calendar_view_month_sharp,
                        color: backgroundColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    hintText: 'Address',
                    textController: addressController,
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
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off)),
                    textController: passwordController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    btnChild: Text(
                      'Register',
                      textAlign: TextAlign.center,
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: backgroundColor,
                                fontSize: 50,
                              ),
                    ),
                    onTap: () {
                      //
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text(
                        'Already have an account?',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return const LoginScreen();
                            },
                          ));
                        },
                        child: Text(
                          'Login instead',
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
