import 'dart:convert';

class SignUpUser {
  late String email;
  late String phone;
  late String username;
  late String password;
  late String progress;




  SignUpUser(
      {required this.email,
      required this.phone,
      required this.username,
      required this.password,
      required this.progress});

  factory SignUpUser.fromJson(Map<String, dynamic> json) {
    return SignUpUser(
      email: json['email'],
      phone: json['phone'],
      username: json['username'],
      password: json['password'],
      progress: json['progress'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "phone": phone,
      "username": username,
      "password": password,
      "progress": progress
    };
  }

  @override
  String toString() {
    return 'SignUpUser{"email": $email, "phone": $phone, "username": $username, "password": $password, "progress": $progress}';
  }
}

List<SignUpUser> profileFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<SignUpUser>.from(data.map((item) => SignUpUser.fromJson(item)));
}

String userToJson(SignUpUser data) {
  final jsonData = data.toJson();
  print("SignUp Data ${jsonData}");
  return json.encode(<String, dynamic>{"SignUpData": jsonData});
}
