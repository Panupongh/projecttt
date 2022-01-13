

import 'package:flutter/material.dart';
import 'package:projectt/utility/my_constant.dart';
import 'package:projectt/widgets/show_image.dart';
import 'package:projectt/widgets/show_title.dart';

class MyDialog {
  Future<Null> normalDialog(
      BuildContext context, String title, String message) async {
    showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              title: ListTile(
                leading: ShowImage(path: Myconstant.image1),
                title: ShowTitle(
                  title: title,
                  textStyle: Myconstant().h2style(),
                ),
                subtitle: ShowTitle(
                    title: message, textStyle: Myconstant().h3style()),
              ), children: [TextButton(onPressed: () => Navigator.pop(context) , child: Text('OK'))],
            ));
  }
}
