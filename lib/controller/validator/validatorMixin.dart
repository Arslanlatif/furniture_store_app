mixin FormValidationMixin {
  String? emptyValidation(String? value) {
    if (value == null || value.toString().trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  String? passwordValidation(String? value) {
    if (value == null || value.toString().isEmpty) {
      return 'This field is required';
    } else if (value.length < 4 || value.length > 60) {
      return 'Your password must contains between 4 and 60 characters';
    }
    return null;
  }

  String? phoneNumberValidation(String? value) {
    if (value == null || value.toString().isEmpty) {
      return 'This field is required';
    }
    final regx = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
    if (!regx.hasMatch(value.toString())) {
      return 'Please enter a valid Phone Number';
    }
    return null;
  }

  String? emailValidation(String? value) {
    if (value == null || value.toString().isEmpty) {
      return 'This field is required';
    }
    final regx = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regx.hasMatch(value.toString())) {
      return 'Please enter a valid email address';
    }
    return null;
  }
}
