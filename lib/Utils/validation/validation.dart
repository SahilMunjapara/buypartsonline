class Validator {
  static String? nameValidationMsg(String? username) {
    if (username?.isEmpty ?? true) {
      return "Name is required";
    } else if (!validCharacters.hasMatch(username!)) {
      return "Special Characters are not allowed";
    } else if (username.length < 3) {
      return "FirstName must be atleast 3 characters";
    } else if (username.length > 30) {
      return "FirstName cannot be greater than 30 characters";
    } else {
      return null;
    }
  }

  static String? companyNameValidationMsg(String? companyName) {
    if (companyName?.isEmpty ?? true) {
      return "Company Name is required";
    } else if (!validCharacters.hasMatch(companyName!)) {
      return "Special Characters are not allowed";
    } else {
      return null;
    }
  }

  static String? firstNameValidationMsg(String? username) {
    if (username?.isEmpty ?? true) {
      return "FirstName is required";
    } else if (!validCharacters.hasMatch(username!)) {
      return "Special Characters are not allowed";
    } else if (username.length < 3) {
      return "FirstName must be atleast 3 characters";
    } else if (username.length > 30) {
      return "FirstName cannot be greater than 30 characters";
    } else {
      return null;
    }
  }

  static String? lastNameValidationMsg(String? username) {
    if (username?.isEmpty ?? true) {
      return "LastName is required";
    } else if (!validCharacters.hasMatch(username!)) {
      return "Special Characters are not allowed";
    } else if (username.length < 3) {
      return "LastName must be atleast 3 characters";
    } else if (username.length > 30) {
      return "LastName cannot be greater than 30 characters";
    } else {
      return null;
    }
  }

  static String? mobileValidationMsg(String? value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if ((value?.length ?? 0) == 0) {
      return 'Please enter mobile number';
    } else if (value!.length > 10) {
      return 'Mobile Number must be of 10 digit';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  static String? pincodeValidationMsg(String? value) {
    String pattern = "^[1-9]{1}[0-9]{2}[0-9]{3}\$";
    RegExp regExp = RegExp(pattern);
    if ((value?.length ?? 0) == 0) {
      return "Pincode is required";
    } else if (value!.length > 6) {
      return "Pincode are to large";
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid PinCode';
    }
    return null;
  }

  static String? addressValidator(String? value) {
    if (value?.isEmpty ?? false) {
      return 'Address is required';
    } else if (value!.length > 50) {
      return 'Address should be 50 character';
    } else {
      return null;
    }
  }

  static String? landmarkValidator(String? value) {
    if (value?.isEmpty ?? false) {
      return 'Landmark is required';
    } else if (value!.length > 20) {
      return 'Landmark should be 20 character';
    } else {
      return null;
    }
  }

  static String? countryValidator(String? value) {
    if (value?.isEmpty ?? false) {
      return 'Country is required';
    } else {
      return null;
    }
  }

  static String? countryCodeValidator(String? value) {
    if (value?.isEmpty ?? false) {
      return 'Country Code is required';
    } else {
      return null;
    }
  }

  static String? cityValidator(String? value) {
    if (value?.isEmpty ?? false) {
      return 'City is required';
    } else {
      return null;
    }
  }

  static String? addressTileValidator(String? value) {
    if (value == null) {
      return 'Address Tile is required';
    }
    return null;
  }

  static String? stateValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'State is required';
    }
    return null;
  }

  static String? emailValidator(String? email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    if (email?.isEmpty ?? true) {
      return "Email is required";
    } else if (!regex.hasMatch(email!)) {
      return "Please provide a valid email";
    } else if (email.length > 45) {
      return "Email must be less than 45 characters";
    } else {
      return null;
    }
  }

  static String? phoneValidationMsg(String? value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if ((value?.length ?? 0) == 0) {
      return 'Please enter phone number';
    } else if (!regExp.hasMatch(value!)) {
      return 'Please enter valid phone number';
    }
    return null;
  }

  static bool isValidPassword(String password) =>
      (password.isNotEmpty && password.length > 6 && password.length < 24);

  static String? passwordValidationMsg(String? password) {
    if (password == null) {
      return "Password is required";
    } else if (password.length < 6) {
      return "Password must be at least 8 characters";
    } else if (password.length > 24) {
      return "Password cannot be greater than 24 characters";
    } else {
      return null;
    }
  }

  static String? confirmPassword(String? password) {
    if (password == null) {
      return "Password is required";
    } else if (password.length < 6) {
      return "Password must be at least 8 characters";
    } else if (password.length > 24) {
      return "Password cannot be greater than 24 characters";
    } else {
      return null;
    }
  }

  static String? commentValidationMsg(String? comment) {
    if ((comment?.length ?? 0) > 1000) {
      return "Comment cannot be greater than 1000 characters";
    } else {
      return null;
    }
  }

  static bool isValidPincode(String pincode) {
    if (pincode.isNotEmpty) {
      Pattern pattern = "^[1-9]{1}[0-9]{2}[0-9]{3}\$";
      RegExp regex = RegExp(pattern.toString());
      return pincode.length == 6 && regex.hasMatch(pincode);
    } else {
      return false;
    }
  }

  static bool isEmailValid(String email) {
    if (email.isNotEmpty) {
      Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = RegExp(pattern.toString());
      return email.length <= 45 && regex.hasMatch(email);
    } else {
      return false;
    }
  }

  static String? emailValidationMsg(String? email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    if (email == null || email.isEmpty) {
      return "Email is required";
    } else if (!regex.hasMatch(email)) {
      return "Please provide a valid email";
    } else if (email.length > 45) {
      return "Email must be less than 45 characters";
    } else {
      return null;
    }
  }

  static String? orderIdValidator(String? value) {
    if (value == null) {
      return 'Select the Role';
    } else {
      return null;
    }
  }

  static String? selectRoleValidator(String? value) {
    if (value == null) {
      return 'Select the Role';
    } else {
      return null;
    }
  }

  static String? selectQualification(String? value) {
    if (value == null) {
      return 'Select the Qualification';
    } else {
      return null;
    }
  }

  static String? selectCityValidator(String? value) {
    if (value == null) {
      return 'Select the Role';
    } else {
      return null;
    }
  }

  static String? reasonValidator(String? value) {
    if (value == null) {
      return 'Reason is Required';
    } else {
      return null;
    }
  }

  static String? conditionValidator(String? value) {
    if (value == null) {
      return 'Condition is Required';
    } else {
      return null;
    }
  }

  static String? resolutionValidator(String? value) {
    if (value == null) {
      return 'Resolution is Required';
    } else {
      return null;
    }
  }

  static final validCharacters = RegExp(r'^[a-zA-Z0-9 \-,\.]+$');

  static final validOtp = RegExp('^([0-9]{4})\$');
}
