import 'package:e__commerce/widget/brandcolors.dart';
import 'package:e__commerce/widget/textfromfiled.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class screenRegistration extends StatelessWidget {
  const screenRegistration({
    Key? key,
    required this.NameController,
    required this.emailController,
    required this.passwordController,
    required this.rePasswordController,
    required this.contectController,
    required this.fromkey,
  }) : super(key: key);

  final TextEditingController NameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController rePasswordController;
  final TextEditingController contectController;
  final GlobalKey<FormState> fromkey;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
