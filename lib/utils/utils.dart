import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showSnakBacr(BuildContext context, String content){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        content: Text(content),
    )
  );
}

String getNameFromEmail(String email){

}