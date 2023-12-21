//@dart=2.9
import 'question.dart';

class Quiz {
  //_k &_questions -> encapsulation (to no change it )
  int _k = 0;
  Quiz();
  // class Questions in question.dart.
  final List<Questions> _questions = [
    Questions(
        question: 'You can lead a cow down stairs but not up stairs.',
        answer: false),
    Questions(
        question: 'Approximately one quarter of human bones are in the feet.',
        answer: true),
    Questions(question: 'A slug\'s blood is green.', answer: true),
    Questions(
        question: 'You can lead a cow down stairs but not up stairs.',
        answer: false),
    Questions(
        question: 'Approximately one quarter of human bones are in the feet.',
        answer: true),
    Questions(question: 'A slug\'s blood is green.', answer: true),
    Questions(
        question: 'You can lead a cow down stairs but not up stairs.',
        answer: false),
    Questions(question: 'quiz finished ', answer: true),
  ];
  // to get next question.
  void nextQuestion() {
    //-1 -> no add k++ after last question .
    if (_k < _questions.length - 1) {
      _k++;
    }
  }

  //to return question .
  String getQuestion() {
    return _questions[_k].question;
  }

  //to return answer .
  bool getAnswer() {
    return _questions[_k].answer;
  }

  // to knowe when quiz finish.
  //get questions => null;
  bool finish() {
    // ignore: avoid_print
    print('k=$_k');
    if (_k == _questions.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  //to reset quiz .
  void reset() {
    _k = 0;
  }
}
