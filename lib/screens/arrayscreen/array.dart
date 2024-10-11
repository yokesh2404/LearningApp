// import 'package:flutter/material.dart';
// import 'package:kurups_app/home/home.dart';
// import 'package:kurups_app/login/login.dart';
// import 'package:kurups_app/quiz/quiz.dart';
// import 'package:kurups_app/register/register.dart';
// import 'package:kurups_app/splash/splash.dart';

// class Array extends StatefulWidget {
//   const Array({super.key});

//   @override
//   _ArrayState createState() => _ArrayState();
// }

// class _ArrayState extends State<Array> {
//   // List of screens
//   final List<Widget> screens = [
//     const SplashScreen(),
//     LoginScreen(),
//     RegisterPage(),
//     LoginScreen(),
//     HomePage(),
//     QuizScreen(),
//   ];

//   // Function to navigate to a screen by index
//   void navigateToScreen(int index) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => screens[index]),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Home Screen')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () => navigateToScreen(0), // Navigate to Screen One
//               child: const Text('Go to Screen One'),
//             ),
//             ElevatedButton(
//               onPressed: () => navigateToScreen(1), // Navigate to Screen Two
//               child: const Text('Go to Screen Two'),
//             ),
//             ElevatedButton(
//               onPressed: () => navigateToScreen(2), // Navigate to Screen Three
//               child: const Text('Go to Screen Three'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
