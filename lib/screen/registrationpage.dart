import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:e__commerce/http/customehttp.dart';
import 'package:e__commerce/mathod/screenRegistration.dart';
import 'package:e__commerce/screen/loginpage.dart';
import 'package:e__commerce/widget/bottomd.dart';
import 'package:e__commerce/widget/brandcolors.dart';
import 'package:e__commerce/widget/showtoast.dart';
import 'package:e__commerce/widget/textfromfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final GlobalKey<FormState> fromkey = GlobalKey<FormState>();
  TextEditingController NameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController contectController = TextEditingController();

  void validate() {
    if (fromkey.currentState!.validate()) {
      print("oke");
    } else {
      print("Error");
    }
  }

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
        map["name"] = NameController.text.toString();
        map["email"] = emailController.text.toString();
        map["password"] = passwordController.text.toString();
        map["password_confirmation"] = rePasswordController.text.toString();

        var response = await http.post(
            Uri.parse(
                "https://apihomechef.antopolis.xyz/api/admin/create/new/admin"),
            body: map,
            headers: CustomeHttpRequest.defaultHeader);

        print("${response.body}");

        final data = jsonDecode(response.body);
        if (response.statusCode == 201) {
          showToast("Registration is Succesfull");
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        } else {
          showToast("Registration Failed");
        }
      } else {
        showToast("Cheek Internet Coneection");
      }
    });
  }

  // getRegister() async {
  //   var map = Map<String, dynamic>();
  //   map["name"] = NameController.text.toString();
  //   map["email"] = emailController.text.toString();
  //   map["password"] = passwordController.text.toString();
  //   map["password_confi rmation"] = rePasswordController.text.toString();

  //   var responce = await http.post(
  //       Uri.parse(
  //           "https://apihomechef.antopolis.xyz/api/admin/create/new/admin"),
  //       body: map,
  //       headers: CustomeHttpRequest.defaultHeader);

  //   print("${responce.body}");
  //   showToast("Failed");

  //   final data = jsonDecode(responce.body);
  //   if (responce.statusCode == 201) {
  //     showToast("Registration is Succesfull");
  //   } else {
  //     showToast("Registration Failed");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
            key: fromkey,
            autovalidateMode: AutovalidateMode.always,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: double.infinity,
                        padding: EdgeInsets.only(
                            left: 20, right: 20, bottom: 36 + 20),
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(36),
                            bottomRight: Radius.circular(36),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
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
                              Text("Welcome",
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
                            Text("Let's Register",
                                style: GoogleFonts.robotoSerif(
                                  fontSize: 23,
                                  color: Color.fromARGB(255, 10, 10, 10),
                                  fontWeight: FontWeight.w700,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            CustomeTextField(
                              lebelText: "Enter Your Name",
                              controller: NameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Valid Name";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: CustomeTextField(
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
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomeTextField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter valid Password";
                            } else {
                              return null;
                            }
                          },
                          lebelText: "Enter Your Password",
                          controller: passwordController,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomeTextField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter valid Confrim Password";
                            } else {
                              return null;
                            }
                          },
                          lebelText: "Enter Confrim Password",
                          controller: rePasswordController,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            if (fromkey.currentState!.validate()) {
                              getRegisterr();
                            }
                          },
                          child: Container(
                            width: 150,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 20),
                                    blurRadius: 30,
                                    color: Colors.black12)
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 110,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 12),
                                  child: Text("Sign Up",
                                      style: GoogleFonts.robotoSerif(
                                        fontSize: 15,
                                        color: Colors.black,
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
                                Icon(Icons.login),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Alredy have an account?",
                            style: GoogleFonts.robotoSerif(
                              fontSize: 13,
                              color: Color.fromARGB(255, 10, 10, 10),
                              fontWeight: FontWeight.w700,
                            )),
                        Text(" Login",
                            style: GoogleFonts.robotoSerif(
                              fontSize: 13,
                              color: Colors.pink,
                              fontWeight: FontWeight.w700,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
