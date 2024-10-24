class RegistrationModel {
  String? firstName;
  String? lastName;
  String? email;
  String? username;
  String? dateJoined;
  int? password;
  String? dob;
  String? address;

  RegistrationModel(
      {this.firstName,
      this.lastName,
      this.email,
      this.username,
      this.dateJoined,
      this.password,
      this.dob,
      this.address});

  RegistrationModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    username = json['username'];
    dateJoined = json['date_joined'];
    password = json['password'];
    dob = json['dob'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['username'] = username;
    data['date_joined'] = dateJoined;
    data['password'] = password;
    data['dob'] = dob;
    data['address'] = address;
    return data;
  }
}
