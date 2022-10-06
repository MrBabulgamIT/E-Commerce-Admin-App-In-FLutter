import 'dart:convert';

import 'package:e__commerce/http/customehttp.dart';
import 'package:e__commerce/model/ordermodel.dart';
import 'package:e__commerce/provider/order_provider.dart';
import 'package:e__commerce/screen/navigationdrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class HomePageNav extends StatefulWidget {
  const HomePageNav({Key? key}) : super(key: key);

  @override
  State<HomePageNav> createState() => _HomePageNavState();
}

class _HomePageNavState extends State<HomePageNav> {
  @override
  void initState() {
    Provider.of<OrderProvider>(context, listen: false).getOrder();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orderList = Provider.of<OrderProvider>(context).orderList;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: ListView.builder(
            padding: EdgeInsets.only(
              top: 4,
            ),
            shrinkWrap: true,
            itemCount: orderList.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 22,
                        color: Colors.black12),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage("images/fooditem.png"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "${orderList[index].user!.name}",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Price: \$${orderList[index].price}  "),
                                SizedBox(
                                  width: 2,
                                ),
                                Text("Quantity: ${orderList[index].quantity}"),
                              ],
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                                "Ordere Proces: ${orderList[index].orderStatus!.orderStatusCategory.name}"),
                            SizedBox(
                              height: 2,
                            ),
                            Text("${orderList[index].orderDateAndTime}"),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      color: Colors.white,
                      height: 5,
                      thickness: 5,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
