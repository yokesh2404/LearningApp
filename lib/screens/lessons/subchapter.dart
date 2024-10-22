import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kurups_app/injector/injector.dart';
import 'package:kurups_app/screens/lessons/bloc/lessons_bloc.dart';
import 'package:kurups_app/screens/playscreen/playscreen.dart';
import 'package:kurups_app/utils/constants/app_string.dart';
import 'package:kurups_app/utils/constants/colors.dart';
import 'package:kurups_app/utils/dimension/dimension.dart';
import 'package:kurups_app/widgets/appbar_widget.dart';

// import 'package:video_player/video_player.dart';
// void main() => runApp(VideoApp());

// class Chapter {
//   final String title;
//   final List<SubChapter> subChapters;

//   Chapter({required this.title, required this.subChapters});
// }

// class SubChapter {
//   final String title;
//   final String videoUrl;

//   SubChapter({required this.title, required this.videoUrl});
// }

// List<Chapter> chapters = [
//   Chapter(
//     title: 'Chapter 1',
//     subChapters: [
//       SubChapter(
//         title: 'SubChapter 1.1',
//         videoUrl: 'gs://maths123-d732c.appspot.com/files/videos/1.1.mp4',
//       ),
//       SubChapter(
//         title: 'SubChapter 1.2',
//         videoUrl:
//             'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
//       ),
//     ],
//   ),
//   Chapter(
//     title: 'Chapter 2',
//     subChapters: [
//       SubChapter(
//         title: 'SubChapter 2.1',
//         videoUrl:
//             'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
//       ),
//       SubChapter(
//         title: 'SubChapter 2.2',
//         videoUrl:
//             'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
//       ),
//     ],
//   ),
//   Chapter(
//     title: 'Chapter 3',
//     subChapters: [
//       SubChapter(
//         title: 'SubChapter 3.1',
//         videoUrl:
//             'https://youtu.be/ap9PStDGd88?si=vpiG9t8_5asKH1NO/video/Digits.mp4',
//       ),
//       SubChapter(
//         title: 'SubChapter 3.2',
//         videoUrl:
//             'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
//       ),
//     ],
//   ),
//   Chapter(
//     title: 'Chapter 4',
//     subChapters: [
//       SubChapter(
//         title: 'SubChapter 4.1',
//         videoUrl:
//             'https://youtu.be/ap9PStDGd88?si=vpiG9t8_5asKH1NO/video/Digits.mp4',
//       ),
//       SubChapter(
//         title: 'SubChapter 4.2',
//         videoUrl:
//             'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
//       ),
//     ],
//   ),
//   Chapter(
//     title: 'Chapter 5',
//     subChapters: [
//       SubChapter(
//         title: 'SubChapter 5.1',
//         videoUrl:
//             'https://youtu.be/ap9PStDGd88?si=vpiG9t8_5asKH1NO/video/Digits.mp4',
//       ),
//       SubChapter(
//         title: 'SubChapter 5.2',
//         videoUrl:
//             'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
//       ),
//     ],
//   ),
//   Chapter(
//     title: 'Chapter 6',
//     subChapters: [
//       SubChapter(
//         title: 'SubChapter 6.1',
//         videoUrl:
//             'https://youtu.be/ap9PStDGd88?si=vpiG9t8_5asKH1NO/video/Digits.mp4',
//       ),
//       SubChapter(
//         title: 'SubChapter 6.2',
//         videoUrl:
//             'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
//       ),
//     ],
//   ),
//   Chapter(
//     title: 'Chapter 7',
//     subChapters: [
//       SubChapter(
//         title: 'SubChapter 7.1',
//         videoUrl:
//             'https://youtu.be/ap9PStDGd88?si=vpiG9t8_5asKH1NO/video/Digits.mp4',
//       ),
//       SubChapter(
//         title: 'SubChapter 7.2',
//         videoUrl:
//             'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
//       ),
//     ],
//   ),
//   Chapter(
//     title: 'Chapter 8',
//     subChapters: [
//       SubChapter(
//         title: 'SubChapter 8.1',
//         videoUrl:
//             'https://youtu.be/ap9PStDGd88?si=vpiG9t8_5asKH1NO/video/Digits.mp4',
//       ),
//       SubChapter(
//         title: 'SubChapter 8.2',
//         videoUrl:
//             'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
//       ),
//     ],
//   ),
//   Chapter(
//     title: 'Chapter 9',
//     subChapters: [
//       SubChapter(
//         title: 'SubChapter 9.1',
//         videoUrl:
//             'https://youtu.be/ap9PStDGd88?si=vpiG9t8_5asKH1NO/video/Digits.mp4',
//       ),
//       SubChapter(
//         title: 'SubChapter 9.2',
//         videoUrl:
//             'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
//       ),
//     ],
//   ),
//   Chapter(
//     title: 'Chapter 10',
//     subChapters: [
//       SubChapter(
//         title: 'SubChapter 10.1',
//         videoUrl:
//             'https://youtu.be/ap9PStDGd88?si=vpiG9t8_5asKH1NO/video/Digits.mp4',
//       ),
//       SubChapter(
//         title: 'SubChapter 10.2',
//         videoUrl:
//             'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
//       ),
//     ],
//   ),
// ];

