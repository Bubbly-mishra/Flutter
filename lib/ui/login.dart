import 'package:flutter/material.dart';
import 'package:flutter_doyel/constants/constants.dart';
import 'package:flutter_doyel/ui/widgets/custom_shape.dart';
import 'package:flutter_doyel/ui/widgets/responsive_ui.dart';
import 'package:flutter_doyel/ui/widgets/textformfield.dart';


class LogInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LogInScreen(),
    );
  }
}

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {

  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();



  @override
  Widget build(BuildContext context) {
     _height = MediaQuery.of(context).size.height;
     _width = MediaQuery.of(context).size.width;
     _pixelRatio = MediaQuery.of(context).devicePixelRatio;
     _large =  ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
     _medium =  ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(
      child: Container(
        height: _height,
        width: _width,
        padding: EdgeInsets.only(bottom: 5),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              clipShape(),
              welcomeTextRow(),
              form(),
              forgetPassTextRow(),
              SizedBox(height: _height / 12),
              button(),
              signUpTextRow(),
            ],
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

  Widget welcomeTextRow() {

    return Container(
      padding: EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
      child: Text('🆁🅴🅻🅴🅰🆂🅴🅳',

          style:
          TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.green[200])),
    );
  }


  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 12.0,
          right: _width / 12.0,
          top: _height / 15.0),
      child: Form(
        key: _key,
        child: Column(
          children: <Widget>[
            emailTextFormField(),
            SizedBox(height: _height / 50.0),
          ],
        ),
      ),
    );
  }

  Widget emailTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.emailAddress,
      textEditingController: emailController,
      hint: "Enter Pin Number",
    );

  }


  Widget forgetPassTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Forgot pin?",
            style: TextStyle(fontWeight: FontWeight.w400,
                decoration: TextDecoration.underline, color: Colors.green[200] ,fontSize: _large? 14: (_medium? 12: 10)),
          ),
          SizedBox(
            width: 5,
          ),

        ],
      ),
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
            .showSnackBar(SnackBar(content: Text('Login Successful')));

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
        child: Text('LOG IN',style: TextStyle(fontSize: _large? 14: (_medium? 12: 10))),
      ),
    );
  }

  Widget signUpTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Don't have an account?",
            style: TextStyle(fontWeight: FontWeight.w400,fontSize: _large? 14: (_medium? 12: 10)),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(SIGN_UP);
              print("Routing to Sign up screen");
            },
            child: Text(
              "Sign up",
              style: TextStyle(
                  fontWeight: FontWeight.w800 ,
                  decoration: TextDecoration.underline, color: Colors.green[200], fontSize: _large? 14: (_medium? 12: 10)),
            ),
          )
        ],
      ),
    );
  }

}
