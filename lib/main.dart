import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          title: const Text("Quizzler"),
          backgroundColor: Colors.blueGrey,
          actions: <Widget>[
            PopupMenuButton<int>(
              onSelected: (item) => handleClick(item),
              itemBuilder: (context) => [
                const PopupMenuItem<int>(value: 0, child: Text('About')),
                const PopupMenuItem<int>(value: 1, child: Text('Share')),
                const PopupMenuItem<int>(value: 2, child: Text('More Apps')),
                const PopupMenuItem<int>(
                    value: 3, child: Text('Buy Me A Coffe')),
              ],
            ),
          ],
        ),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: QuizLayout(),
          ),
        )),
  ));
}

void handleClick(int item) {
  switch (item) {
    case 0:
      final Uri url =
          Uri.parse('https://github.com/Bimal022/Quizziee/tree/master');
      break;
    case 1:
      FlutterShare.share(
          title: 'Check out Quizzler - The Ultimate Quiz App!',
          text:
              'Discover Quizzler - the ultimate quiz app that will put your knowledge to the test! Challenge your friends, explore various categories, and see who reigns as the ultimate trivia champion. Download now and embark on an exciting journey of learning and fun!',
          linkUrl: 'https://github.com/Bimal022/Quizziee/tree/master',
          chooserTitle: 'Check out Quizzler - The Ultimate Quiz App!');
      break;
  }
}

class QuizLayout extends StatefulWidget {
  const QuizLayout({super.key});

  @override
  State<QuizLayout> createState() => _QuizLayoutState();
}

List<String> questionsList = [
  'How are you',
  'White is the colour of milk',
  'Sky colour is white'
      'Your name is Pappu'
];
int qnsNumber = 0;
List<Widget> crossCheck = [];

class _QuizLayoutState extends State<QuizLayout> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionsList[qnsNumber],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              color: Colors.green,
              child: TextButton(
                child: const Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    qnsNumber++;
                  });
                },
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              color: Colors.red,
              child: TextButton(
                child: const Text(
                  'False',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    qnsNumber++;
                  });
                },
              ),
            ),
          ),
        ),
        Row(
          children: crossCheck,
        )
      ],
    );
  }
}
