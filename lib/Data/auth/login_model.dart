class LoginModel {
  bool? success;
  String? successMessage;
  Data? data;
  String? responseTime;

  LoginModel({this.success, this.successMessage, this.data, this.responseTime});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    successMessage = json['successMessage'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    responseTime = json['responseTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['success'] = success;
    data['successMessage'] = successMessage;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['responseTime'] = responseTime;
    return data;
  }
}

class Data {
  String? password;
  String? email;

  Data({this.password, this.email});

  Data.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['password'] = this.password;
    data['email'] = this.email;
    return data;
  }
}
