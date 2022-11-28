import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:olx_app/SignupScreen/signupscreen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:olx_app/SignupScreen/components/background.dart';
import 'package:olx_app/WelcomeScreen/welcomescreen.dart';
import 'package:olx_app/Widgets/rounded_button.dart';
import 'package:olx_app/Widgets/rounded_password_field.dart';

import '../../Widgets/already_have_an_account_acheck.dart';
import '../../Widgets/rounded_input_field.dart';

class SignupBody extends StatefulWidget {
  const SignupBody({Key? key}) : super(key: key);

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  String userPhotourl = "";
  File? _image;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  chooseImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;
    File? file = File(pickedFile.path);
    setState(() {
      _image = file;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SignupBackground(
        child: ListView(
          children: [
            InkWell(
              onTap: chooseImage(),
            ),
            CircleAvatar(
              radius: size.width * 0.20,
              backgroundColor: Colors.deepPurple[100],
              backgroundImage: _image == null ? null : FileImage(_image!),
              child: _image == null
                  ? Icon(
                      Icons.add_photo_alternate,
                      color: Colors.white,
                    )
                  : null,
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            RoundedInputField(
              hintText: "Name",
              icon: Icons.person,
              onChanged: (String value) {
                _nameController.text = value;
              },
            ),
            RoundedPasswordField(onChanged: (value) {
              _passwordController.text = value;
            }),
            RoundedButton(text: 'SIGNUP', press: () {}),
            SizedBox(
              height: size.height * 0.03,
            ),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return WelcomeScreen();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
