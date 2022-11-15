String errorBlankInput(field) {
  return "$field can\'t be left blank";
}

String errorEmptyField(field) {
  return "$field can\'t be empty";
}

/// password should contain at least 1 lowercase, 1 uppercase, 1 number
bool isPasswordValid(String password) {
  return (password.length >= 10 &&
      password.contains(RegExp(r'[a-z]')) &&
      password.contains(RegExp(r'[A-Z]')) &&
      password.contains(RegExp(r'[0-9]')));
}

/// if password length == 0, return true and used current password to update data
bool checkPasswordEditProfile(String password) {
  return !((password.isEmpty) ||
      (password.length >= 10 &&
          password.contains(RegExp(r'[a-z]')) &&
          password.contains(RegExp(r'[A-Z]')) &&
          password.contains(RegExp(r'[0-9]'))));
}

bool isPhoneNumberValid(String number) {
  return (number.contains(RegExp(r'^[0-9]{8,11}$')));
}
