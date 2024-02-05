import 'package:data_api/data_api.dart';

abstract class DataApi {
  // The class has a single constructor
  const DataApi();

  Future<AuthDTO> logInUser({
    required String email,
    required String password,
  });

  Future<void> saveAuthLocally(AuthDTO authDTO);

  Future<String?> getToken();

  Future<bool> sendEmailForNewPwd(String email);

  Future<dynamic> signUpUser(signUpDTO registerDTO);

  Future<bool> joinInvst(JoinInvst joinInvst);
  
  Future<List<Investment>> listMyInv();

  Future<List<Fund>> getAllInv();
  


}