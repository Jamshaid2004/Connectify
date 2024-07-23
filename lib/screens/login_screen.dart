import 'package:connectify_project/controller/login%20signup%20controller/login_signup_bloc.dart';
import 'package:connectify_project/controller/login%20signup%20controller/login_signup_events.dart';
import 'package:connectify_project/controller/login%20signup%20controller/login_signup_states.dart';
import 'package:connectify_project/screens/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static const pageAddress = '/loginPage';
  @override
  Widget build(BuildContext context) {
    var Size(:width, :height) = MediaQuery.sizeOf(context);
    var bloc = context.read<LoginSignupBloc>();
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Center(
          child: BlocBuilder<LoginSignupBloc, LoginSignupStates>(
            builder: (BuildContext context, LoginSignupStates state) {
              if (state is LoginSignupInitialState) {
                return Form(
                  key: bloc.loginFormkey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Hero(
                        tag: bloc.titleApp,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: width * 0.1),
                          child: Text(
                            'Connectify',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.7,
                        child: TextFormField(
                          validator: bloc.emailValidator,
                          controller: bloc.emailLoginPageController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            label: Text('Email'),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      SizedBox(
                        width: width * 0.7,
                        child: TextFormField(
                          validator: bloc.passwordValidator,
                          controller: bloc.passwordLoginPageController,
                          maxLength: 15,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            label: Text('password'),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      SizedBox(
                        width: width * 0.7,
                        child: ElevatedButton(
                          onPressed: () {
                            bloc.add(LoginWithEmailButtonClickEvent(
                                context: context));
                          },
                          child: const Text('Sign in'),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.7,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: width * 0.05,
                                child: Image.asset('assets/images/google.png'),
                              ),
                              const Text(' Sign in with Google'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text("don't have account? "),
                          GestureDetector(
                            onTap: () {
                              bloc.navigateToSignupPageButtonClick(context);
                            },
                            child: const Text(
                              "Sign up",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              } else if (state is LoginSignupLoadingState) {
                return const CircularProgressIndicator(color: Colors.white);
              } else {
                return const ErrorPage();
              }
            },
          ),
        ),
      ),
    );
  }
}
