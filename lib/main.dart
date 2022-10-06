import 'package:e__commerce/nav_tab_item/bottomnavbar_main.dart';
import 'package:e__commerce/provider/category_provider.dart';
import 'package:e__commerce/provider/order_provider.dart';
import 'package:e__commerce/screen/loginpage.dart';
import 'package:e__commerce/screen/registrationpage.dart';
import 'package:e__commerce/widget/extra.dart';
import 'package:e__commerce/widget/textfromfiled.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<OrderProvider>(create: (_) => OrderProvider()),
    ChangeNotifierProvider<CategoryProvider>(create: (_) => CategoryProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
