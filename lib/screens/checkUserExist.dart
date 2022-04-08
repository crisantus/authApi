import 'package:auth_app/apis/apis.dart';
import 'package:auth_app/screens/login.dart';
import 'package:auth_app/screens/signUp.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class CheckUserExist extends StatefulWidget {
  CheckUserExist({Key? key}) : super(key: key);

  @override
  State<CheckUserExist> createState() => _CheckUserExistState();
}

class _CheckUserExistState extends State<CheckUserExist> {
  bool isEmail(String input) => EmailValidator.validate(input);
  TextEditingController controller = TextEditingController();
  var _formkey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    @override
    void dispose() {
      // TODO: implement dispose
      super.dispose();
      controller.clear();
      setState(() {
        isLoading = false;
      });
    }

    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      setState(() {
        isLoading = false;
      });
    }

    return Scaffold(
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
                    controller: controller,
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
                  )),
              Container(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async{
                    if (_formkey.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });
                      ApiServices api = ApiServices();
                      await api.checkUser(email: controller.text).then((value) => {
                            debugPrint('check:${value?.status}'),
                            debugPrint(controller.text),
                            if (value?.status == 'OK')
                              {
                                setState(() {
                                  isLoading = false;
                                }),
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()),
                                )
                              }
                            else
                              {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpPage()),
                                )
                              }
                          });
                    }
                  },
                  child: isLoading
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text("Check User"),
                ),
              )
            ],
          )),
    ));
  }
}
