const String baseURL = 'http://buypartsonline.in/AdminSide/Admin/Ajax/';
const String imageURL = 'https://buypartsonline.in/AdminSide/resources/images/';
const String aboutUsPageURL = 'http://buypartsonline.in/#/about';
const String privacyPolicyURL = 'http://buypartsonline.in/#/privacypolicy';
const String returnPolicyURL = 'http://buypartsonline.in/#/return-policy';

const loginURL = 'login_api';
const signupURL = 'RegisterCustomer';
const getBannerData = 'getBannerData';
const getCategoryData = 'CategoryPriority/all';
//const getCategoryData = 'getCategoryData';
const getSearchVehicleURL = 'get_all_data_api_final/makerstype';
const getVehicleMakerURL =
    'get_a_data_join_parent_api_final/makers/makerstype/';
const getModelURL = 'get_a_data_join_parent_api_final/model/makers/';
const getModelModificationURL =
    'get_a_data_join_parent_api_final/modification/model/';
const getModelYearURL = 'getModificationYearByModelId/';
const getModelCategoryURL = 'CategoryPriority/all/';
const getCartDetailsURL = 'getCartTotalv2';
const updateCartQty = 'updateCartQty';
const removeCart = 'removeCart';
const getProfileByCustomerId = 'getProfileByCustomerId';
const updateProfile = 'updateProfile';
const customModelURL =
    'FilterV3WithSortingTestingV3?/catlog?BrandId=[]&MinPrice=undefined&MaxPrice=undefined&';
const addToCartURL = 'addToCartOld';
const addAddressURL = 'addAddressForBuyPart';
const allAddressURL = 'getAddress';
const setDefaultAddressURL = 'updateDefaultAddress';
const getCartTotalURL = 'countCartDataByCustomerId';
const verifyOTPURL = 'verifyOTP';
const getDefaultAddressURL = 'getDefaultAddress';
const placeOrderForBuyPartURL = 'placeOrderForBuyPart';
const getOrderStatusURL = 'orderHistory';
const getOrderPartDetailURL = 'orderHistoryDetail';
const getBrandURL = 'Priority';
const otpForForgotPasswordURL = 'sendOTPForForgotPassword/';
const verifyOTPForForgotPasswordURL = 'verifyOTPForForgotPassword';
const updateCustomerPasswordURL = 'updateCustomerPassword';
const updateAddressURL = 'updateAddress';
const deleteAddressURL = 'deleteAddress';
const cancelOrderURL = 'cancelOrder';

class NetworkConstants {
  static const String errorMessage4xx =
      "Please try logging out and logging back in";
  static const String errorTitle4xx = "Invalid Credentials";
  static const String errorTitle5xx = "Server Error";
  static const String errorMessage5xx =
      "The server was unable to process your request";
  static const String errorTitle = 'Error';
  static const String errorUnknownError = 'Unknown error';
}
