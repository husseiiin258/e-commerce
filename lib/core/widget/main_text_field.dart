import 'package:flutter/material.dart';
typedef Validator = String? Function(String?);

class MainTextField extends StatelessWidget {
  String? label;
  String? hint;
  TextInputType keyboardType ;
  bool secureText ;
  TextEditingController controller ;
  Validator? myValidator ;
  IconButton? suffixIcon;
  var formKey = GlobalKey<FormState>();

  MainTextField(
      {super.key,

        this.keyboardType = TextInputType.text ,
        this.secureText=false ,
        required this.controller,
         required this.myValidator ,
        required this.hint,
        this.suffixIcon,

      }) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(

        decoration: InputDecoration(
          suffixIcon:suffixIcon,
          hintText:hint ,
          fillColor: Colors.white,
          focusColor: Colors.white,
          filled: true,



          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                  color: Colors.white,
                  width: 4
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                  color:Colors.white,
                  width: 4
              )
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                  color: Colors.red,
                  width: 4
              )
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                  color: Colors.red,
                  width: 4
              )
          ),

        ),
        key: formKey,
        keyboardType: keyboardType,
        obscureText: secureText ,
        controller: controller,
        validator: myValidator ,




      ),
    );

  }

}