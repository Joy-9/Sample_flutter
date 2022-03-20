import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';


class AudioPlayersdemo extends StatefulWidget {
  const AudioPlayersdemo({Key? key}) : super(key: key);

  @override
  State<AudioPlayersdemo> createState() => _AudioPlayersdemoState();
}

class _AudioPlayersdemoState extends State<AudioPlayersdemo> {
  AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
  late VideoPlayerController _controller;

  play() async {
    int result = await audioPlayer.play(
        "https://luan.xyz/files/audio/ambient_c_motion.mp3",
        volume: 10.0);
    if (result == 1) {
      audioPlayer.setVolume(20.2);
      print("play success");
    } else {
      print("play failed");
    }
  }

  //如果是本地文件，则需要设置isLocal参数
  // playLocal() async {
  //   int result = await audioPlayer.play(localPath, isLocal: true);
  // }
  //pause用来暂停播放，但会保留播放位置。随后调用play将继续从暂停的位置开始播放。
  pause() async {
    int result = await audioPlayer.pause();
    if (result == 1) {
      print("pause success");
    } else {
      print("pause failed");
    }
  }

  //stop方法将停止音频的播放，且将播放位置重置。随后再调用play时将从开始位置播放
  stop() async {
    int result = await audioPlayer.stop();
    if (result == 1) {
      print("stop success");
    } else {
      print("stop failed");
    }
  }

  //使用seek方法用来对音频进行跳转
  seek() async {
    int result = await audioPlayer.seek(Duration(milliseconds: 1200));
    if (result == 1) {
      print("stop success");
    } else {
      print("stop failed");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.network(
        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4");
      // ..initialize().then((value) => null);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("音频和视频"),
      ),
      body: Column(children: <Widget>[
        ElevatedButton(onPressed: play, child: Text("播放")),
        ElevatedButton(onPressed: pause, child: Text("暂停")),
        ElevatedButton(onPressed: stop, child: Text("重置")),
        ElevatedButton(onPressed: seek, child: Text("跳转")),
        ElevatedButton(
            onPressed: () {
              launch(
                  "https://dengxiaolong.com/article/2019/07/how-to-play-audioplaxyers-in-flutter.html");
            },
            child: Text("参考1")),
        ElevatedButton(
            onPressed: () {
              launch("https://pub.dev/packages/audioplayers");
            },
            child: Text("参考2")),
        Container(
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(),
          height: 200,
          width: 200,
        )
      ]),
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
