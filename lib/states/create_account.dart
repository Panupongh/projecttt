import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projectt/main.dart';
import 'package:projectt/utility/my_constant.dart';
import 'package:projectt/utility/my_dialog.dart';
import 'package:projectt/widgets/show_image.dart';
import 'package:projectt/widgets/show_title.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  File? file;
  String? typeUser;
  String avatar = '';
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Row buildName(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.6,
          child: TextFormField(
            controller: nameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอกข้อมูล';
              } else {}
            },
            decoration: InputDecoration(
              labelStyle: Myconstant().h3style(),
              labelText: 'Name:',
              prefixIcon: Icon(
                Icons.fingerprint,
                color: Myconstant.primary,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Myconstant.dark),
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

  Row buildAddress(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.6,
          child: TextFormField(
            controller: addressController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอกข้อมูลที่อยู่';
              } else {}
            },
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'Address :',
              hintStyle: Myconstant().h3style(),
              prefixIcon: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
                child: Icon(
                  Icons.home,
                  color: Myconstant.primary,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Myconstant.dark),
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

  Row buildPhone(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.6,
          child: TextFormField(
            controller: phoneController,
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอกข้อมูลเบอร์โทรศัพท์';
              } else {}
            },
            decoration: InputDecoration(
              labelStyle: Myconstant().h3style(),
              labelText: 'Phone:',
              prefixIcon: Icon(
                Icons.phone,
                color: Myconstant.primary,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Myconstant.dark),
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

  Row buildUser(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.6,
          child: TextFormField(
            controller: userController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอกข้อมูลรหัสผู้ใช้งาน';
              } else {}
            },
            decoration: InputDecoration(
              labelStyle: Myconstant().h3style(),
              labelText: 'User:',
              prefixIcon: Icon(
                Icons.fingerprint,
                color: Myconstant.primary,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Myconstant.dark),
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
            controller: passwordController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอกข้อมูลรหัสผ่าน';
              } else {}
            },
            decoration: InputDecoration(
              labelStyle: Myconstant().h3style(),
              labelText: 'Password:',
              prefixIcon: Icon(
                Icons.password,
                color: Myconstant.primary,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Myconstant.dark),
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

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [buildCreateNewAccount()],
        title: Text('Create New Account'),
        backgroundColor: Myconstant.dark,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(
          FocusNode(),
        ),
        behavior: HitTestBehavior.opaque,
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildTitle('ข้อมูลทั่วไป :'),
                buildName(size),
                buildTitle('ชนิดของ User :'),
                buildRadioBuyer(size),
                buildRadioSeller(size),
                buildRadioRider(size),
                buildTitle('ข้อมูลพื้นฐาน'),
                buildAddress(size),
                buildPhone(size),
                buildUser(size),
                buildPassword(size),
                buildTitle('รูปภาพ'),
                buildSubTitle(),
                buildAvatar(size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconButton buildCreateNewAccount() {
    return IconButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            if (typeUser == null) {
              print('Non Choose Type User');
              MyDialog().normalDialog(
                  context,
                  'ยังไม่ได้เลือก ชนิดของผู้ใช้งาน',
                  'กรุณาเลือกชนิดของผู้ใช้งาน');
            } else {
              print('Process Insert To DataBase');
            }
          }
        },
        icon: Icon(Icons.cloud_upload));
  }

  Future<Null> uploadPictureAndInsertData() async {
    String name = nameController.text;
    String address = addressController.text;
    String phone = phoneController.text;
    String user = userController.text;
    String password = passwordController.text;
    print(
        '## name = $name, address = $address,phone = $phone, user=$user,password =$password');
    String path =
        '${Myconstant.domain}/Shoppingmall/getUserWhereUser.php?isAdd=true&user=user';
    await Dio().get(path).then((value)async {
      print('## value ==>> $value');
      if (value.toString() == 'null') {
        print('## user OK');

        if (file == null) {
          //No Aavatar
          procressInsertMySQL();
        } else {
          //have avatar
          print('### procress Upload Avatar');
          String apiSaveAvatar='${Myconstant.domain}/Shoppingmall/saveAvatar.php';
          int i = Random().nextInt(100000);
          String nameAvatar= 'avatar$i.jpg';
          Map<String,dynamic> map= Map();
          map['file'] = await MultipartFile.fromFile(file!.path, filename: nameAvatar);
          FormData data = FormData.fromMap(map);
          await Dio().post(apiSaveAvatar,data: data).then((value) {
avatar='/Shoppingmall/avatar/$nameAvatar';
procressInsertMySQL();

          }
          
          
           );

        }
        
      } else {
        MyDialog().normalDialog(context, 'User False ?', 'Please Chang User');
      }
    });

  }
  Future<Null> procressInsertMySQL()async{
    print('### procressInsertMySQL Work and avatar ==>> $avatar');
  }


  Future<Null> chooseImage(ImageSource source) async {

    try {
      var result = await ImagePicker().getImage(
        source: source,
        maxWidth: 800,
        maxHeight: 800,
      );
      setState(() {
        file = File(result!.path);
      });
    } catch (e) {}
  }

  Row buildAvatar(double size) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => chooseImage(ImageSource.camera),
          icon: Icon(
            Icons.add_a_photo,
            size: 36,
            color: Myconstant.dark,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          width: size * 0.6,
          child: file == null
              ? ShowImage(path: Myconstant.image3)
              : Image.file(file!),
        ),
        IconButton(
          onPressed: () => chooseImage(ImageSource.gallery),
          icon: Icon(
            Icons.add_photo_alternate,
            size: 36,
            color: Myconstant.dark,
          ),
        ),
      ],
    );
  }

  ShowTitle buildSubTitle() {
    return ShowTitle(
      title:
          'เป็นรูปภาพที่แสดงความเป็นตัวตนของผู้ใช้งาน {แต่ถ้าไม่สะดวกแชร์ จะใช้เป็นรูปภาพเริ่มต้น}',
      textStyle: Myconstant().h3style(),
    );
  }

  Row buildRadioBuyer(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.6,
          child: RadioListTile(
            value: 'buyer',
            groupValue: typeUser,
            onChanged: (value) {
              setState(() {
                typeUser = value as String?;
              });
            },
            title: ShowTitle(
              title: 'ผู้ซื้อ (Buyer)',
              textStyle: Myconstant().h3style(),
            ),
          ),
        ),
      ],
    );
  }

  Row buildRadioSeller(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.6,
          child: RadioListTile(
            value: 'Seller',
            groupValue: typeUser,
            onChanged: (value) {
              setState(() {
                typeUser = value as String?;
              });
            },
            title: ShowTitle(
              title: 'ผู้ขาย (Seller)',
              textStyle: Myconstant().h3style(),
            ),
          ),
        ),
      ],
    );
  }

  Row buildRadioRider(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.6,
          child: RadioListTile(
            value: 'Rider',
            groupValue: typeUser,
            onChanged: (value) {
              setState(() {
                typeUser = value as String?;
              });
            },
            title: ShowTitle(
              title: 'ผู้ส่ง (Rider)',
              textStyle: Myconstant().h3style(),
            ),
          ),
        ),
      ],
    );
  }

  Container buildTitle(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: ShowTitle(
        title: title,
        textStyle: Myconstant().h2style(),
      ),
    );
  }
}
