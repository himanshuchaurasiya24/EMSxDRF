import 'package:flutter/material.dart';

Color backgroundColor = const Color(0xff0d0d0d);
String appName = 'EMS';
Color? headingTextColor = Colors.grey[200];

OutlineInputBorder borderTextField = OutlineInputBorder(
  borderRadius: BorderRadius.circular(0),
  borderSide: BorderSide.none,
);
void showCustomSnackbar({
  required BuildContext context,
  required String textContent,
  Color? backgroundColorPara,
  int? durationInSec,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: headingTextColor,
      duration: Duration(seconds: durationInSec ?? 3),
      content: Text(
        textContent,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: backgroundColorPara ?? backgroundColor),
      ),
      showCloseIcon: true,
      closeIconColor: backgroundColor,
    ),
  );
}

class MyCustomPageRoute extends PageRouteBuilder {
  final Widget route;
  MyCustomPageRoute({required this.route})
      : super(
          pageBuilder: (
            context,
            animation,
            secondaryAnimation,
          ) {
            return route;
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 500),
        );
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.btnChild,
  });
  final Function() onTap;
  final Widget btnChild;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: MediaQuery.of(context).size.height / 10.5,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: headingTextColor,
          ),
          child: btnChild),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textController,
    this.suffixIcon,
    this.readOnly,
    this.obscureText,
  });
  final String hintText;
  final Widget? suffixIcon;
  final bool? readOnly;
  final bool? obscureText;
  final TextEditingController textController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      style: TextStyle(
        color: backgroundColor,
        fontSize: 19,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$hintText required';
        }
        return null;
      },
      readOnly: readOnly ?? false,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
          errorStyle: TextStyle(
            color: headingTextColor,
            fontSize: 15,
          ),
          hintText: hintText,
          suffixIcon: suffixIcon,
          hintStyle: TextStyle(
            color: backgroundColor,
          ),
          border: borderTextField,
          filled: true,
          fillColor: headingTextColor,
          enabledBorder: borderTextField,
          focusedBorder: borderTextField),
    );
  }
}
