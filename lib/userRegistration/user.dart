//In here first we create the users json model
// To parse this JSON data, do
//

class Users {
  final int? usrId;
  final String usrName;
  final String usrPassword;

  Users({
    this.usrId,
    required this.usrName,
    required this.usrPassword,
  });

  //allows for creating a Users object from a JSON map.
  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      usrId: json['usrId'],
      usrName: json['usrName'],
      usrPassword: json['usrPassword'],
    );
  }

  //converts a Users instance back into a map format
  Map<String, dynamic> toMap() => {
        'usrId': usrId,
        'usrName': usrName,
        'usrPassword': usrPassword,
      };
}
