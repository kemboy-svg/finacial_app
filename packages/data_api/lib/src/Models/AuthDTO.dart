class AuthDTO {
  final String token;
  final String expiration;
  final String phoneNo;

  AuthDTO(
      {required this.token, required this.expiration, required this.phoneNo});
}
