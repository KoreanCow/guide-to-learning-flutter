import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: BmiMain(),
    );
  }
}

class BmiMain extends StatefulWidget {
  @override
  _BmiMainState createState() => _BmiMainState();
}

class _BmiMainState extends State<BmiMain> {
  final _formKey = GlobalKey<FormState>(); // 폼의 상태를 얻기위한 키

  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('비만도 계산기'),
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    // 외각선이 있고 힌트로 '키'를 표시
                    border: OutlineInputBorder(),
                    hintText: '키',
                  ),
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.trim().isEmpty) {
                      // 입력한 값의 앞뒤 공백을 제거한 것이 비었다면 에러 메시지 표시
                      return '키를 입력하세요';
                    }
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '몸무게',
                  ),
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.trim().isEmpty) {
                      return '몸무게를 입력하세요';
                    }
                  },
                ),
                Container(
                  // color: Colors.black,
                  margin: const EdgeInsets.only(top: 16.0),
                  alignment: Alignment.centerRight,
                  child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BmiResult(
                                      double.parse(
                                          _heightController.text.trim()),
                                      double.parse(
                                          _weightController.text.trim()),
                                    )));
                      }
                    },
                    child: Text('결과'),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class BmiResult extends StatelessWidget {
  final double height;
  final double weight;

  BmiResult(this.height, this.weight); // 생성자

  @override
  Widget build(BuildContext context) {
    final double bmi = weight / ((height / 100) * (height / 100));
    print('bmi : $bmi');

    return Scaffold(
      appBar: AppBar(title: Text('비만도 계산기')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _calcBmi(bmi),
              style: TextStyle(fontSize: 36),
            ),
            SizedBox(
              height: 16,
            ),
            _BuildIcon(bmi)
          ],
        ),
      ),
    );
  }
}

Widget _BuildIcon(double bmi) {
  if (bmi >= 23) {
    return Icon(Icons.sentiment_very_dissatisfied,
        color: Colors.red, size: 100);
  } else if (bmi >= 18.5) {
    return Icon(Icons.sentiment_very_satisfied, color: Colors.green, size: 100);
  } else {
    return Icon(Icons.sentiment_dissatisfied, color: Colors.green, size: 100);
  }
}

String _calcBmi(double bmi) {
  var result = '저체중';
  if (bmi >= 35) {
    result = '고도 비만';
  } else if (bmi >= 30) {
    result = '2단계 비만';
  } else if (bmi >= 25) {
    result = '1단계 비만';
  } else if (bmi >= 23) {
    result = '과체중';
  } else if (bmi >= 18.5) {
    result = '정상';
  }

  return result;
}
