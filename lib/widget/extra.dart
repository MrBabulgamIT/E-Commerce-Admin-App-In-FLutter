import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:e__commerce/http/customehttp.dart';
import 'package:e__commerce/widget/showtoast.dart';
import 'package:e__commerce/widget/textfromfiled.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class Extraaa extends StatefulWidget {
  const Extraaa({
    Key? key,
  }) : super(key: key);

  @override
  State<Extraaa> createState() => _ExtraaaState();
}

class _ExtraaaState extends State<Extraaa> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confrimPasswordController = TextEditingController();

  Future<bool> cheek() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      return true;
    }
    return false;
  }

  getRegisterr() async {
    cheek().then((internet) async {
      if (internet != null) {
        var map = Map<String, dynamic>();

        map["name"] = nameController.text.toString();
        map["email"] = nameController.text.toString();
        map["password"] = nameController.text.toString();
        map["password_confirmation"] = nameController.text.toString();

        var response = await http.post(
            Uri.parse(
                "https://apihomechef.antopolis.xyz/api/admin/create/new/admin"),
            body: map,
            headers: CustomeHttpRequest.defaultHeader);

        print("${response.body}");

        final data = jsonDecode(response.body);
        if (response.statusCode == 200) {
          showToast("Registration is Succesfull");
        } else {
          showToast("Registration Failed");
        }
      } else {
        showToast("Cheek Internet Coneection");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 50,
        ),
        CustomeTextField(
          lebelText: "Name",
          controller: nameController,
        ),
        SizedBox(
          height: 10,
        ),
        CustomeTextField(
          lebelText: "Email",
          controller: emailController,
        ),
        SizedBox(
          height: 10,
        ),
        CustomeTextField(
          lebelText: "Password",
          controller: passwordController,
        ),
        SizedBox(
          height: 10,
        ),
        CustomeTextField(
          lebelText: "Confirm Password",
          controller: confrimPasswordController,
        ),
        SizedBox(
          height: 10,
        ),
        MaterialButton(
          onPressed: () {
            getRegisterr();
          },
          child: Text("Sign Up"),
        )
      ],
    ));
  }
}
