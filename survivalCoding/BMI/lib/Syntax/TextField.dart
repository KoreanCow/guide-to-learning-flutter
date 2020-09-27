import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final myController = TextEditingController();

  @override
  void initState() { 
    super.initState();
    
    // addListener로 상태를 모니터링 할 수 있음
    myController.addListener(_printLatesValue);
  }

  @override
  void dispose() { 
    // 화면이 종료될 때는 반드시 위젯 트리에서 컨트롤러를 해제해야 함

    myController.dispose();
    super.dispose();
  }

  _printLatesValue() {
    // 컨트롤러의 text 프로퍼티로 연결된 TextField에 입력된 값을 어등ㅁ
    print("두 번째 text field: ${myController.text}" );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Input 연습'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (text) {
                print('첫 번째 text field: $text');
              },
            ),
            TextField(
              controller: myController,
            )
          ],
        ),
      )
    );
  }
}