class Signin {
  String? email;
  String? password;

  Map<String, dynamic> toJson() {
    Map<String, dynamic> keyValue = {
      'email': email,
      'password': password,
    };
    return keyValue;
  }
}


