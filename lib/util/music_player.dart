import 'package:Patient_App/survey/surveymain.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:Patient_App/profile/profilemain.dart';
import 'package:Patient_App/profile/user.dart';
import 'package:Patient_App/profile/user_preferences.dart';
import 'package:Patient_App/statistics/stats_page.dart';
import 'package:intl/intl.dart';

class MusicPlayerPage extends StatefulWidget {
  const MusicPlayerPage({Key? key}) : super(key: key);

  //final String title;

  @override
  State<MusicPlayerPage> createState() => _MusicPlayerPageState();
}

class _MusicPlayerPageState extends State<MusicPlayerPage> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState(){
    super.initState();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.PLAYING;
      });
    });
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  void dispose(){
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/music_cover_pic/universe.jpg',
                width: double.infinity,
                height: 350,
                fit:BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Universe',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Ambient songs',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Slider(
                min: 0,
                activeColor: Colors.black,
                inactiveColor: Colors.black12,
                thumbColor: Colors.black38,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                onChanged: (value)async{
                  final position = Duration(seconds: value.toInt());
                  await audioPlayer.seek(position);

                  await audioPlayer.resume();
                }
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatTime(position)),
                  Text(formatTime(duration - position)),
                ],
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 35,
              child: IconButton(
                icon: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                ),
                iconSize: 50,
                onPressed: () async {
                  if(isPlaying){
                    await audioPlayer.pause();
                  } else {
                    final player = AudioCache(prefix: 'assets/music/');
                    final url = await player.load('Universe.mp3');
                    await audioPlayer.play(url.path,isLocal: true);
                  }
                },
              ),
            )
          ],
        ),
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2,'0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours>0)hours,
      minutes,
      seconds,
    ].join(':');
  }
}

