//
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UOT Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 98, 192, 161)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'تطبيق الجامعة التكنولوجية'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();
  String result = "0";

  void calculate(String operation) {
    double num1 = double.tryParse(num1Controller.text) ?? 0;
    double num2 = double.tryParse(num2Controller.text) ?? 0;
    double res;

    if (operation == '+')
      res = num1 + num2;
    else if (operation == '-')
      res = num1 - num2;
    else if (operation == '*')
      res = num1 * num2;
    else if (operation == '/')
      res = num1 / num2;
    else
      res = 0;

    setState(() {
      result = res.toString();
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'الرقم الأول'),
            ),
            SizedBox(height: 2),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'الرقم الثاني'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  child: Text('+'),
                  onPressed: () => calculate('+'),
                ),
                ElevatedButton(
                  child: Text('-'),
                  onPressed: () => calculate('-'),
                ),
                ElevatedButton(
                  child: Text('*'),
                  onPressed: () => calculate('*'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('النتيجة: $result', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
