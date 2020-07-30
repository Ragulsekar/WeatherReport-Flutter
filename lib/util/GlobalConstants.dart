class GlobalConstants {

  static final accessKey = "c631a9d9282cb81469c0b7cbdd12a3cd";

  static final baseURL = "http://api.weatherstack.com/";
  static final currentCity = baseURL + "current";

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Please enter a valid Email';
    else
      return null;
  }
}