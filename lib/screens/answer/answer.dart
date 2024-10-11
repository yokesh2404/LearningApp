// import 'package:flutter/material.dart';
// import 'package:kurups_app/config/colors.dart';
// import 'package:kurups_app/playscreen/playscreen.dart';

// class Answer extends StatefulWidget {
//   const Answer({super.key});

//   @override
//   State<Answer> createState() => _AnswerState();
// }

// class _AnswerState extends State<Answer> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size(100, 50),
//         child: SafeArea(
//           child: AppBar(
//             title: Text(
//               'Answers and Hints',
//               style: TextStyle(color: AppColors.onPrimary),
//             ),
//             backgroundColor: AppColors.primary,
//           ),
//         ),
//       ),
//       body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//         Container(
//           height: 200,
//           width: 600,
//           color: AppColors.primary,
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         Container(
//           height: 200,
//           width: 600,
//           color: AppColors.primary,
//         )
//       ]),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => VideoPlayerScreen(videoUrl: subch.videoUrl),
//             )),
//       ),
//     );
//   }
// }
