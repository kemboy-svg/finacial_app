
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gcib_bank/presentation/home_page/home_screen.dart';
import 'package:gcib_bank/presentation/investments/join_Investment/join_investment_screen.dart';
import 'package:gcib_bank/presentation/investments/list_investments/list_investments_screen.dart';
import 'package:gcib_bank/presentation/login/login_screen.dart';
import 'package:gcib_bank/shared_blocs/auth/bloc/auth_bloc.dart';
import 'package:gcib_bank/shared_blocs/myinv/bloc/myinv_bloc.dart';
import 'package:invst_repo/invst_repo.dart';
import 'app_exports.dart';

import 'package:auth_repo/auth_repo.dart';

import 'presentation/investments/list_investments/bloc/allinv_bloc.dart';


/// app.dart is split into two parts App and AppView.
/// App defines a RepositoryProvider which provides a single instance of auth repo to the entire app
/// AppView consumes this repo.
///
/// This decoupling will enable us to easily test both the App and AppView widgets
/// later on.

class App extends StatefulWidget {
  const App({Key? key, required this.authRepo, required this.invRepo, })
      : super(key: key);

  final AuthRepo authRepo;
  final InvstRepo invRepo;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AuthRepo _authRepo;
  late final InvstRepo _invRepo;

  @override
  void initState() {
    super.initState();

    _authRepo = widget.authRepo; // comes from bootstrap
    _invRepo = widget.invRepo;
  }

  @override
  void dispose() {
    _authRepo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.white));

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepo>.value(value: _authRepo),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (_) => AuthBloc(
              authRepo: _authRepo,
            ),
          ),
          BlocProvider<MyInvBloc>(
            create: (_) => MyInvBloc(
              invRepo: _invRepo,
            ),
          ),
          BlocProvider<AllInvBloc>(
            create: (_) => AllInvBloc(
              invRepo: _invRepo
            ),
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  /// AppView is a StatefulWidget because it maintains a GlobalKey which is used
  /// to access the NavigatorState
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme,
          title: 'GCIB',
          
            // colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kPink),
          
          navigatorKey: _navigatorKey,
          routes: {

            'login_screen':(context)=>   LoginPageScreen(),
            'home_screen':(context)=>    HomeScreen(),
            'list_investments':(context) => ListInvestmentsScreen(),
            'join_investments':(context)=> JoinInvestmentScreen(),
          },
          builder: (context, child) {
            return BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                switch (state.status) {
                  case AuthStatus.authenticated:
                    _navigator.pushAndRemoveUntil<void>(
                      HomeScreen.route(),
                      (route) => false,
                    );
                    break;
                     case AuthStatus.authenticating:
                    _navigator.pushAndRemoveUntil<void>(
                      LoginPageScreen.route(),
                      (route) => false,
                    );
                    break;

                     case AuthStatus.autherror:
                    _navigator.pushAndRemoveUntil<void>(
                      LoginPageScreen.route(),
                      (route) => false,
                    );
                    break;
                  case AuthStatus.unauthenticated:
                    _navigator.pushAndRemoveUntil<void>(
                      LoginPageScreen.route(),
                      (route) => false,
                    );
                    break;
                    case AuthStatus.unconfirmed:
                    _navigator.pushAndRemoveUntil<void>(
                      LoginPageScreen.route(),
                      (route) => false,
                    );
                    break;
                  case AuthStatus.unknown:
                    break;
                }
              },
              child: child,
            );
          },
           onGenerateRoute: (_) => LoginPageScreen.route(),
        );
      }
    );
  }
}