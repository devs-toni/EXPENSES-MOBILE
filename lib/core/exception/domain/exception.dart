class Exception {
  int statusCode = 0;
  String type = '';
  String detail = '';

  Exception(int statusCode, String type, String detail) {
    this.statusCode;
    this.type;
    this.detail;
  }

  Exception.fromJson(Map<String, dynamic> json) {
    statusCode = int.parse(json['status_code']);
    type = json['type'];
    detail = json['detail'];
  }
}