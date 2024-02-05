import 'package:auth_repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:gcib_bank/core/utils/spinner.dart';
import 'package:gcib_bank/shared_blocs/auth/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app_exports.dart';

// ignore: must_be_immutable
class LoginPageScreen extends StatefulWidget {
  LoginPageScreen({Key? key})
      : super(
          key: key,
        );
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => LoginPageScreen());
  }

  @override
  State<LoginPageScreen> createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isValidEmail(String email) {
    // Use a regular expression for basic email validation
    // You can customize this based on your specific email validation rules
    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegExp.hasMatch(email);
  }

  void onSubmit() async {
    AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    AuthStatus status = authBloc.state.status;

    if (status != AuthStatus.authenticating &&
        _formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      String email = emailController.text;
      String passwd = passwordController.text;

      RepositoryProvider.of<AuthRepo>(context)
          .logIn(email: email, password: passwd);
      print("email entered ${email}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.unconfirmed) {
          UtilityWidgets.showFeedbackDialog(context,
              msg:
                  'Please check your email for the link to activate your account',
              isError: true, onClick: () {
            Navigator.pop(context, 'Cancel');
          });
        }
        if (state.status == AuthStatus.autherror) {
          Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Text(
              'Incorrect password',
              style: TextStyle(
                color: Colors.redAccent,
              ),
            ),
          );
        }
      },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SizedBox(
            width: SizeUtils.width,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Form(
                key: _formKey,
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.only(
                    left: 27.h,
                    top: 98.v,
                    right: 27.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgGulfbankpic1,
                        height: 171.v,
                        width: 358.h,
                      ),
                      SizedBox(height: 12.v),
                      Padding(
                        padding: EdgeInsets.only(left: 18.h),
                        child: Text(
                          "Welcome Back",
                          style: theme.textTheme.headlineLarge,
                        ),
                      ),
                      SizedBox(height: 63.v),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 17.h,
                          right: 16.h,
                        ),
                        child: CustomFloatingTextField(
                          controller: emailController,
                          labelText: "Email",
                          labelStyle: theme.textTheme.bodyMedium!,
                          hintText: "Email",
                          textInputType: TextInputType.emailAddress,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid email address';
                            } else if (!isValidEmail(value)) {
                              return 'Please enter a valid email address';
                            }
                            // Add more validation checks if needed
                            return null;
                          },
                          alignment: Alignment.centerLeft,
                          prefix: Container(
                            margin: EdgeInsets.only(
                              left: 10.h,
                              right: 13.h,
                            ),
                            child: CustomImageView(
                              imagePath: ImageConstant.imgLock,
                              height: 14.v,
                              width: 10.h,
                            ),
                          ),
                          prefixConstraints: BoxConstraints(
                            maxHeight: 52.v,
                          ),
                        ),
                      ),
                      SizedBox(height: 47.v),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 14.h,
                          right: 19.h,
                        ),
                        child: CustomFloatingTextField(
                          controller: passwordController,
                          labelText: "Password",
                          hintText: "Password",
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Password field is empty';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                          // Add more validation checks if needed
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.visiblePassword,
                          alignment: Alignment.centerLeft,
                          prefix: Container(
                            margin: EdgeInsets.fromLTRB(10.h, 7.v, 11.h, 7.v),
                            child: CustomImageView(
                              imagePath: ImageConstant.imgLocation,
                              height: 21.v,
                              width: 10.h,
                            ),
                          ),
                          prefixConstraints: BoxConstraints(
                            maxHeight: 44.v,
                          ),
                          obscureText: true,
                        ),
                      ),
                      SizedBox(height: 30.v),
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          if (state.status == AuthStatus.authenticating) {
                            return LoadingSpinner(
                              color: appTheme.indigo800,
                              strokeWidth: 5.0,
                            );
                          }
                          return CustomElevatedButton(
                            width: 150.h,
                            text: "Login",
                            margin: EdgeInsets.only(left: 104.h),
                            onPressed: () {
                              onSubmit();
                            },
                          );
                        },
                      ),
                      SizedBox(height: 48.v),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16.h,
                          right: 46.h,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 1.v),
                              child: Text(
                                "Don’t have an account? ",
                                style: theme.textTheme.titleLarge,
                              ),
                            ),
                            Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      "Sign Up",
                                      style:
                                          CustomTextStyles.titleLargeIndigo900,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 6.v),
                                    child: SizedBox(
                                      width: 67.h,
                                      child: Divider(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 46.v),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 25.v,
                          width: 170.h,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Forgot Password?",
                                  style: CustomTextStyles.titleLargeYellowA700,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 6.v),
                                  child: SizedBox(
                                    width: 170.h,
                                    child: Divider(
                                      color: appTheme.yellowA700,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 5.v),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
