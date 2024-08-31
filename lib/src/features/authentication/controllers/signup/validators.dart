String? validatePhoneNo(String? value) {
  if (value == null || value.isEmpty) {
    return 'Phone number is required';
  }
  if (!RegExp(r"^\d{11}$").hasMatch(value)) {
    return 'Enter a valid phone number (11 digits)';
  }
  return null;
}

