import 'package:flutter/material.dart';
import 'package:flutter_doyel/constants/constants.dart';
import 'package:flutter_doyel/ui/widgets/custom_shape.dart';
import 'package:flutter_doyel/ui/widgets/customappbar.dart';
import 'package:flutter_doyel/ui/widgets/responsive_ui.dart';
import 'package:flutter_doyel/ui/widgets/textformfield.dart';



class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool checkBoxValue = false;
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;

  @override
  Widget build(BuildContext context) {

    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large =  ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium =  ResponsiveWidget.isScreenMedium(_width, _pixelRatio);

    return Material(
      child: Scaffold(
        body: Container(
          height: _height,
          width: _width,
          margin: EdgeInsets.only(bottom: 5),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Opacity(opacity: 0.88,child: CustomAppBar()),
                clipShape(),
                form(),
                SizedBox(height: _height/35,),
                button(),
                signInTextRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget clipShape() {
    //double height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.0,
          child: ClipPath(
            child: Container(
              height: _large? _height/9.25 : (_medium? _height/4.25 : _height/4.25),
              decoration: BoxDecoration(

                color:Colors.green,

              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: ClipPath(
            clipper: CustomShapeClipper2(),
            child: Container(
              height: _large? _height/9.25 : (_large? _height/4.25 : _height/4.25),
              decoration: BoxDecoration(

                  color: Colors.green[500]

              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left:_width/ 12.0,
          right: _width / 12.0,
          top: _height / 50.0),
      child: Form(
        child: Column(
          children: <Widget>[
            welcomeTextRow(),
            SizedBox(height: _height / 60.0),
            firstNameTextFormField(),
            SizedBox(height: _height / 60.0),
            lastNameTextFormField(),
            SizedBox(height: _height/ 60.0),
            emailTextFormField(),
            SizedBox(height: _height / 60.0),
            phoneTextFormField(),
            SizedBox(height: _height / 60.0),
            passwordTextFormField(),
          ],
        ),
      ),
    );
  }

  Widget welcomeTextRow() {

    return Container(
      padding: EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
      child: Text('🆁🅴🅻🅴🅰🆂🅴🅳',

          style:
          TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.green[200])),
    );
  }

  Widget firstNameTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      hint: "Enter First Name",
    );
  }

  Widget lastNameTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      hint: "Enter Last Name",
    );
  }

  Widget emailTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.emailAddress,
      hint: "Enter Username",
    );
  }

  Widget phoneTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.number,
      hint: "Enter Email ID",
    );
  }

  Widget passwordTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      obscureText: true,
      hint: "Enter Pin Number",
    );
  }


  Widget button() {
    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () {
        print("Routing to your account");
        Scaffold
            .of(context)
            .showSnackBar(SnackBar(content: Text('SignUp Successful')));

      },
      textColor: Colors.green[200],
      padding: EdgeInsets.all(0.0),
      child: Container(
        height: 40.0,
        alignment: Alignment.center,
        width: 300.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          color: Colors.black87,
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text('SIGN UP',style: TextStyle(fontSize: _large? 14: (_medium? 12: 10))),
      ),
    );
  }


  Widget signInTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Already have an account?",
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop(LOG_IN);
              print("Routing to Sign up screen");
            },
            child: Text(
              "Log in",
              style: TextStyle(
                fontWeight: FontWeight.w800 ,
                decoration: TextDecoration.underline, color: Colors.green[200], fontSize: _large? 14: (_medium? 12: 10)),
            ),

            //style: TextStyle(
            //                   fontWeight: FontWeight.w800 ,
            //                   decoration: TextDecoration.underline, color: Colors.green[200], fontSize: _large? 14: (_medium? 12: 10)),
          )
        ],
      ),
    );
  }
}
