import 'package:e__commerce/http/customehttp.dart';
import 'package:e__commerce/model/ordermodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class OrderProvider with ChangeNotifier {
  List<OrderModel> orderList = [];
  late OrderModel orderModel;

  getOrder() async {
    orderList = await CustomeHttpRequest().getAllOrder();
    notifyListeners();
  }
}
