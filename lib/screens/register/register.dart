//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:kurups_app/injector/injector.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:kurups_app/utils/constants/colors.dart';
import 'package:kurups_app/entity/request/user_details/user_details.dart';
import 'package:kurups_app/screens/login/login.dart';
import 'package:kurups_app/provider/auth/register_provider.dart';
//import 'package:kurups_app/login/login.dart';
//import 'package:kurups_app/service/database.dart';
//import 'package:kurups_app/login/login.dart';
//import 'package:kurups_app/service/database.dart';
import 'package:kurups_app/service/firebase_services/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:kurups_app/service/firebase_services/firebase_database/firebase_database_service.dart';
import 'package:kurups_app/utils/constants/app_string.dart';
import 'package:kurups_app/utils/helper/function_helper.dart';
import 'package:kurups_app/utils/helper/route_helper.dart';
//import 'package:random_string/random_string.dart';
//import 'package:random_string/random_string.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with AppFunctionHelper {
  final FirebaseAuthServices _auth = FirebaseAuthServices();
  final _formKey = GlobalKey<FormState>();
  //String? _email, _password, _name;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  RegisterProvider registerProvider = RegisterProvider();

  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _registerUser() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      //     // Save data to Firestore
      //     await FirebaseFirestore.instance.collection('users').doc(_email).set({
      //       'email': _email,
      //       'password': _password,
      //       'name': _name,
      //     });

      //     // Navigate to login or another page
      //     // Navigator.pushNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(100, 50),
        child: SafeArea(
          child: AppBar(
            title: const Text(
              'Register Page',
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            ),
            backgroundColor: AppColors.primary,
            // leadingWidth: 80.0,
          ),
        ),
      ),
      body: ListenableBuilder(
        listenable: registerProvider,
        builder: (context, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset(
                        'assets/images/logo 1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                        controller: _nameController,
                        keyboardType: TextInputType.name,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          prefixIcon: Icon(Icons.people),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        }),
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
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      // onSaved: (value) => _name = value,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: !_passwordVisible,
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
                              _passwordVisible = !_passwordVisible;
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
                      //onSaved: (value) => _password = value,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: !_confirmPasswordVisible,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _confirmPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _confirmPasswordVisible =
                                  !_confirmPasswordVisible;
                            });
                          },
                        ),
                        border: const OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    if (!registerProvider.isLoading) ...[
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState?.validate() ?? false) {
                            _signUp();
                            // String id = randomAlphaNumeric(15);
                            // Map<String, dynamic> usersInfoMap = {
                            //   "name": _nameController.text,
                            //   "email": _emailController.text,
                            //   "password": _passwordController.text,
                            //   "confirm password": _confirmPasswordController.text
                            // };
                            // await DatabaseMethods()
                            //     .addUsersDetails(usersInfoMap, id)
                            //     .then((onValue) {
                            //   Fluttertoast.showToast(
                            //       msg: "The user's details were updated",
                            //       toastLength: Toast.LENGTH_LONG,
                            //       gravity: ToastGravity.CENTER,
                            //       timeInSecForIosWeb: 1,
                            //       backgroundColor: AppColors.onSecondary,
                            //       textColor: AppColors.primary,
                            //       fontSize: 16.0);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => const LoginScreen()));
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //     const SnackBar(content: Text('Registering...')),
                            //   );
                            // });
                          }
                        },
                        style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(AppColors.primary)),
                        child: const Text(
                          'Register',
                          style: TextStyle(color: AppColors.onPrimary),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            context.pop();
                          },
                          // style: ButtonStyle(
                          //   backgroundColor: WidgetStateProperty.all(AppColors.primary),
                          // ),
                          child: RichText(
                              text: TextSpan(children: [
                            const TextSpan(
                                text: AppString.alreadyRegistered,
                                style: TextStyle(color: AppColors.onSurface)),
                            const WidgetSpan(
                                child: SizedBox(
                              width: 5,
                            )),
                            TextSpan(
                                text: AppString.login,
                                style:
                                    const TextStyle(color: AppColors.primary),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Handle the tap on "Dart" text
                                    context.pop();
                                  })
                          ])))
                    ] else ...[
                      const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      )
                    ]
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _signUp() async {
    // String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    registerProvider.updateLoadingState(true);
    User? user = await _auth.signUpWithEmailAndPassword(email, password);
    registerProvider.updateLoadingState(false);
    if (user != null) {
      UserDetails _userDetails = UserDetails();
      _userDetails = _userDetails.copyWith(
          name: _nameController.text,
          email: _emailController.text,
          phone: "",
          profile: "",
          classType: "",
          about: "",
          userId: user.uid,
          dob: "",
          status: "created");
      registerProvider.updateLoadingState(true);

      await Injector.instance<FirebaseDatabaseService>()
          .storeUserData(userData: user, request: _userDetails.toJson())
          .then((_) {
        registerProvider.updateLoadingState(false);
        context.pop();
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text(AppString.registerSuccess)));
      });
    }
  }
}
