import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  String login;
  @HiveField(1)
  String firstName;
  @HiveField(2)
  String lastName;
  @HiveField(3)
  String fatherName;
  @HiveField(4)
  String telephone;
  @HiveField(5)
  String password;
  @HiveField(6)
  String dateOfBirth;
  @HiveField(7)
  int cardNumber;
  @HiveField(8)
  String programName;


  User({
    required this.login,
    required this.firstName,
    required this.lastName,
    required this.fatherName,
    required this.telephone,
    required this.password,
    required this.dateOfBirth,
    required this.programName,
    required this.cardNumber,
  });
}
