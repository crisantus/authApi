import 'package:auth_app/apis/apis.dart';
import 'package:auth_app/models/loginUser.dart';
import 'package:auth_app/screens/home.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerEmail = TextEditingController();

  TextEditingController controllerPassword = TextEditingController();

  var _formkey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controllerEmail.clear();
    controllerPassword.clear();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('LogIn'),
        ),
        body: Form(
          key: _formkey,
          child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextFormField(
                      controller: controllerEmail,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter Your Email";
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
                      controller: controllerPassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Required";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter Your Password',
                      ),
                    ),
                  ),
                  Container(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        LoginUser data = LoginUser(
                          email: controllerEmail.text,
                          password: controllerPassword.text,
                        );

                        if (_formkey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          ApiServices api = ApiServices();
                          api.loginUser(data).then((value) => {
                                if (value)
                                  {
                                    setState(() {
                                      isLoading = false;
                                    }),
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage(
                                                email: controllerEmail.text,
                                              )),
                                    )
                                  }
                                else
                                  {debugPrint('value: false.')}
                              });
                        }
                      },
                      child: isLoading
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text("Login"),
                    ),
                  )
                ],
              )),
        ));
  }
}
