class AkunModel {
  /// Api
  String timestamp = '';
  int status = 404;
  String message = '';
  List<User> users = [
    User(
      companyCode: '',
      company: '',
      branch: '',
      code: '',
      name: 'Cordova Mobile',
      registration: '',
      handphone: '',
      email: '',
      gender: '',
      dob: '',
      address: '',
      city: '',
      postCode: '',
    )
  ];
}

class User {
  String companyCode;
  String company;
  String branch;
  String code;
  String name;
  String registration;
  String handphone;
  String email;
  String gender;
  String dob;
  String address;
  String city;
  String postCode;

  User({
    required this.companyCode,
    required this.company,
    required this.branch,
    required this.code,
    required this.name,
    required this.registration,
    required this.handphone,
    required this.email,
    required this.gender,
    required this.dob,
    required this.address,
    required this.city,
    required this.postCode,
  });
}