// // class VideoApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Chapters with Videos',
// //       home: ChaptersScreen(),
// //     );
// //   }
// // }

// // ignore: use_key_in_widget_constructors
class LessonsScreen extends StatelessWidget {
  final Map path;

  const LessonsScreen({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => Injector.instance<LessonsBloc>()
          ..add(GetLessons(databasePath: path)),
        child: Scaffold(
          appBar: AppbarWithTotalfare(
              onBackAction: () {
                context.pop();
              },
              appbarTitle: AppString.lessons),
          body: BlocConsumer<LessonsBloc, LessonsState>(
            builder: (context, state) {
              return state.status.when(initial: () {
                return const SizedBox();
              }, loading: () {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                );
              }, loadFailed: () {
                return const Center(
                  child: Text("No data found"),
                );
              }, loadSuccess: () {
                return SingleChildScrollView(
                  child: ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(Dimensions.size_12),
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var data = state.lessonsResponse!.data![index];
                        return InkWell(
                          onTap: () {
                            Injector.instance<LessonsBloc>().add(ClickLessons(
                                databasePath: path,
                                data: data,
                                context: context));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: const LinearGradient(
                                colors: [AppColors.primary, Colors.greenAccent],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: ListTile(
                              title: Text(
                                "${data.title}",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                              leading: const Icon(Icons.book_rounded,
                                  color: Colors.white),
                              trailing: const Icon(Icons.play_circle_sharp,
                                  color: AppColors.warning),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: Dimensions.size_12,
                        );
                      },
                      itemCount: state.lessonsResponse!.data!.length),
                );
              });
            },
            listener: (context, state) {},
          ),
          // body: ListView.builder(
          //   itemCount: chapters.length,
          //   itemBuilder: (context, chapterIndex) {
          //     return ExpansionTile(
          //       backgroundColor: Colors.grey[200],
          //       textColor: const Color.fromARGB(255, 157, 14, 14),
          //       tilePadding: EdgeInsets.all(10.0),
          //       title: Text(chapters[chapterIndex].title),
          //       leading: Icon(Icons.diamond_rounded,
          //           color: const Color.fromARGB(255, 240, 173, 1), size: 30),
          //       children: chapters[chapterIndex].subChapters.map((subChapter) {
          //         return ListTile(
          //           tileColor: Colors.grey[200],
          //           textColor: const Color.fromARGB(255, 157, 14, 14),
          //           title: Text(subChapter.title),
          //           leading: Icon(Icons.diamond_sharp,
          //               color: const Color.fromARGB(255, 243, 93, 33), size: 30),
          //           onTap: () {
          //             // Navigate to the VideoPlayerScreen with the video URL
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                 builder: (context) => PlayScreen(),
          //               ),
          //             );
          //           },
          //         );
          //       }).toList(),
          //     );
          //   },
          // ),
        ));
  }
}
