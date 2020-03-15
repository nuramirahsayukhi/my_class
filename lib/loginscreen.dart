import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_class/registerscreen.dart';

void main() => runApp(LoginScreen());
bool rememberMe = false;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        home: Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.orangeAccent[100],
            body: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 26,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            TextField(
                                controller: emailEditingController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.blue[50],
                                  border: OutlineInputBorder(),
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
                                filled: true,
                                fillColor: Colors.blue[50],
                                border: OutlineInputBorder(),
                                labelText: 'Password',
                                icon: Icon(
                                  Icons.lock,
                                  color: Colors.redAccent,
                                ),
                              ),
                              obscureText: true,
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: 200,
                              child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(30.0)),
                                  textColor: Colors.white,
                                  color: Colors.red[300],
                                  child: Text('Login',
                                      style: TextStyle(fontSize: 20)),
                                  onPressed: () {}),
                            ),
                            Container(
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Checkbox(
                                      value: rememberMe,
                                      onChanged: (bool value) {},
                                    ),
                                    Text('Remember Me ',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                  ]),
                            ),
                            FlatButton(
                              onPressed: () {},
                              textColor: Colors.red,
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Container(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'No account yet?',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                                SizedBox(width: 10),
                                FlatButton(
                                  textColor: Colors.red,
                                  child: Text(
                                    'Register',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  onPressed: registerUser,
                                ),
                              ],
                            ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ))));
  }

  void registerUser() {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => RegisterScreen()));
    {}
  }
}
