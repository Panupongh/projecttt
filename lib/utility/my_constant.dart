import 'package:flutter/material.dart';

class Myconstant {

  //Genernal
  static String appName = 'Coffee Shop';
  static String domain ='http://4d13-2001-fb1-d7-5e7c-8ce5-1941-79bb-6e04.ngrok.io ';
//route
static String routeAuthen = '/authen';
static String routeCreateAccount = '/createAccount';
static String routeBuyerService = '/buyerService';
static String routeSalerService = '/salerService';
static String routeRiderService = '/riderService';

//image
static String image1 ='images/image1.png';
static String image2 = 'images/logo.png';
static String image3 ='images/avatar.png';
//color
  static Color primary =Color(0xff87861d);
   static Color dark =Color(0xff87861d);
static Color  light = Color(0xffb9b64e);

//style
TextStyle h1style() => TextStyle(
  fontSize: 24,
  color: dark,
  fontWeight: FontWeight.bold,
);
TextStyle h2style() => TextStyle(
  fontSize: 18,
  color: light,
  fontWeight: FontWeight.w700,
);
TextStyle h3style() => TextStyle(
  fontSize: 14,
  color: primary,
  fontWeight: FontWeight.normal,
);


//buttomstyle
ButtonStyle myButtonStyle() => ElevatedButton.styleFrom(
                primary: Myconstant.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
);



}

