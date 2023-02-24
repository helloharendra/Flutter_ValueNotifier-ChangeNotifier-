import 'package:flutter/material.dart';
void main(List<String> args) {
  runApp( MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final ValueNotifier<int> _counter=ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('CounterValueNotifier'),),
        body: CounterBody(counterValueNotifier: _counter),
        floatingActionButton: FloatingActionButton(onPressed: ()=>_counter.value++, child: Icon(Icons.add),),
      ),
    );
  }
}

class CounterBody extends StatelessWidget {
  const CounterBody({super.key, required this.counterValueNotifier});
 
  final ValueNotifier<int> counterValueNotifier;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('current counter value:'),
          AnimatedBuilder(animation: counterValueNotifier, builder: (BuildContext context ,Widget? child) {
            return Text('${counterValueNotifier.value}');
          })
        ],
      ),
    );
  }
}

