// lib/utils/validation.dart
class Validation {
  static bool isEmail(String? email) {
    if (email == null) return false;
    final RegExp emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );
    return emailRegex.hasMatch(email);
  }

  static bool isPhoneNumber(String? phone) {
    if (phone == null) return false;
    final RegExp phoneRegex = RegExp(r'^[0-9]{10}$');
    return phoneRegex.hasMatch(phone);
  }
}
