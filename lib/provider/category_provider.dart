import 'package:e__commerce/http/customehttp.dart';
import 'package:e__commerce/model/category_model.dart';
import 'package:e__commerce/model/ordermodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoryModel> categoryList = [];
  late CategoryModel categoryModel;

  getCategory() async {
    categoryList = await CustomeHttpRequest().getAllCategory();
    notifyListeners();
  }
}
