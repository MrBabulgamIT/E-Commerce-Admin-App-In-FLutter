import 'package:e__commerce/widget/brandcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomeTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Function? onChangeFunction;
  final dynamic icon;
  final dynamic data;
  final dynamic suffixIcon;
  final String? initialText;
  final dynamic? validator;
  final String? hintText;
  final int? maxNumber;
  final String? lebelText;
  final dynamic formatter;
  final dynamic keytype;
  final String? suffixText;
  final String? keyy;

  CustomeTextField({
    this.icon,
    this.keytype,
    this.lebelText,
    this.keyy,
    this.maxNumber,
    this.controller,
    this.data,
    this.validator,
    this.hintText,
    this.initialText,
    this.suffixIcon,
    this.formatter,
    this.onChangeFunction,
    this.suffixText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        maxLines: maxNumber,
        initialValue: initialText,
        keyboardType: keytype,
        controller: controller,
        inputFormatters: formatter,
        validator: validator,
        // onSaved: ( value) => data[keyy] = value,
        //  onChanged: onChangeFunction,
        autofocus: false,
        decoration: InputDecoration(
          labelText: hintText,
          hintStyle: myStyle(12, Colors.black54),
          suffixIcon: suffixIcon,
          prefixIcon: icon,
          labelStyle: myStyle(12, Colors.black54),
          hintText: lebelText,
          // hoverColor: Colors.black,
          filled: true,
          suffixText: suffixText,

          errorStyle:
              myStyle(12, Colors.redAccent.withOpacity(0.9), FontWeight.w500),
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          fillColor: Color.fromARGB(255, 229, 226, 226),

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(8.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: pinkColor,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
