class CustomException implements Exception {
  String Errormessage;
  CustomException(this.Errormessage);
  String toString() {
    return Errormessage;
  }
}
