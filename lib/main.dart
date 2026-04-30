import 'package:flutter/material.dart';
import 'package:quizapp/quizbrain.dart';


void main() => runApp(Quiz());
Quizbrain quizbrain=Quizbrain();


class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('پرسش وپاسخ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25
                ),

              ),
            ],
          )
        ),
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
            child:Padding(
              padding: const EdgeInsets.all(10),
              child: QuizApp(),
            )
        ),
      ),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  void checkAnswer(bool userAnswer){
    int count=quizbrain.score();
    bool correctanswer=quizbrain.getCorrectAswer();
    bool finish=quizbrain.isFinished();
    setState(() {

      if(finish==true){
        showDialog(
            context: context,
            builder:(context){
              return AlertDialog(
                title: Center(child: Text('نتیجه نهایی')),
                content: Center(child: Text('نمره شما: $count',
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
                ),
                actions: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                      onPressed: (){
                      setState(() {
                        Navigator.pop(context);
                        quizbrain.resetscore();
                        quizbrain.reset();
                        scorekeeper.clear();
                      });
                      },
                      child: Text('شروع دوباره',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                  ),
                ],
              );
            }
        );
      }
      else{

        if(correctanswer==userAnswer){
          scorekeeper.add(Icon(Icons.check,color: Colors.green,),);
          quizbrain.countscore();
        }
        else{
          scorekeeper.add(Icon(Icons.close,color: Colors.red,),);
        }
        quizbrain.nextQuestion();
      }
    });
  }
  List <Icon> scorekeeper=[];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text(quizbrain.getQuestionText(),
                textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25
                  ),
                ),
              ),
            ),
        ),
        Expanded(
            child:Padding(
              padding: const EdgeInsets.all(15),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,

                ),
                  onPressed: (){
                  checkAnswer(true);
                  },
                  child: Text('صحیح',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25
                    ),
                  )
              ),
            )
        ),
        Expanded(
            child:Padding(
              padding: const EdgeInsets.all(15),
              child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: (){
                   checkAnswer(false);
                  },
                  child: Text('غلط',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25
                    ),
                  )
              ),
            )
        ),
        //TODO: create a row to display usr answer(scorekeeper)
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: scorekeeper
        )
      ],
    );
  }
}


