import 'package:flutter/material.dart';
import 'package:kurups_app/service/database.dart';
import 'package:video_player/video_player.dart';

class PlayScreen extends StatefulWidget {
  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  late VideoPlayerController _controller;
  final DatabaseMethods dbMethods = DatabaseMethods();

  @override
  void initState() {
    super.initState();
    _fetchAndLoadVideo();
  }

  Future<void> _fetchAndLoadVideo() async {
    try {
      String videoUrl = await dbMethods.getVideoUrl(
          'gs://maths123-d732c.appspot.com/files/videos/1.1.mp4'); // Adjust the path
      _controller = VideoPlayerController.network(videoUrl)
        ..initialize().then((_) {
          setState(() {}); // Refresh UI once the video is initialized
        });
    } catch (e) {
      ('Error fetching video URL: $e'); // Handle errors here
    }
  }

  @override
  void dispose() {
    _controller
        .dispose(); // Dispose of the controller when the widget is removed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Video Player')),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : CircularProgressIndicator(), // Show loading indicator until video is ready
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
