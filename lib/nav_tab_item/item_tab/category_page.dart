import 'package:e__commerce/model/category_model.dart';
import 'package:e__commerce/nav_tab_item/category/editcategory.dart';
import 'package:e__commerce/provider/category_provider.dart';
import 'package:e__commerce/nav_tab_item/category/addcategory.dart';
import 'package:e__commerce/widget/brandcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class CategoryPage_Nav extends StatefulWidget {
  const CategoryPage_Nav({Key? key}) : super(key: key);

  @override
  State<CategoryPage_Nav> createState() => _CategoryPage_NavState();
}

class _CategoryPage_NavState extends State<CategoryPage_Nav> {
  @override
  void initState() {
    // TODO: implement initState

    // getAllOrders();
    Provider.of<CategoryProvider>(context, listen: false).getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<CategoryProvider>(context);

    print("skfjghkjfhgkjfhjkg");
    return Scaffold(
      body: Container(
        child: ListView.builder(itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 5,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://apihomechef.antopolis.xyz/images/${categories.categoryList[index].image}"),
                    ),
                  ),
                ),
                Center(
                  child: Text("${categories.categoryList[index].name}"),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
