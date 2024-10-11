import 'package:flutter/material.dart';
import 'package:kurups_app/screens/chapters/subchapter.dart';
import 'package:kurups_app/utils/constants/colors.dart';
// import 'package:kurups_app/playscreen/playscreen.dart';
//import 'package:kurups_app/chapters/subchapters.dart';

// ignore: use_key_in_widget_constructors
class BasicPage extends StatelessWidget {
  final List<String> chapters = [
    'Chapter 1: Introduction',
    'Chapter 2: Basics',
    'Chapter 3: Intermediate',
    'Chapter 4: Advanced',
    'Chapter 5: Conclusion',
    'Chapter 6: Introduction',
    'Chapter 7: Basics',
    'Chapter 8: Intermediate',
    'Chapter 9: Advanced',
    'Chapter 10: Conclusion',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Chapters'),
        backgroundColor: AppColors.primary,
        leadingWidth: 80.0,
      ),
      body: ListView.builder(
        itemCount: chapters.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to the SubPage for the clicked chapter
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChaptersScreen(),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.greenAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: ListTile(
                title: Text(
                  chapters[index],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                leading: Icon(Icons.diamond_rounded, color: Colors.white),
                trailing: Icon(Icons.arrow_forward, color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
