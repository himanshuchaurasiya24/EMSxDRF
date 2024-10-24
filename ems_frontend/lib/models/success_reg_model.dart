class SuccessReg {
    SuccessReg({
        required this.message,
        required this.data,
    });

    final String? message;
    final Data? data;

    SuccessReg copyWith({
        String? message,
        Data? data,
    }) {
        return SuccessReg(
            message: message ?? this.message,
            data: data ?? this.data,
        );
    }

    factory SuccessReg.fromJson(Map<String, dynamic> json){ 
        return SuccessReg(
            message: json["message"],
            data: json["data"] == null ? null : Data.fromJson(json["data"]),
        );
    }

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
    };

    @override
    String toString(){
        return "$message, $data, ";
    }
}

class Data {
    Data({
        required this.id,
        required this.lastLogin,
        required this.isSuperuser,
        required this.isStaff,
        required this.isActive,
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.password,
        required this.username,
        required this.dateJoined,
        required this.dob,
        required this.address,
        required this.groups,
        required this.userPermissions,
    });

    final int? id;
    final String lastLogin;
    final bool? isSuperuser;
    final bool? isStaff;
    final bool? isActive;
    final String? firstName;
    final String? lastName;
    final String? email;
    final String? password;
    final String? username;
    final DateTime? dateJoined;
    final DateTime? dob;
    final String? address;
    final List<dynamic> groups;
    final List<dynamic> userPermissions;

    Data copyWith({
        int? id,
        String? lastLogin,
        bool? isSuperuser,
        bool? isStaff,
        bool? isActive,
        String? firstName,
        String? lastName,
        String? email,
        String? password,
        String? username,
        DateTime? dateJoined,
        DateTime? dob,
        String? address,
        List<dynamic>? groups,
        List<dynamic>? userPermissions,
    }) {
        return Data(
            id: id ?? this.id,
            lastLogin: lastLogin ?? this.lastLogin,
            isSuperuser: isSuperuser ?? this.isSuperuser,
            isStaff: isStaff ?? this.isStaff,
            isActive: isActive ?? this.isActive,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            email: email ?? this.email,
            password: password ?? this.password,
            username: username ?? this.username,
            dateJoined: dateJoined ?? this.dateJoined,
            dob: dob ?? this.dob,
            address: address ?? this.address,
            groups: groups ?? this.groups,
            userPermissions: userPermissions ?? this.userPermissions,
        );
    }

    factory Data.fromJson(Map<String, dynamic> json){ 
        return Data(
            id: json["id"],
            lastLogin: json["last_login"],
            isSuperuser: json["is_superuser"],
            isStaff: json["is_staff"],
            isActive: json["is_active"],
            firstName: json["first_name"],
            lastName: json["last_name"],
            email: json["email"],
            password: json["password"],
            username: json["username"],
            dateJoined: DateTime.tryParse(json["date_joined"] ?? ""),
            dob: DateTime.tryParse(json["dob"] ?? ""),
            address: json["address"],
            groups: json["groups"] == null ? [] : List<dynamic>.from(json["groups"]!.map((x) => x)),
            userPermissions: json["user_permissions"] == null ? [] : List<dynamic>.from(json["user_permissions"]!.map((x) => x)),
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "last_login": lastLogin,
        "is_superuser": isSuperuser,
        "is_staff": isStaff,
        "is_active": isActive,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "password": password,
        "username": username,
        "date_joined": dateJoined.toString(),
        "dob": dob.toString(),
        "address": address,
        "groups": groups.map((x) => x).toList(),
        "user_permissions": userPermissions.map((x) => x).toList(),
    };

    @override
    String toString(){
        return "$id, $lastLogin, $isSuperuser, $isStaff, $isActive, $firstName, $lastName, $email, $password, $username, $dateJoined, $dob, $address, $groups, $userPermissions, ";
    }
}
