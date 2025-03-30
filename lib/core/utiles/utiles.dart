
import '../helper/shared_preference_helper.dart';
import 'locator.dart';
import 'validations.dart';

class Utils {

  static String token = '';
  static String lang = '';
  static String FCMToken = '';
  
  static Validation get valid => locator<Validation>();
  static SharedPreferencesHelper get sharePreference => locator<SharedPreferencesHelper>();
}
