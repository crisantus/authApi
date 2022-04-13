import 'dart:convert';

class LoginUser {
  late String email;

  late String password;

  LoginUser({
    required this.email,
    required this.password,
  });

  factory LoginUser.fromJson(Map<String, dynamic> json) {
    return LoginUser(
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
    };
  }

  @override
  String toString() {
    return 'SignUpUser{"email": $email, "password": $password}';
  }
}

List<LoginUser> loginFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<LoginUser>.from(data.map((item) => LoginUser.fromJson(item)));
}

String loginToJson(LoginUser data) {
  final jsonData = data.toJson();
  return json.encode(<String, dynamic>{"LoginData": jsonData});
}
