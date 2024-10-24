import 'package:flutter/material.dart';

Color backgroundColor = const Color(0xff0d0d0d);
String appName = 'EMS';
Color? headingTextColor = Colors.grey[200];
OutlineInputBorder borderTextField = OutlineInputBorder(
  borderRadius: BorderRadius.circular(0),
  borderSide: BorderSide.none,
);


class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.btnName,
  });
  final Function() onTap;
  final String btnName;
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
        child: Text(
          btnName,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: backgroundColor,
                fontSize: 50,
              ),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textController,
    this.suffixIcon,
  });
  final String hintText;
  final Widget? suffixIcon;
  final TextEditingController textController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      style: TextStyle(
        color: backgroundColor,
        fontSize: 19,
      ),
      decoration: InputDecoration(
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
