class Strings {
  static const String roleDoctor = 'Doctor';
  static const String skip = 'Skip';
  static const String signUp = 'Signup';
  static const String login = 'Login';
  static const String signUpTitle = 'Create your account';
  static const String loginTitle = 'Login Your Account';
  static const String name = 'Name';
  static const String emailId = 'Email ID';
  static const String email = 'Email';
  static const String mobileNumber = 'Mobile Number';
  static const String password = 'Password';
  static const String confirmPassword = 'Confirm Password';
  static const String selectRole = 'Select Role';
  static const String selectCity = 'Select City';
  static const String selectQualification = 'Select Qualification';
  static const String iAgreeTo = 'I agree to ';
  static const String termAndCondition = 'terms & condition ';
  static const String andCharacter = '& ';
  static const String orCharacter = 'or';
  static const String privacyPolicy = 'privacy policy';
  static const String registorNow = 'Registor Now';
  static const String forgotPassword = 'Forgot your password';
  static const String alreadyHaveAccount = 'Already have an Account?';
  static const String dontHaveAccount = 'i don\'t have an account?';
  static const String loginNow = ' Login Now';
  static const String resetPassword = 'Reset Password';
  static const String goToLoginPage = 'Go to Login Page ';
  static const String connectToCompare = 'Connect to Compare';
  static const String searchByvehicle = 'Search By Vehicle';
  static const String vehicleMaker = 'Vehicle Maker';
  static const String modelLine = 'Model Line';
  static const String year = 'Year';
  static const String modification = 'Modification';
  static const String selectCategory = 'Select Category';
  static const String searchByVIN = 'Search By VIN';
  static const String myOrders = 'My Orders';
  static const String myProfile = 'My Profile';
  static const String addresses = 'Addresses';
  static const String billingGst = 'Billing/GST';
  static const String cart = 'Cart';
  static const String myGarage = 'My Garage';
  static const String legalAndOthers = 'Legal & Others';
  static const String logout = 'Logout';
  static const String search = 'Search';
  static const String searchHere = 'Search Here';
  static const String searchByCategory = 'Search by Category';
  static const String whyChooseProducts = 'Why Choose Aftermarket Products?';
  static const String originalProduct = 'Original Products';
  static const String originalProductDescription =
      'Only reliable parts from trusted \naftermarket brands';
  static const String maintenaceServiceParts = 'Maintenace\nService Parts';
  static const String airConditioning = 'Air\nConditioning';
  static const String searchParts = 'Search Parts';
  static const String myCart = 'My Cart';
  static const String categoryDataNotAvailable =
      'Category Data Not Available!!!';
  static const String companyName = 'Company Name';
  static const String updateProfile = 'Update Profile';
  static const String notification = 'Notification';
  static const String noPartsAvailable = 'No Parts Available';
  static const String model = 'Model';
  static const String perOff = '% off';
  static const String addToCart = 'Add To Cart';
  static const String noImage = 'no_img.jpg';
  static const String partNumber = 'Part Number';
  static const String origin = 'Origin';
  static const String detailsPageClass = 'Class';
  static const String oneToFivePieces = '1-5 Pieces';
  static const String fiveOrMorePieces = '> 5 Pieces';
  static const String returnText = '5 Days Assured Return';
  static const String gstInvoice = 'GST Invoice';
  static const String congratulationDiscountMSG =
      'congratulations you get higher discount';
  static const String emptyCartMSG = 'Cart Data Not Found!!!';
  static const String totalAmount = 'Total Amount';
  static const String totalSaving = 'Total Saving';
  static const String placeOrder = 'Place Order';
}

class IconStrings {
  static const String nextArrow = '➜'; // → ➜ 🠪 ⇾
}

class ToastString {
  static const String acceptTermsAndConditions =
      'Please accept terms and condition';
  static const String somethingWentWrong = 'Somthing Went Wrong!!!';
  static const String checkEmailForResetPassword =
      'Sent link in above Email for reset passsword.';
}

class ValidatorStrings {
  static const String passwordIsRequired = "Password is required";
  static const String passwordMust8Characters =
      "Password must be at least 8 characters";
  static const String passwordNotGreaterThan24 =
      "Password cannot be greater than 24 characters";
  static const String passwordAndConfirmPasswordNotMatch =
      "Password and confirm password didn't matched";
}

//LOGS
class LogTagString {}

class LogMessageString {}

/// FIREBASE
class FirebaseParamStrings {}

class FirebaseCollectionStrings {}

const String poppins = 'Poppins';

const String undefined = 'undefined';

String getModelDetailEndUrl(
    {String? customerId,
    String? modelLineId,
    String? categoryId,
    String? pageNo}) {
  return 'CustomerId=$customerId&modification3=$modelLineId&modification5=&Sub=undefined&Cat=$categoryId&SPHL=undefined&SPLH=undefined&SAZ=undefined&SZA=undefined&Size=20&Page=$pageNo';
}
