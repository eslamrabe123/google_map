class AppRegex {
  AppRegex._internal();
  static final AppRegex _instance = AppRegex._internal();
  factory AppRegex() => _instance;

  RegExp doubleNumRegEx = RegExp(r'(^\d*\.?\d*)');
  RegExp intNumRegEx = RegExp(r'(^\d*)');
  RegExp arabicRegEx = RegExp(r'[\u0600-\u06FF]');
  RegExp emailReg = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
}
