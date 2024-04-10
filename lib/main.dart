import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wu Kong',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    init();
  }

  void init() async {
    _controller = VideoPlayerController.asset("assets/video.mp4");
    await _controller.initialize();
    await _controller.setLooping(true);
    await _controller.play();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          FittedBox(
            fit: BoxFit.cover,
            child: Container(
              color: Colors.black,
              width: 200,
              height: 200,
              child: VideoPlayer(_controller),
            ),
          ),
          Center(
            child: TimerCountdown(
              spacerWidth: 60,
              daysDescription: "天",
              minutesDescription: "分",
              hoursDescription: "时",
              secondsDescription: "秒",
              timeTextStyle:
                  const TextStyle(color: Colors.white, fontSize: 160,fontFamily: "ITCAvantGardeStd"),
              colonsTextStyle:
                  const TextStyle(color: Colors.white, fontSize: 160,fontFamily: "ITCAvantGardeStd"),
              descriptionTextStyle:
                  const TextStyle(color: Colors.white, fontSize: 80),
              format: CountDownTimerFormat.daysHoursMinutesSeconds,
              endTime: DateTime(2024, 8, 20),
              onEnd: () {},
            ),
          ),
        ],
      ),
    );
  }
}
