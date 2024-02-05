import 'dart:async';
import 'package:data_api/data_api.dart';

enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated,
  authenticating,
  autherror,
  unconfirmed,
}

class AuthRepo {
  final _controller = StreamController<AuthStatus>();
  final DataApi _dataApi;

  AuthRepo({required DataApi dataApi}) : _dataApi = dataApi;

  Stream<AuthStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));

    /// The yield keyword is used to emit values from the stream
    /// The yield* keyword is used to delegate control to another generator.
    yield AuthStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn({
    required String email,
    required String password,
  }) async {
    _controller.add(AuthStatus.authenticating);
    try {
      // attempt login
      AuthDTO authDTO =
          await _dataApi.logInUser(email: email, password: password);

      // if successful save authDTO to local db
      await _dataApi.saveAuthLocally(authDTO);
      _controller.add(AuthStatus.authenticated);
    } catch (e) {
      if (e.toString() == "Exception: 406") {
        _controller.add(AuthStatus.unconfirmed);
      } else {
        _controller.add(AuthStatus.autherror);
        // No specified type, handles all
        print('Something really unknown: $e');
      }
    }
  }

  Future<bool> sendEmailForNewPwd(String email) async {
    try {
      return await _dataApi.sendEmailForNewPwd(email);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<dynamic> signUp(signUpDTO registerDTO) async {
    try {
      return await _dataApi.signUpUser(registerDTO);
    } catch (e) {
      throw Exception(e);
    }
  }


  void logOut() {
    _controller.add(AuthStatus.unauthenticated);
  }

  /// a dispose method is exposed so that the controller can be closed when it
  /// is no longer needed
  void dispose() => _controller.close();

  Future<String?> getToken() async {
    try {
      final token = await _dataApi.getToken();
      return token;
    } catch (e) {
      return null;
    }
  }
}

class CustomException implements Exception {
  final String message;

  CustomException(this.message);

  // @override
  // String toString() => 'CustomException: $message';
  @override
  String toString() => message;
}