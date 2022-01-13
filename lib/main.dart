import 'package:flutter/material.dart';
import 'package:projectt/states/authen.dart';
import 'package:projectt/states/buyer_service.dart';
import 'package:projectt/states/create_account.dart';
import 'package:projectt/states/rider_service.dart';
import 'package:projectt/states/saler_service.dart';
import 'package:projectt/utility/my_constant.dart';


final Map<String,WidgetBuilder> map ={

  '/authen':(BuildContext context)=> Authen(),
  '/createAccount':(BuildContext context)=> CreateAccount(),
  '/buyerService':(BuildContext context)=> BuyerService(),
  '/salerService':(BuildContext context)=> SalerService(),
  '/riderService':(BuildContext context)=> RiderService(),
};

String? initlalRount;

void main(){
  initlalRount = Myconstant.routeAuthen;
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Myconstant.appName,
      routes: map,
      initialRoute: initlalRount,
      
    );
  }
}