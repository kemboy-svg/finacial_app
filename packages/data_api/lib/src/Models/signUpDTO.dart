import 'package:data_api/data_api.dart';

class signUpDTO {
  final String title,
      firstName,
      lastName,
      dob,
      idNumber,
      kraPin,
      phoneNo,
      email,
      password,
      empStatus,
      incomeFreq;

  final String? middleNames, country, address, city, salary;
  final List<OnboardFile> selectedFiles;
  final int? gender;
  final List<NOK>? nok;
  final bool acceptTerms;

  signUpDTO({
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.dob,
    required this.idNumber,
    required this.kraPin,
    required this.phoneNo,
    required this.email,
    required this.password,
    required this.empStatus,
    required this.incomeFreq,
    required this.selectedFiles,
    this.middleNames,
    this.country,
    this.gender,
    this.address,
    this.city,
    this.salary,
    this.nok,
    required this.acceptTerms,
  });
}