import 'package:quizapp/questions.dart';

class Quizbrain {
  int _counter=0;
  int _QuestionNumber=0;
  List<Questions> _questionAnswer=[
    Questions(q: "پایتخت افغانستان کابل است", a: true),
    Questions(q:    "کاپیسا یکی از ولایات افغانستان نیست", a: false),
    Questions(q: "مرکز کاپیسا محمودراقی نام دارد", a: true),
    Questions(q: "افغانستان دارای 34 ولایت است",a: true),
    Questions(q: "پیامبر اسلام محمد نام دارد", a: true),
    Questions(q: "کاپیسا 8 ولسوالی دارد", a: false)
  ];


  void nextQuestion(){
    if (_QuestionNumber< _questionAnswer.length-1){
      _QuestionNumber++;
    }

  }



  void countscore(){
    _counter+=1;
  }
  int score(){
    return _counter;
  }

  void resetscore(){
    _counter=0;
  }

  String getQuestionText(){
   return _questionAnswer[_QuestionNumber].questionText;
  }

  bool getCorrectAswer(){
    return _questionAnswer[_QuestionNumber].answer;
  }



  bool isFinished(){
    if(_QuestionNumber==_questionAnswer.length-1){
      return true;
    }
    else{
      return false;
    }
  }
  void reset(){
    _QuestionNumber=0;
  }

}