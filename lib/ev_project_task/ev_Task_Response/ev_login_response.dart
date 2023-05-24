class LoginRequest {
  String? email;
  String? password;
  String? deviceType;
  String? deviceToken;

  LoginRequest({this.email, this.password,this.deviceToken,this.deviceType});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    deviceType = json['deviceType'];
    deviceToken = json['deviceToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['deviceType'] = this.deviceType;
    data['deviceToken'] = this.deviceToken;
    return data;
  }
}