class NOK {
  final String ID, firstName, lastName, midNames, addr, phoneNo, percentShare;
  final String? title, relationship, email, gender;
  // final int? ;

  NOK({
    required this.ID,
    this.title,
    required this.firstName,
    required this.midNames,
    required this.lastName,
    this.relationship,
    this.gender,
    required this.addr,
    required this.phoneNo,
    this.email,
    required this.percentShare,
  });
}