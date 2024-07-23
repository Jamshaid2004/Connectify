import 'package:connectify_project/controller/login%20signup%20controller/login_signup_bloc.dart';
import 'package:connectify_project/controller/login%20signup%20controller/login_signup_events.dart';
import 'package:connectify_project/controller/login%20signup%20controller/login_signup_states.dart';
import 'package:connectify_project/screens/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});
  static const pageAddress = '/signupPage';
  @override
  Widget build(BuildContext context) {
    var Size(:width, :height) = MediaQuery.sizeOf(context);
    var bloc = context.read<LoginSignupBloc>();
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Center(
          child: BlocBuilder<LoginSignupBloc, LoginSignupStates>(
            builder: (context, state) {
              if (state is LoginSignupInitialState) {
                return Form(
                  key: bloc.signupFormkey,
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
                          validator: bloc.usernameValidator,
                          controller: bloc.usernameSignupPageController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            label: Text('Username'),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      SizedBox(
                        width: width * 0.7,
                        child: TextFormField(
                          validator: bloc.emailValidator,
                          controller: bloc.emailSignupPageController,
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
                          controller: bloc.passwordSignupPageController,
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
                            bloc.add(SignupWithEmailButtonClickEvent(
                                context: context));
                          },
                          child: const Text('Create your Account'),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.7,
                        child: ElevatedButton(
                          onPressed: () {
                            bloc.signupWithGoogle(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: width * 0.05,
                                child: Image.asset('assets/images/google.png'),
                              ),
                              const Text(' Sign up with Google'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text("already have an account? "),
                          GestureDetector(
                            onTap: () {
                              bloc.navigateToLoginPageButtonClick(context);
                            },
                            child: const Text(
                              "Log in",
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
