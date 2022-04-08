import 'package:auth_app/apis/apis.dart';
import 'package:auth_app/models/userData.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({required this.email, Key? key}) : super(key: key);

  String email;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String email;
  late ApiServices api;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    email = widget.email;
    api = ApiServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<UserData?>(
          future: api.userData(email: email),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(snapshot.data!.response.data.the1.userguid),
                  Text(snapshot.data!.response.data.the1.email),
                  Text(snapshot.data!.response.data.the1.dating),
                  Text(snapshot.data!.status),
                  Text(snapshot.data!.response.message)
                ],
              ));
            } else if (snapshot.hasError) {
              return Center(child: Text('${snapshot.error}'));
            }

            // By default, show a loading spinner.
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
