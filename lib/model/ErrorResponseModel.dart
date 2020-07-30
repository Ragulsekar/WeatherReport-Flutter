class ErrorResponseModel {
  String error;
  String message;
  String errorDescription;

  ErrorResponseModel({this.error, this.errorDescription, this.message});

  ErrorResponseModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    errorDescription = json['error_description'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['error_description'] = this.errorDescription;
    data['message'] = this.message;
    return data;
  }
}