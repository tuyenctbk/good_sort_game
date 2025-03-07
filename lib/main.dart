import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'game_constants.dart';
import 'language_constants.dart';
import 'sound_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Good Sort Game',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        fontFamily: 'Comic Sans MS',
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                offset: Offset(2, 2),
                blurRadius: 3,
                color: Colors.black26,
              ),
            ],
          ),
          bodyLarge: TextStyle(
            fontSize: 24,
            color: Colors.white,
            shadows: [
              Shadow(
                offset: Offset(1, 1),
                blurRadius: 2,
                color: Colors.black26,
              ),
            ],
          ),
        ),
      ),
      home: const LanguageSelectionScreen(),
    );
  }
}

class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LanguageConstants.translations['en']!['appTitle']!,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                offset: Offset(1, 1),
                blurRadius: 2,
                color: Colors.black26,
              ),
            ],
          ),
        ),
        backgroundColor: Colors.blue.shade300,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () async {
              final selectedLanguage = await showDialog<Language>(
                context: context,
                builder: (context) => LanguageSelectionDialog(
                  currentLanguageCode: 'en',
                ),
              );
              if (selectedLanguage != null && selectedLanguage.code != 'en') {
                if (context.mounted) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          TitleScreen(language: selectedLanguage),
                    ),
                  );
                }
              }
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade300,
              Colors.purple.shade300,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(seconds: 1),
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: const Icon(
                      Icons.sort,
                      size: 100,
                      color: Colors.white,
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              Text(
                LanguageConstants.translations['en']!['selectLanguage']!,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 40),
              SizedBox(
                height: 400,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    for (int i = 0;
                        i < LanguageConstants.supportedLanguages.length;
                        i++)
                      Positioned(
                        left: 200 +
                            150 *
                                cos(2 *
                                    pi *
                                    i /
                                    LanguageConstants
                                        .supportedLanguages.length),
                        top: 200 +
                            150 *
                                sin(2 *
                                    pi *
                                    i /
                                    LanguageConstants
                                        .supportedLanguages.length),
                        child: Transform.rotate(
                          angle: 2 *
                              pi *
                              i /
                              LanguageConstants.supportedLanguages.length,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TitleScreen(
                                      language: LanguageConstants
                                          .supportedLanguages[i]),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 16),
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.blue.shade700,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text(
                              LanguageConstants.supportedLanguages[i].name,
                              style: const TextStyle(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LanguageSelectionDialog extends StatelessWidget {
  final String currentLanguageCode;

  const LanguageSelectionDialog({
    super.key,
    required this.currentLanguageCode,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        LanguageConstants.translations[currentLanguageCode]!['chooseLanguage']!,
        style: const TextStyle(color: Colors.blue),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: LanguageConstants.supportedLanguages.map((language) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, language);
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  backgroundColor: language.code == currentLanguageCode
                      ? Colors.blue.shade100
                      : Colors.white,
                  foregroundColor: Colors.blue.shade700,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  language.name,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class TitleScreen extends StatelessWidget {
  final Language language;

  const TitleScreen({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LanguageConstants.translations[language.code]!['appTitle']!,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                offset: Offset(1, 1),
                blurRadius: 2,
                color: Colors.black26,
              ),
            ],
          ),
        ),
        backgroundColor: Colors.blue.shade300,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () async {
              final selectedLanguage = await showDialog<Language>(
                context: context,
                builder: (context) => LanguageSelectionDialog(
                  currentLanguageCode: language.code,
                ),
              );
              if (selectedLanguage != null &&
                  selectedLanguage.code != language.code) {
                if (context.mounted) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          TitleScreen(language: selectedLanguage),
                    ),
                  );
                }
              }
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade300,
              Colors.purple.shade300,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.language,
                size: 80,
                color: Colors.white,
              ),
              const SizedBox(height: 20),
              Text(
                LanguageConstants.translations[language.code]!['welcome']!,
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      offset: Offset(2, 2),
                      blurRadius: 3,
                      color: Colors.black26,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                LanguageConstants.translations[language.code]!['subtitle']!,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      offset: Offset(1, 1),
                      blurRadius: 2,
                      color: Colors.black26,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameScreen(language: language),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blue.shade700,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  LanguageConstants.translations[language.code]!['startGame']!,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GameScreen extends StatefulWidget {
  final Language language;

  const GameScreen({super.key, required this.language});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen>
    with SingleTickerProviderStateMixin {
  int score = 0;
  int level = 1;
  int timeLeft = GameConstants.baseTimePerLevel;
  bool isGameOver = false;
  Timer? _timer;
  List<Item> items = [];
  List<Category> categories = [];
  List<Item> sortedItems = [];
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  int stars = 0;
  final SoundManager _soundManager = SoundManager();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _initializeLevel();
    _soundManager.playBackgroundMusic();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    _soundManager.dispose();
    super.dispose();
  }

  void _initializeLevel() {
    _timer?.cancel();
    timeLeft = GameConstants.baseTimePerLevel;
    _startTimer();

    final levelItems =
        GameConstants.getItemsForLevel(level, widget.language.code);
    categories = levelItems
        .map((item) => GameConstants.categoriesByLanguage[widget.language.code]!
            .firstWhere((cat) => cat.name == item.category))
        .toSet()
        .toList();

    items = levelItems;
    items.shuffle(Random());
    sortedItems = [];
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (timeLeft > 0) {
          timeLeft--;
        } else {
          _gameOver();
        }
      });
    });
  }

  void _gameOver() {
    _timer?.cancel();
    _soundManager.playGameOverSound();
    setState(() {
      isGameOver = true;
    });
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
          LanguageConstants.translations[widget.language.code]!['gameOver']!,
          style: const TextStyle(color: Colors.red),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.emoji_events, size: 50, color: Colors.amber),
            const SizedBox(height: 16),
            Text(
              '${LanguageConstants.translations[widget.language.code]!['finalScore']!}: $score',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            Text(
              '${LanguageConstants.translations[widget.language.code]!['levelReached']!}: $level',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Icon(
                  index < stars ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 30,
                );
              }),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                score = 0;
                level = 1;
                stars = 0;
                isGameOver = false;
                _initializeLevel();
              });
            },
            child: Text(LanguageConstants
                .translations[widget.language.code]!['playAgain']!),
          ),
        ],
      ),
    );
  }

  void _onItemDropped(Item item, String category) {
    if (item.category == category) {
      _controller.forward().then((_) => _controller.reverse());
      _soundManager.playCorrectSound();
      setState(() {
        items.remove(item);
        sortedItems.add(item);
        score += GameConstants.scorePerCorrect;
        timeLeft = min(timeLeft + GameConstants.timeBonusPerCorrect,
            GameConstants.baseTimePerLevel);
      });

      if (items.isEmpty) {
        _showLevelCompleteDialog();
      }
    } else {
      _soundManager.playWrongSound();
      setState(() {
        score = max(0, score - GameConstants.scorePenalty);
        timeLeft = max(0, timeLeft - GameConstants.timePenaltyPerWrong);
      });
    }
  }

  void _showLevelCompleteDialog() {
    _timer?.cancel();
    _soundManager.playLevelCompleteSound();
    final newStars = timeLeft > 40 ? 3 : (timeLeft > 20 ? 2 : 1);
    setState(() {
      stars = max(stars, newStars);
    });

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
          LanguageConstants
              .translations[widget.language.code]!['levelComplete']!,
          style: const TextStyle(color: Colors.green),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.star, size: 50, color: Colors.amber),
            const SizedBox(height: 16),
            Text(
              '${LanguageConstants.translations[widget.language.code]!['score']!}: $score',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 8),
            Text(
              '${LanguageConstants.translations[widget.language.code]!['timeLeft']!}: $timeLeft ${LanguageConstants.translations[widget.language.code]!['seconds']!}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Icon(
                  index < newStars ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 30,
                );
              }),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                level++;
                _initializeLevel();
              });
            },
            child: Text(LanguageConstants
                .translations[widget.language.code]!['nextLevel']!),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${LanguageConstants.translations[widget.language.code]!['level']!} $level',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                offset: Offset(1, 1),
                blurRadius: 2,
                color: Colors.black26,
              ),
            ],
          ),
        ),
        backgroundColor: Colors.blue.shade300,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () async {
              final selectedLanguage = await showDialog<Language>(
                context: context,
                builder: (context) => LanguageSelectionDialog(
                  currentLanguageCode: widget.language.code,
                ),
              );
              if (selectedLanguage != null &&
                  selectedLanguage.code != widget.language.code) {
                if (context.mounted) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          GameScreen(language: selectedLanguage),
                    ),
                  );
                }
              }
            },
          ),
          IconButton(
            icon: Icon(
              _soundManager.isMuted ? Icons.volume_off : Icons.volume_up,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                _soundManager.toggleMute();
              });
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade100,
              Colors.purple.shade100,
            ],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 32),
                        const SizedBox(width: 8),
                        Text(
                          '$score',
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      color: timeLeft < 10
                          ? Colors.red.shade300
                          : Colors.blue.shade300,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.timer, color: Colors.white, size: 32),
                        const SizedBox(width: 8),
                        Text(
                          '$timeLeft',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(24),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ScaleTransition(
                    scale: _scaleAnimation,
                    child: Draggable<Item>(
                      data: items[index],
                      feedback: Material(
                        elevation: 8,
                        child: SizedBox(
                          width: 130,
                          height: 80,
                          child: ItemWidget(item: items[index]),
                        ),
                      ),
                      childWhenDragging: Container(
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(16),
                          border:
                              Border.all(color: Colors.blue.shade300, width: 3),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                      ),
                      child: ItemWidget(item: items[index]),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 120,
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: categories.map((category) {
                  return DragTarget<Item>(
                    builder: (context, candidates, rejects) {
                      final isCorrect = candidates.isNotEmpty &&
                          candidates.first?.category == category.name;
                      final isWrong = candidates.isNotEmpty &&
                          candidates.first?.category != category.name;

                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: 130,
                        height: 80,
                        decoration: BoxDecoration(
                          color: isCorrect
                              ? Colors.green.withOpacity(0.3)
                              : isWrong
                                  ? Colors.red.withOpacity(0.3)
                                  : Colors.blue.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isCorrect
                                ? Colors.green
                                : isWrong
                                    ? Colors.red
                                    : Colors.blue,
                            width: 3,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              category.name,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: isCorrect
                                    ? Colors.green.shade700
                                    : isWrong
                                        ? Colors.red.shade700
                                        : Colors.blue.shade700,
                                shadows: [
                                  Shadow(
                                    offset: const Offset(1, 1),
                                    blurRadius: 2,
                                    color: Colors.black.withOpacity(0.1),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    },
                    onAccept: (item) => _onItemDropped(item, category.name),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blue.shade300, width: 3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            item.name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade700,
              shadows: [
                Shadow(
                  offset: const Offset(1, 1),
                  blurRadius: 2,
                  color: Colors.black26,
                ),
              ],
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
