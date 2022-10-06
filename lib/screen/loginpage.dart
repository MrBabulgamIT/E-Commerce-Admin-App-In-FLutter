import 'dart:convert';

import 'package:e__commerce/http/customehttp.dart';
import 'package:e__commerce/nav_tab_item/bottomnavbar_main.dart';
import 'package:e__commerce/screen/registrationpage.dart';
import 'package:e__commerce/widget/showtoast.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../widget/textfromfiled.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    isLogin();
    // TODO: implement initState
    super.initState();
  }

  String? token;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoding = false;
  String loginLink = "https://apihomechef.antopolis.xyz/api/admin/sign-in";
  late SharedPreferences sharedPreferences;

  GlobalKey<FormState> fromkey = GlobalKey<FormState>();
  void validate() {
    if (fromkey.currentState!.validate()) {
      print("oke");
    } else {
      print("Error");
    }
  }

  isLogin() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") != null) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => BottomNavMain()));
    } else {
      showToast("Please Login");
      print("Token is empty");
    }
  }

  getLogin() async {
    sharedPreferences = await SharedPreferences.getInstance();
    var map = Map<String, dynamic>();
    map["email"] = emailController.text.toString();
    map["password"] = passwordController.text.toString();
    var responce = await http.post(
      Uri.parse(loginLink),
      body: map,
    );
    if (responce.statusCode == 200) {
      showToast("Login is Succesfull");

      var data = jsonDecode(responce.body);
      setState(() {
        sharedPreferences.setString("token", data["access_token"]);
      });
      token = sharedPreferences.getString("token");
      print("Token is ${token}");

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BottomNavMain()));
    } else {
      showToast("Invalid Email & Password");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: fromkey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: double.infinity,
                    padding:
                        EdgeInsets.only(left: 10, right: 20, bottom: 36 + 20),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                        bottomRight: Radius.circular(36),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hello !",
                              style: GoogleFonts.robotoSerif(
                                fontSize: 30,
                                color: Color.fromARGB(255, 10, 10, 10),
                                fontWeight: FontWeight.w700,
                              )),
                          Text("Welcome Back",
                              style: GoogleFonts.robotoSerif(
                                fontSize: 30,
                                color: Color.fromARGB(255, 10, 10, 10),
                                fontWeight: FontWeight.w700,
                              )),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Column(
                      children: [
                        Text("Login Your Account",
                            style: GoogleFonts.robotoSerif(
                              fontSize: 23,
                              color: Color.fromARGB(255, 10, 10, 10),
                              fontWeight: FontWeight.w700,
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        CustomeTextField(
                          lebelText: "Enter Your Email",
                          controller: emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Valid Email";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              CustomeTextField(
                lebelText: "Enter Your Password",
                controller: passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Valid Password";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white24,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        if (fromkey.currentState!.validate()) {
                          getLogin();
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 110,
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                        child: Text("Login",
                            style: GoogleFonts.robotoSerif(
                              fontSize: 18,
                              color: Color.fromARGB(255, 10, 10, 10),
                              fontWeight: FontWeight.w700,
                            )),
                        decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(95),
                              topLeft: Radius.circular(95),
                              bottomRight: Radius.circular(200),
                            )),
                      ),
                    ),
                    Icon(Icons.login),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegistrationPage()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Don't have an account?",
                            style: GoogleFonts.robotoSerif(
                              fontSize: 17,
                              color: Color.fromARGB(255, 10, 10, 10),
                              fontWeight: FontWeight.w700,
                            )),
                        Text(" Sign Up",
                            style: GoogleFonts.robotoSerif(
                              fontSize: 17,
                              color: Colors.pink,
                              fontWeight: FontWeight.w700,
                            )),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
