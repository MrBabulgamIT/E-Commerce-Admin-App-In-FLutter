import 'package:e__commerce/nav_tab_item/item_tab/category_page.dart';
import 'package:e__commerce/nav_tab_item/item_tab/home_page.dart';
import 'package:e__commerce/nav_tab_item/item_tab/orderitem.dart';
import 'package:e__commerce/nav_tab_item/item_tab/produc.dart';
import 'package:e__commerce/nav_tab_item/item_tab/profilenav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NavigationDrawerr extends StatelessWidget {
  const NavigationDrawerr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                children: [
                  CircleAvatar(
                    child: Icon(Icons.person),
                    radius: 50,
                  ),
                  Text("Md:Samiul Alim Jony"),
                ],
              )),
          ListTile(
            title: Text("Home "),
            trailing: Icon(Icons.home),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (contex) => HomePageNav()));
            },
          ),
          ListTile(
            title: Text("Category "),
            trailing: Icon(Icons.home),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (contex) => CategoryPage_Nav()));
            },
          ),
          ListTile(
            title: Text("Product "),
            trailing: Icon(Icons.home),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (contex) => ProductPage_Nav()));
            },
          ),
          ListTile(
            title: Text("Order "),
            trailing: Icon(Icons.home),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (contex) => OrderPage_nav()));
            },
          ),
          ListTile(
            title: Text("Profile "),
            trailing: Icon(Icons.home),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (contex) => Profile_Nav()));
            },
          ),
        ],
      ),
    );
  }
}
