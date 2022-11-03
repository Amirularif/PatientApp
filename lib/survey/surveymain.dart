import 'package:Patient_App/survey/SurveyCompletePage.dart';
import 'package:flutter/material.dart';
import 'package:Patient_App/survey/quiz.dart';
import 'package:Patient_App/survey/result.dart';

class SurveyMainPage extends StatefulWidget {
  const SurveyMainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SurveyMainPageState();
  }
}

class _SurveyMainPageState extends State<SurveyMainPage> {
  final _questions = const [
    {
      'questionText': 'Question 1 : Feeling nervous, anxious, or on edge?',
      'answers': [
        {'text': 'Not at all', 'score': 0},
        {'text': 'Several days', 'score': 1},
        {'text': 'More than half the days', 'score': 2},
        {'text': 'Nearly every day', 'score': 3},
      ],
    },
    {
      'questionText': 'Question 2 : Not being able to stop or control worrying?',
      'answers': [
        {'text': 'Not at all', 'score': 0},
        {'text': 'Several days', 'score': 1},
        {'text': 'More than half the days', 'score': 2},
        {'text': 'Nearly every day', 'score': 3},
      ],
    },
    {
      'questionText': 'Question 3 : Worrying too much about different things?',
      'answers': [
        {'text': 'Not at all', 'score': 0},
        {'text': 'Several days', 'score': 1},
        {'text': 'More than half the days', 'score': 2},
        {'text': 'Nearly every day', 'score': 3},
      ],
    },
    {
      'questionText': 'Question 4 : Trouble relaxing?',
      'answers': [
        {'text': 'Not at all', 'score': 0},
        {'text': 'Several days', 'score': 1},
        {'text': 'More than half the days', 'score': 2},
        {'text': 'Nearly every day', 'score': 3},
      ],
    },
    {
      'questionText': 'Question 5 : Being so restless that it is hard to sit still?',
      'answers': [
        {'text': 'Not at all', 'score': 0},
        {'text': 'Several days', 'score': 1},
        {'text': 'More than half the days', 'score': 2},
        {'text': 'Nearly every day', 'score': 3},
      ],
    },
    {
      'questionText': 'Question 6 : Becoming easily annoyed or irritable?',
      'answers': [
        {'text': 'Not at all', 'score': 0},
        {'text': 'Several days', 'score': 1},
        {'text': 'More than half the days', 'score': 2},
        {'text': 'Nearly every day', 'score': 3},
      ],
    },
    {
      'questionText': 'Question 7 : Feeling afraid as if something awful might happen?',
      'answers': [
        {'text': 'Not at all', 'score': 0},
        {'text': 'Several days', 'score': 1},
        {'text': 'More than half the days', 'score': 2},
        {'text': 'Nearly every day', 'score': 3},
      ],
    },
    {
      'questionText': 'Question 8 : 뚜릇한 이유 없이 여기저기 자주 아프다?',
      'answers': [
        {'text': '전혀 아니다', 'score': 0},
        {'text': '조금 그렇다', 'score': 1},
        {'text': '그렇다', 'score': 2},
        {'text': '매우 그렇다', 'score': 3},
      ],
    },
    {
      'questionText': 'Question 9 : 이유 없이 감정기복이 심하다?',
      'answers': [
        {'text': '전혀 아니다', 'score': 0},
        {'text': '조금 그렇다', 'score': 1},
        {'text': '그렇다', 'score': 2},
        {'text': '매우 그렇다', 'score': 3},
      ],
    },
    {
      'questionText': 'Question 10 : 모든 것이 귀찮고 재미가 없다?',
      'answers': [
        {'text': '전혀 아니다', 'score': 0},
        {'text': '조금 그렇다', 'score': 1},
        {'text': '그렇다', 'score': 2},
        {'text': '매우 그렇다', 'score': 3},
      ],
    },
    {
      'questionText': 'Question 11 : 괜한 걱정을 미리 한다?',
      'answers': [
        {'text': '전혀 아니다', 'score': 0},
        {'text': '조금 그렇다', 'score': 1},
        {'text': '그렇다', 'score': 2},
        {'text': '매우 그렇다', 'score': 3},
      ],
    },
    {
      'questionText': 'Question 12 : 어른들이 이래라 저래라 하면 짜증이 난다?',
      'answers': [
        {'text': '전혀 아니다', 'score': 0},
        {'text': '조금 그렇다', 'score': 1},
        {'text': '그렇다', 'score': 2},
        {'text': '매우 그렇다', 'score': 3},
      ],
    },
    {
      'questionText': 'Question 13 : 죽고 싶다는 생각이 든다?',
      'answers': [
        {'text': '전혀 아니다', 'score': 0},
        {'text': '조금 그렇다', 'score': 1},
        {'text': '그렇다', 'score': 2},
        {'text': '매우 그렇다', 'score': 3},
      ],
    },
    {
      'questionText': 'Question 14 : 이유 없이 우울하거나 짜증이 난다?',
      'answers': [
        {'text': '전혀 아니다', 'score': 0},
        {'text': '조금 그렇다', 'score': 1},
        {'text': '그렇다', 'score': 2},
        {'text': '매우 그렇다', 'score': 3},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('There are more questions left unanswered!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // make sure no overflow when keyboard appears
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SizedBox(
              height: 20,
            ),
            Text(
              '설문',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
              SizedBox(
                height: 20,
              ),
              _questionIndex < _questions.length
                  ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              ) //Quiz
                  //: Result(_totalScore, _resetQuiz),
              :SurveyCompletePage(),
            ],
          ),
      ),
    );
  }
}
