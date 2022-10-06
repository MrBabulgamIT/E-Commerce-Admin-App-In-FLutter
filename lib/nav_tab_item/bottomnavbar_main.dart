import 'dart:convert';
import 'dart:io';
import 'package:e__commerce/nav_tab_item/item_tab/category_page.dart';
import 'package:e__commerce/nav_tab_item/item_tab/home_page.dart';
import 'package:e__commerce/nav_tab_item/item_tab/orderitem.dart';
import 'package:e__commerce/nav_tab_item/item_tab/produc.dart';
import 'package:e__commerce/nav_tab_item/item_tab/profilenav.dart';

import 'package:e__commerce/screen/navigationdrawer.dart';
import 'package:e__commerce/widget/brandcolors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../http/customehttp.dart';
import '../model/ordermodel.dart';

class BottomNavMain extends StatefulWidget {
  const BottomNavMain({Key? key}) : super(key: key);

  @override
  State<BottomNavMain> createState() => _BottomNavMainState();
}

class _BottomNavMainState extends State<BottomNavMain> {
  String loginLink = "https://apihomechef.antopolis.xyz/api/admin/sign-in";
  late SharedPreferences sharedPreferences;

  int currentIndex = 0;
  List<String> pagesName = [
    "Home Page",
    "Category Page",
    "Order Page",
    "Peofile Page",
  ];
  List<Widget> pages = [
    HomePageNav(),
    CategoryPage_Nav(),
    ProductPage_Nav(),
    OrderPage_nav(),
    Profile_Nav()
  ];
  onBackPressed() {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Text("Are you sure ?",
                style: GoogleFonts.robotoSerif(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                )),
            content: Text("You are going to exit the app !",
                style: GoogleFonts.robotoSerif(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                )),
            titlePadding: EdgeInsets.only(top: 25, bottom: 10, left: 20),
            contentPadding: EdgeInsets.only(left: 20, right: 10),
            backgroundColor: BrandColors.colorPrimaryDark,
            contentTextStyle: myStyle(14, Colors.white.withOpacity(0.23)),
            titleTextStyle: myStyle(18, Colors.white, FontWeight.w500),
            actionsPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            actions: <Widget>[
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Text("No",
                    style: GoogleFonts.robotoSerif(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    )),
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                onPressed: () {
                  exit(0);
                },
                child: Text("Yes",
                    style: GoogleFonts.robotoSerif(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    )),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.blueGrey,
          showSelectedLabels: true,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Category"),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: "Product"),
            BottomNavigationBarItem(
                icon: Icon(Icons.production_quantity_limits), label: "Order"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ]),
      body: WillPopScope(
        onWillPop: () async {
          return onBackPressed();
        },
        child: Container(child: pages[currentIndex]),
      ),
    );
  }
}
