import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(const PebloApp());
}

class PebloApp extends StatelessWidget {
  const PebloApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peblo AI Story Buddy',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const StoryScreen(),
    );
  }
}

class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  final FlutterTts flutterTts = FlutterTts();

  final Map<String, dynamic> storyData = {
    "story":
        "Raju found a magic seed in his garden. He planted it and a giant tree grew overnight.",
    "question": "What did Raju find in his garden?",
    "options": [
      "A Toy",
      "A Magic Seed",
      "A Book",
      "A Ball",
    ],
    "answer": "A Magic Seed"
  };

  String? selectedAnswer;
  String resultMessage = "";

  Future<void> speakStory() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setSpeechRate(0.4);
    await flutterTts.speak(storyData["story"]);
  }

  void checkAnswer() {
    if (selectedAnswer == null) return;

    setState(() {
      if (selectedAnswer == storyData["answer"]) {
        resultMessage = "🎉 Correct! Great Job!";
      } else {
        resultMessage = "❌ Oops! Try Again!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFE082),
              Color(0xFFFFCC80),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "🌟 Peblo AI Story Buddy 🌟",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 25),

                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const Text(
                          "📖 Story Time",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          storyData["story"],
                          style: const TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton.icon(
                          onPressed: speakStory,
                          icon: const Icon(Icons.volume_up),
                          label: const Text("Read Aloud"),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const Text(
                          "🎮 Quiz Time",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          storyData["question"],
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 10),

                        ...storyData["options"].map<Widget>((option) {
                          return RadioListTile<String>(
                            value: option,
                            groupValue: selectedAnswer,
                            title: Text(option),
                            onChanged: (value) {
                              setState(() {
                                selectedAnswer = value;
                              });
                            },
                          );
                        }).toList(),

                        ElevatedButton(
                          onPressed: checkAnswer,
                          child: const Text("Submit"),
                        ),

                        const SizedBox(height: 15),

                        Text(
                          resultMessage,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}