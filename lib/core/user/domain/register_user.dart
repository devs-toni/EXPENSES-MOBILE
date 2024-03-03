class RegisterUser {
  String firstname = '';
  String lastname = '';
  String email = '';
  String birthday = '';
  String phoneNumber = '';
  String password = '';


  RegisterUser(this.firstname, this.lastname, this.email, this.birthday, this.phoneNumber, this.password);


  RegisterUser.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    birthday = json['birthday'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
  }

  Map toJson() => {
    'firstname': firstname,
    'lastname': lastname,
    'email': email,
    'birthday': birthday,
    'phone_number': phoneNumber,
    'password': password
  };

  @override
  String toString() {
    return 'User Firstname: $firstname, User Lastname: $lastname, Email: $email, Phone Number $phoneNumber, Birthday $birthday, Password $password';
  }
}
