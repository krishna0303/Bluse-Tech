import 'package:bluse/Widgets/videoPlayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:video_player/video_player.dart';

class InstructionScreen extends StatelessWidget {
  static String videoID = 'dFKhWe2bBkM';

  // YouTube Video Full URL : https://www.youtube.com/watch?v=dFKhWe2bBkM&feature=emb_title&ab_channel=BBKiVines

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: videoID,
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              // colors: [Colors.pink, Colors.lightGreenAccent],
              colors: [Colors.black, Colors.black],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Follow Instructions",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.arrow_drop_down_circle,
              color: Colors.white,
            ),
            onPressed: () {
              SystemNavigator.pop();
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Follow these instructions video carefully. It has complete guide to use this app.All the functionality of the app has been gievn in this video so you can proceed smoothly to this app. I hope this video will help you a lot !',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Divider(
            color: Colors.black,
          ),
          Container(
            child: YoutubePlayer(
              controller: _controller,
              liveUIColor: Colors.amber,
              showVideoProgressIndicator: true,
            ),
          ),

          // VideoItems(
          //   videoPlayerController: VideoPlayerController.asset(
          //     'assets/video1.mp4',
          //   ),
          //   looping: true,
          //   autoplay: false,
          // ),
          // SizedBox(
          //   height: 5,
          // ),
          // Divider(
          //   color: Colors.black,
          // ),
          // VideoItems(
          //   videoPlayerController: VideoPlayerController.network(
          //       'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4'),
          //   looping: false,
          //   autoplay: true,
          // ),
          // VideoItems(
          //   videoPlayerController: VideoPlayerController.asset(
          //     'assets/video_3.mp4',
          //   ),
          //   looping: false,
          //   autoplay: false,
          // ),
          // VideoItems(
          //   videoPlayerController: VideoPlayerController.asset(
          //     'assets/video_2.mp4',
          //   ),
          //   autoplay: true,
          // ),
          // VideoItems(
          //   videoPlayerController: VideoPlayerController.network(
          //       "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4"),
          //   looping: true,
          //   autoplay: false,
          // ),
        ],
      ),
    );
  }
}
