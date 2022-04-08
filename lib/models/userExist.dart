// To parse this JSON data, do
//
//     final userExist = userExistFromJson(jsonString);

import 'dart:convert';

UserExist userExistFromJson(String str) => UserExist.fromJson(json.decode(str));

String userExistToJson(UserExist data) => json.encode(data.toJson());

class UserExist {
    UserExist({
        required this.terminus,
        required this.status,
        required this.response,
    });

    String terminus;
    String status;
    Response response;

    factory UserExist.fromJson(Map<String, dynamic> json) => UserExist(
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
        required this.avatar,
        required this.dating,
        this.dob,
        required this.email,
        this.gender,
        this.living,
        required this.name,
        this.nationality,
        required this.network,
        required this.nextstep,
        required this.phone,
        required this.source,
        required this.status,
        required this.userguid,
        required this.username,
    });

    String avatar;
    String dating;
    dynamic dob;
    String email;
    dynamic gender;
    dynamic living;
    String name;
    dynamic nationality;
    Network network;
    String nextstep;
    String phone;
    String source;
    String status;
    String userguid;
    String username;

    factory The1.fromJson(Map<String, dynamic> json) => The1(
        avatar: json["avatar"],
        dating: json["dating"],
        dob: json["dob"],
        email: json["email"],
        gender: json["gender"],
        living: json["living"],
        name: json["name"],
        nationality: json["nationality"],
        network: Network.fromJson(json["network"]),
        nextstep: json["nextstep"],
        phone: json["phone"],
        source: json["source"],
        status: json["status"],
        userguid: json["userguid"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "avatar": avatar,
        "dating": dating,
        "dob": dob,
        "email": email,
        "gender": gender,
        "living": living,
        "name": name,
        "nationality": nationality,
        "network": network.toJson(),
        "nextstep": nextstep,
        "phone": phone,
        "source": source,
        "status": status,
        "userguid": userguid,
        "username": username,
    };
}

class Network {
    Network({
        required this.dating,
    });

    String dating;

    factory Network.fromJson(Map<String, dynamic> json) => Network(
        dating: json["DATING"],
    );

    Map<String, dynamic> toJson() => {
        "DATING": dating,
    };
}
