import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:kurups_app/utils/constants/colors.dart';
import 'package:kurups_app/provider/auth/login_provider.dart';
import 'package:kurups_app/screens/register/register.dart';
import 'package:kurups_app/service/firebase_services/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:kurups_app/utils/constants/app_string.dart';
import 'package:kurups_app/utils/constants/shared_pref_keys.dart';
import 'package:kurups_app/utils/helper/function_helper.dart';
import 'package:kurups_app/utils/helper/route_helper.dart';
import 'package:kurups_app/utils/helper/shared_pref_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> with AppFunctionHelper {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuthServices _auth = FirebaseAuthServices();
  String? _email, _password; // For form validation
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false; // State variable for password visibility

  LoginProvider _loginProvider = LoginProvider();

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size(100, 50),
            child: SafeArea(
              child: AppBar(
                title: const Text(
                  'Login Page',
                  style: TextStyle(color: AppColors.onPrimary),
                ),
                backgroundColor: AppColors.primary,
              ),
            )),
        backgroundColor: AppColors.onPrimary,
        body: ListenableBuilder(
          listenable: _loginProvider,
          builder: (context, child) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Email field
                      SizedBox(
                        width: 100, // Set the width
                        height: 100, // Set the height
                        child: Image.asset(
                          'assets/images/logo 1.png', // Path to your logo image
                          fit: BoxFit
                              .cover, // Optional: control how the image should fit
                        ),
                      ),
                      const SizedBox(height: 20),

                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.isNotEmpty && !validateEmail(value)) {
                            return AppErrors.emailError;
                          }
                          return null;
                        },
                        onSaved: (value) => _email = value,
                      ),
                      const SizedBox(height: 20),

                      // Password field with eye icon to toggle visibility
                      TextFormField(
                        controller: _passwordController,
                        obscureText:
                            !_passwordVisible, // Toggle the password visibility
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible =
                                    !_passwordVisible; // Toggle state
                              });
                            },
                          ),
                          border: const OutlineInputBorder(),
                        ),
                        // obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppErrors.passwordEmpty;
                          } else if (value.isNotEmpty &&
                              !isStrongPassword(value)) {
                            return AppErrors.passwordError;
                          }
                          return null;
                        },
                        onSaved: (value) => _password = value,
                      ),
                      const SizedBox(height: 20),

                      // Login Button
                      if (!_loginProvider.isLoading) ...[
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _signIn();
                            }
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.all(AppColors.primary)),
                          child: const Text(
                            'Login',
                            style: TextStyle(color: AppColors.onPrimary),
                          ),
                        ),
                        // const SizedBox(height: 30),

                        // Sign up button
                        TextButton(
                            onPressed: () {
                              context.pushNamed(RouteHelper.registerScreenName);
                            },
                            child: RichText(
                                text: TextSpan(children: [
                              const TextSpan(
                                  text: AppString.dontHaveAcc,
                                  style: TextStyle(color: AppColors.onSurface)),
                              const WidgetSpan(
                                  child: SizedBox(
                                width: 5,
                              )),
                              TextSpan(
                                  text: AppString.register,
                                  style:
                                      const TextStyle(color: AppColors.primary),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Handle the tap on "Dart" text
                                      context.pushNamed(
                                          RouteHelper.registerScreenName);
                                    })
                            ])))
                      ] else ...[
                        const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ),
                        )
                      ],
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }

  void _signIn() async {
    // String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    _loginProvider.updateLoadingState(true);
    User? user = await _auth.signInWithEmailAndPassword(email, password);
    _loginProvider.updateLoadingState(false);
    if (user != null) {
      await SharedPrefController.instance
          .setStringData(key: SharedPrefKeys.userId, data: user.uid);
      await SharedPrefController.instance
          .setBoolData(key: SharedPrefKeys.isLoggednIn, value: true);
      context.goNamed(RouteHelper.homeScreenName);
    }
  }
}
