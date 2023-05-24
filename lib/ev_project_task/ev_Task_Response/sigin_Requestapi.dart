class SignupRequest {
  String? email;
  String? phone;
  String? password;
  String? deviceType;
  String? deviceToken;

  SignupRequest(
      {this.email,
        this.phone,
        this.password,
        this.deviceType,
        this.deviceToken});

  SignupRequest.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    deviceType = json['device_type'];
    deviceToken = json['device_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['device_type'] = this.deviceType;
    data['device_token'] = this.deviceToken;
    return data;
  }
}
