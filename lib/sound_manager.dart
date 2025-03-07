import 'package:audioplayers/audioplayers.dart';

class SoundManager {
  static final SoundManager _instance = SoundManager._internal();
  factory SoundManager() => _instance;
  SoundManager._internal();

  final AudioPlayer _backgroundMusic = AudioPlayer();
  final AudioPlayer _effectPlayer = AudioPlayer();
  bool _isMuted = false;

  Future<void> playBackgroundMusic() async {
    if (_isMuted) return;
    try {
      await _backgroundMusic.setReleaseMode(ReleaseMode.loop);
      await _backgroundMusic.play(AssetSource('sounds/background_music.mp3'));
    } catch (e) {
      print('Error playing background music: $e');
    }
  }

  Future<void> playCorrectSound() async {
    if (_isMuted) return;
    try {
      await _effectPlayer.play(AssetSource('sounds/correct.mp3'));
    } catch (e) {
      print('Error playing correct sound: $e');
    }
  }

  Future<void> playWrongSound() async {
    if (_isMuted) return;
    try {
      await _effectPlayer.play(AssetSource('sounds/wrong.mp3'));
    } catch (e) {
      print('Error playing wrong sound: $e');
    }
  }

  Future<void> playLevelCompleteSound() async {
    if (_isMuted) return;
    try {
      await _effectPlayer.play(AssetSource('sounds/level_complete.mp3'));
    } catch (e) {
      print('Error playing level complete sound: $e');
    }
  }

  Future<void> playGameOverSound() async {
    if (_isMuted) return;
    try {
      await _effectPlayer.play(AssetSource('sounds/game_over.mp3'));
    } catch (e) {
      print('Error playing game over sound: $e');
    }
  }

  void toggleMute() {
    _isMuted = !_isMuted;
    if (_isMuted) {
      _backgroundMusic.pause();
    } else {
      _backgroundMusic.resume();
    }
  }

  bool get isMuted => _isMuted;

  Future<void> dispose() async {
    await _backgroundMusic.dispose();
    await _effectPlayer.dispose();
  }
}
