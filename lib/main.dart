import 'package:final_project/main.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rock Paper Scissors',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  String _result = '';
  String _playerChoice = '';
  String _botChoice = '';

  void _playGame(String playerChoice){
    setState(() {
      _playerChoice = playerChoice;
      _botChoice = _getBotChoice();
      _result = _getResult(_playerChoice, _botChoice);
    });
  }

  String _getBotChoice(){
    final choices = ['Rock', 'Paper', 'Scissors'];
    final random = Random();
    return choices[random.nextInt(3)];
  }

  String _getResult(String player, String bot){
    if (player == bot) {
      return 'It\'s a draw!';
    }
    else if ((player == 'Rock' && bot == 'Scissors') ||
        (player == 'Paper' && bot == 'Rock') ||
        (player == 'Scissors' && bot == 'Paper')){
      return 'You Win!';
    }
    else{
      return 'You Suck!';
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Rock Paper Scissors'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Choose your move:',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _choiceButton('Rock'),
                SizedBox(width: 10),
                _choiceButton('Paper'),
                SizedBox(width: 10),
                _choiceButton('Scissors'),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 40),
            Text(
              'Your choice: $_playerChoice',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Bot\'s choice: $_botChoice',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  Widget _choiceButton(String choice){
    return ElevatedButton(
      onPressed: () => _playGame(choice),
      child: Text(choice),
    );
  }

}