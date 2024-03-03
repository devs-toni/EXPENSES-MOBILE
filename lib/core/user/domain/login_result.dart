class LoginResult {
  String firstname = '';
  String lastname = '';
  String email = '';
  String token = '';

  LoginResult(this.firstname, this.lastname, this.email, this.token);

  LoginResult.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    token = json['token'];
  }
}
