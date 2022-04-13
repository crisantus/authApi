import 'package:auth_app/apis/apis.dart';
import 'package:auth_app/models/signUpUser.dart';
import 'package:auth_app/screens/login.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  //TextEditingController controllerPhone = TextEditingController();
  var _formkey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controllerUsername.clear();
    controllerEmail.clear();
    controllerPhone.clear();
    controllerPassword.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
        ),
        body: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: TextFormField(
                        controller: controllerEmail,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Required";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          hintText: 'Enter Your Email',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: TextFormField(
                        controller: controllerPhone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Required";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'User Phone Number',
                          hintText: 'Enter Your Phone Number',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: TextFormField(
                        controller: controllerUsername,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Required";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'User Name',
                          hintText: 'Enter Your Name',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: TextFormField(
                        controller: controllerPassword,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Required";
                          } else {
                            return null;
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Enter Password',
                        ),
                      ),
                    ),
                    Container(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        child: isLoading
                            ? CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text("Sign Up"),
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            ApiServices api = ApiServices();
                            api.createUser(
                              email: controllerEmail.text,
                              phone: controllerPhone.text,
                              username: controllerUsername,
                              password: controllerPassword.text,
                            ).then((value) => {
                                  setState(() {
                                    isLoading = false;
                                  }),
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()))
                                });
                          }
                        },
                      ),
                    )
                  ],
                )),
          ),
        ));
  }
}
