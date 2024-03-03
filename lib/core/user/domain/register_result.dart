class RegisterResult {
  String id = '';
  bool acknowledged = true;

  RegisterResult(this.id, this.acknowledged);

  RegisterResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    acknowledged = json['acknowledged'];
  }
}