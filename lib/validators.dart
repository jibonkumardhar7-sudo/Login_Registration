final RegExp emailRegex = RegExp(r'^[\w\.-]+@([\w-]+\.)+[\w-]{2,}$');
final RegExp passwordRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$');
final RegExp phoneRegex = RegExp(r'^(?:\+88|88)?01[3-9]\d{8}$');

String? validateEmail(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Enter email';
  }
  if (!emailRegex.hasMatch(value.trim())) {
    return 'Enter valid email';
  }
  return null;
}

String? validateEmailOrPhone(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Enter email or phone number';
  }
  final input = value.trim();
  if (emailRegex.hasMatch(input) || phoneRegex.hasMatch(input)) {
    return null;
  }
  return 'Enter valid email or phone number';
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Enter password';
  }
  if (!passwordRegex.hasMatch(value)) {
    return 'Min 8 characters, with uppercase, lowercase and a number';
  }
  return null;
}

String? validateLoginPassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Enter password';
  }
  return null;
}