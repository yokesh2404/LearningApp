import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kurups_app/utils/constants/app_string.dart';
import 'package:kurups_app/utils/dimension/dimension.dart';
import 'package:kurups_app/utils/helper/route_helper.dart';
import 'package:kurups_app/widgets/appbar_widget.dart';
import 'package:video_player/video_player.dart';
import 'package:firebase_storage/firebase_storage.dart';

// PlayScreen for Video Playback with controls
class PlayScreen extends StatefulWidget {
  final String videoUrl;
  final Map path;

  const PlayScreen({required this.videoUrl, required this.path});

  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  VideoPlayerController? _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  // Initialize the video player
  Future<void> _initializeVideo() async {
    String downloadUrl;

    // If video URL is from Firebase Storage (gs://), get the actual download URL
    if (widget.videoUrl.startsWith('gs://')) {
      downloadUrl = await FirebaseStorage.instance
          .refFromURL(widget.videoUrl)
          .getDownloadURL();
    } else {
      downloadUrl = widget.videoUrl;
    }

    // ignore: deprecated_member_use
    _controller = VideoPlayerController.network(downloadUrl)
      ..initialize().then((_) {
        setState(() {
          _isLoading = false;
          _controller!.play();
        });
      }).catchError((error) {
        print("Error initializing video: $error");
      });

    // Listen to video player events (to update seekbar)
    _controller!.addListener(() {
      if (_controller!.value.isCompleted) {
        context.pushReplacementNamed(RouteHelper.quizzScreenName,
            extra: widget.path);
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  // Seek forward by 5 seconds
  void _seekForward() {
    final currentPosition = _controller!.value.position;
    final newPosition = currentPosition + const Duration(seconds: 5);
    _controller!.seekTo(newPosition);
  }

  // Seek backward by 5 seconds
  void _seekBackward() {
    final currentPosition = _controller!.value.position;
    final newPosition = currentPosition - const Duration(seconds: 5);
    _controller!.seekTo(newPosition);
  }

  // Format duration to MM:SS
  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWithTotalfare(
        appbarTitle: widget.path['description'],
        onBackAction: () {
          context.pop();
        },
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Display video player
                AspectRatio(
                  aspectRatio: _controller!.value.aspectRatio,
                  child: VideoPlayer(_controller!),
                ),
                const SizedBox(height: 10),

                // Seek bar
                if (_controller!.value.isInitialized)
                  Row(
                    children: [
                      // Control buttons (Play/Pause, Forward, Backward)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.replay_5),
                            onPressed: _seekBackward,
                          ),
                          IconButton(
                            icon: Icon(_controller!.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow),
                            onPressed: () {
                              setState(() {
                                _controller!.value.isPlaying
                                    ? _controller!.pause()
                                    : _controller!.play();
                              });
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.forward_5),
                            onPressed: _seekForward,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Slider(
                            value: _controller!.value.position.inSeconds
                                .toDouble(),
                            min: 0,
                            max: _controller!.value.duration.inSeconds
                                .toDouble(),
                            onChanged: (value) {
                              setState(() {
                                _controller!
                                    .seekTo(Duration(seconds: value.toInt()));
                              });
                            },
                          ),
                          // Padding(
                          //   padding:
                          //       const EdgeInsets.symmetric(horizontal: 16.0),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       Text(
                          //         _formatDuration(_controller!.value.position),st,
                          //       ),
                          //       Text(
                          //         _formatDuration(_controller!.value.duration),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text: TextSpan(
                              text: 'Lesson : ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      fontSize: Dimensions.size_18,
                                      fontWeight: FontWeight.w600),
                              children: [
                            TextSpan(text: widget.path['title'])
                          ])),
                      const SizedBox(
                        height: Dimensions.height_12,
                      ),
                      Text(AppString.videoScreenContent)
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
