class PostResponse {
  String? firstName;
  String? lastName;
  String? email;
  String? password;

  Map<String, dynamic> toJson() {
    Map<String, dynamic> keyValue = {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
    };
    return keyValue;

  }
}
