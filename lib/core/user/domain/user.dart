class LoginResult {
  String firstname = '';
  String lastname = '';
  String email = '';
  String token = '';

  LoginResult(String firstname, String lastname, String email, String token) {
    this.firstname = firstname;
    this.lastname = lastname;
    this.email = email;
    this.token = token;
  }

  LoginResult.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    token = json['token'];
  }
}
