import 'package:flutter/material.dart';
import 'package:projectt/utility/my_constant.dart';
import 'package:projectt/widgets/show_image.dart';
import 'package:projectt/widgets/show_title.dart';

class Authen extends StatefulWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  @override
  bool statusRedEye = true;
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(
          FocusNode(),
        ),
        behavior: HitTestBehavior.opaque,
        child: ListView(
          children: [
            buildImage(size),
            buildAppName(),
            buildUser(size),
            buildPassword(size),
            buildLogin(size),
            buildCreateAccount(),
          ],
        ),
      ),
    ));
  }

  Row buildCreateAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowTitle(
          title: 'Non Account ?',
          textStyle: Myconstant().h3style(),
        ),
        TextButton(
          onPressed: () =>
              Navigator.pushNamed(context, Myconstant.routeCreateAccount),
          child: Text('Create Account'),
        ),
      ],
    );
  }

  Row buildLogin(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          width: size * 0.6,
          child: ElevatedButton(
            style: Myconstant().myButtonStyle(),
            onPressed: () {},
            child: Text('Login'),
          ),
        ),
      ],
    );
  }

  Row buildUser(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.6,
          child: TextFormField(
            decoration: InputDecoration(
              labelStyle: Myconstant().h3style(),
              labelText: 'User:',
              prefixIcon: Icon(
                Icons.account_circle,
                color: Myconstant.primary,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Myconstant.primary),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Myconstant.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildPassword(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.6,
          child: TextFormField(
            obscureText: statusRedEye,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    statusRedEye = !statusRedEye;
                  });
                },
                icon: statusRedEye
                    ? Icon(
                        Icons.remove_red_eye,
                        color: Myconstant.primary,
                      )
                    : Icon(Icons.remove_red_eye_outlined,
                        color: Myconstant.primary),
              ),
              labelStyle: Myconstant().h3style(),
              labelText: 'Password:',
              prefixIcon: Icon(
                Icons.lock,
                color: Myconstant.primary,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Myconstant.primary),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Myconstant.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildAppName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowTitle(
          title: Myconstant.appName,
          textStyle: Myconstant().h1style(),
        ),
      ],
    );
  }

  Row buildImage(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.6,
          child: ShowImage(path: Myconstant.image2),
        ),
      ],
    );
  }
}
