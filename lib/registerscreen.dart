import 'package:flutter/material.dart';
import 'package:my_class/loginscreen.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

void main() => runApp(RegisterScreen());

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameEditingController = new TextEditingController();
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController phoneEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();

  String urlRegister =
      "http://www.saujanaeclipse.com/myClass/php/register_user.php";

  bool emailcheck = false;
  bool validateMobile = false;
  String phoneErrorMessage;
  double screenHeight;

  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          resizeToAvoidBottomPadding: false,
          backgroundColor: Colors.orangeAccent[100],
          body: Column(
            children: <Widget>[
              pageTitle(),
              SizedBox(height: 20),
              registerCard()
            ],
          )),
    );
  }

  Widget pageTitle() {
    return Container(
      //color: Color.fromRGBO(255, 200, 200, 200),
      margin: EdgeInsets.only(top: 100),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.school,
            size: 40,
            color: Colors.blue,
          ),
          Text(
            " MyClass",
            style: TextStyle(
                fontSize: 36, color: Colors.white, fontWeight: FontWeight.w900),
          )
        ],
      ),
    );
  }

  Widget registerCard() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Card(
          child: Container(
            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
            child: Column(
              children: <Widget>[
                Text(
                  'Register New Account',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(height: 30),
                TextField(
                    controller: nameEditingController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      labelText: 'Name',
                      icon: Icon(
                        Icons.person,
                        color: Colors.redAccent,
                      ),
                    )),
                SizedBox(height: 20),
                TextField(
                    controller: emailEditingController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      labelText: 'Email',
                      icon: Icon(
                        Icons.email,
                        color: Colors.redAccent,
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: passwordEditingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    labelText: 'Password',
                    icon: Icon(
                      Icons.lock,
                      color: Colors.redAccent,
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 300,
                  height: 50,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    textColor: Colors.white,
                    color: Colors.red[300],
                    child: Text('Register', style: TextStyle(fontSize: 25)),
                    onPressed: _confirmRegister,
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Checkbox(
                        value: _isChecked,
                        onChanged: (bool value) {
                          _onChange(value);
                        },
                      ),
                      GestureDetector(
                        onTap: _showEULA,
                        child: Text('I Agree to Terms  ',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ]),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _confirmRegister() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Register Confirmation"),
          content: new Container(
            height: screenHeight / 10,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: new SingleChildScrollView(
                    child: RichText(
                        softWrap: true,
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                              //fontWeight: FontWeight.w500,
                              fontSize: 20.0,
                            ),
                            text:
                                "Are you sure you want to register a new account?" //children: getSpan(),
                            )),
                  ),
                )
              ],
            ),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
                child: new Text("Yes", style: TextStyle(color:Colors.red),),
                onPressed: () {
                  _onRegister();
                  Navigator.of(context).pop();
                }),
            new FlatButton(
              child: new Text("No",style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.of(context).pop();
                return;
              },
            )
          ],
        );
      },
    );
  }

  void _onRegister() {
    String name = nameEditingController.text;
    String email = emailEditingController.text;
    String password = passwordEditingController.text;

    String pattern = r'(^[a-zA-z]*$)';
    RegExp regExp = new RegExp(pattern);

    if (name.length == 0) {
      Toast.show("Please enter name", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);

      return;
    } else if (!regExp.hasMatch(name)) {
      Toast.show("Please enter alphabets only", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    } else if (email.length == 0) {
      Toast.show("Please enter your email!", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);

      return;
    } else if (password.length == 0) {
      Toast.show("Please enter password!", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);

      return;
    } else if (password.length < 8) {
      Toast.show("Please enter more than 8 characters", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);

      return;
    } else if (!_isChecked) {
      Toast.show("Please Accept Term", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);

      return;
    } else if (!_isEmailValid(email)) {
      Toast.show("Please enter valid email!", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      return;
    }

    http.post(urlRegister, body: {
      "name": name,
      "email": email,
      "password": password,
    }).then((res) {
      if (res.body == "success") {
        Navigator.pop(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => LoginScreen()));
        Toast.show("Registration success", context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      } else {
        Toast.show("Registration failed", context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      }
    }).catchError((err) {
      print(err);
    });
  }

  void _onChange(bool value) {
    setState(() {
      _isChecked = value;
      //savepref(value);
    });
  }

  bool _isEmailValid(String email) {
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

  void _showEULA() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("EULA"),
          content: new Container(
            height: screenHeight / 2,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: new SingleChildScrollView(
                    child: RichText(
                        softWrap: true,
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                              //fontWeight: FontWeight.w500,
                              fontSize: 12.0,
                            ),
                            text:
                                "This End-User License Agreement is a legal agreement between you and SaujanaEclipse This EULA agreement governs your acquisition and use of our MyClass software (Software) directly from Slumberjer or indirectly through a SaunajaEclipse authorized reseller or distributor (a Reseller).Please read this EULA agreement carefully before completing the installation process and using the MyClass software. It provides a license to use the MyClass software and contains warranty information and liability disclaimers. If you register for a free trial of the MyClass software, this EULA agreement will also govern that trial. By clicking accept or installing and/or using the MyClass software, you are confirming your acceptance of the Software and agreeing to become bound by the terms of this EULA agreement. If you are entering into this EULA agreement on behalf of a company or other legal entity, you represent that you have the authority to bind such entity and its affiliates to these terms and conditions. If you do not have such authority or if you do not agree with the terms and conditions of this EULA agreement, do not install or use the Software, and you must not accept this EULA agreement.This EULA agreement shall apply only to the Software supplied by SaujanaEclipse herewith regardless of whether other software is referred to or described herein. The terms also apply to any SaujanaEclipse updates, supplements, Internet-based services, and support services for the Software, unless other terms accompany those items on delivery. If so, those terms apply. This EULA was created by EULA Template for MyClass. Slumberjer shall at all times retain ownership of the Software as originally downloaded by you and all subsequent downloads of the Software by you. The Software (and the copyright, and other intellectual property rights of whatever nature in the Software, including any modifications made thereto) are and shall remain the property of Saujanaelipse. Saujanaeclipse reserves the right to grant licences to use the Software to third parties"
                            //children: getSpan(),
                            )),
                  ),
                )
              ],
            ),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}
