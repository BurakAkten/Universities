class ResponseModel {
  dynamic data;
  String errorMessage;
  bool isSuccess;

  ResponseModel({this.data, this.errorMessage, this.isSuccess = true});
}
