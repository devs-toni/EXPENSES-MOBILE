class Exception {
  int status_code = 0;
  String type = '';
  String detail = '';

  Exception(int status_code, String type, String detail) {
    this.status_code = status_code;
    this.type = type;
    this.detail = detail;
  }

  Exception.fromJson(Map<String, dynamic> json) {
    status_code = int.parse(json['status_code']);
    type = json['type'];
    detail = json['detail'];
  }
}