import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:auth_repo/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required AuthRepo authRepo})
      : _authRepo = authRepo,
        super(const AuthState.unknown()) {
    // defines the initial state as AuthenticationState.unknown() (above)
    on<_AuthStatusChanged>(_onAuthStatusChanged);
    on<AuthLogoutRequested>(_onAuthLogoutRequested);
    // AuthBloc subscribes to the status stream of the AuthRepo
    _authStatusSubscription = _authRepo.status.listen(
      // and adds an AuthenticationStatusChanged event internally in response to a new AuthStatus
      (status) => add(_AuthStatusChanged(status)),
    );
  }

  final AuthRepo _authRepo;
  late StreamSubscription<AuthStatus> _authStatusSubscription;

  @override
  Future<void> close() {
    _authStatusSubscription.cancel();
    return super.close();
  }

  
  Future<void> _onAuthStatusChanged(
    _AuthStatusChanged event,
    Emitter<AuthState> emit,
  ) async {
    switch (event.status) {
      case AuthStatus.unauthenticated:
        return emit(const AuthState.unauthenticated());
      case AuthStatus.authenticated:
        // get token
        final token = await _authRepo.getToken();
        return emit(token != null
            ? const AuthState.authenticated()
            : const AuthState.unauthenticated());
      case AuthStatus.unknown:
        return emit(const AuthState.unknown());
      case AuthStatus.authenticating:
        return emit(const AuthState.authenticating());
      case AuthStatus.autherror:
        return emit(const AuthState.autherror());
      case AuthStatus.unconfirmed:
        return emit(const AuthState.unconfirmed());
    }
  }

  void _onAuthLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) {
    _authRepo.logOut();
  }
}