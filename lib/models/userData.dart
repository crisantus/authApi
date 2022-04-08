// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
    UserData({
        required this.terminus,
        required this.status,
        required this.response,
    });

    String terminus;
    String status;
    Response response;

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        terminus: json["terminus"],
        status: json["status"],
        response: Response.fromJson(json["response"]),
    );

    Map<String, dynamic> toJson() => {
        "terminus": terminus,
        "status": status,
        "response": response.toJson(),
    };
}

class Response {
    Response({
        required this.code,
        required this.subject,
        required this.message,
        required this.count,
        required this.data,
    });

    String code;
    String subject;
    String message;
    int count;
    Data data;

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        code: json["code"],
        subject: json["subject"],
        message: json["message"],
        count: json["count"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "subject": subject,
        "message": message,
        "count": count,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.the1,
    });

    The1 the1;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        the1: The1.fromJson(json["1"]),
    );

    Map<String, dynamic> toJson() => {
        "1": the1.toJson(),
    };
}

class The1 {
    The1({
        required this.userguid,
        required this.email,
        required this.dating,
    });

    String userguid;
    String email;
    String dating;

    factory The1.fromJson(Map<String, dynamic> json) => The1(
        userguid: json["userguid"],
        email: json["email"],
        dating: json["dating"],
    );

    Map<String, dynamic> toJson() => {
        "userguid": userguid,
        "email": email,
        "dating": dating,
    };
}
