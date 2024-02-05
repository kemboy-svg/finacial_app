part of 'auth_bloc.dart';

class AuthState extends Equatable {

  const AuthState._({this.status = AuthStatus.unknown});

  /// named constructor that creates a new instance of the AuthenticationState
  /// class with status set to AuthenticationStatus.unknown
  const AuthState.unknown() : this._();

  const AuthState.authenticated() : this._(status: AuthStatus.authenticated);

  const AuthState.unauthenticated()
      : this._(status: AuthStatus.unauthenticated);

  const AuthState.authenticating() : this._(status: AuthStatus.authenticating);

  const AuthState.autherror() : this._(status: AuthStatus.autherror);

  const AuthState.unconfirmed() : this._(status: AuthStatus.unconfirmed);

  final AuthStatus status;

  /// is a getter method that returns a list of objects. This method is used by
  /// the Equatable class to compare instances of the AuthenticationState class
  /// for equality
  @override
  List<Object> get props => [status];
}