import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:lottie/lottie.dart';

class BouncingColumn extends StatefulWidget {
  @override
  _BouncingColumnState createState() => _BouncingColumnState();
}

class _BouncingColumnState extends State<BouncingColumn> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);

    
    _playAudio();
  }

  Future<void> _playAudio() async {
    // Play the audio file
    await _audioPlayer.play(AssetSource('audio.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(' ', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
       
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, _animation.value * 5),
                  child: Image.asset('assets/robot.png', height: 200),
                );
              },
            ),
              Lottie.asset('assets/Animation.json', height: 100), 
            SizedBox(height: 20),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Chat', style: TextStyle(color: Colors.green)), 
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }
}
