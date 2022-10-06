import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomeBottom extends StatelessWidget {
  final String? textt;
  final Function? onTabb;
  final dynamic iconn;
  CustomeBottom({this.onTabb, this.textt, this.iconn});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Container(
          width: 150,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 20), blurRadius: 30, color: Colors.black12)
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
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                child: Text(
                  textt!,
                ),
                decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(95),
                      topLeft: Radius.circular(95),
                      bottomRight: Radius.circular(200),
                    )),
              ),
              Icon(iconn),
            ],
          ),
        ),
      ),
    );
  }
}
