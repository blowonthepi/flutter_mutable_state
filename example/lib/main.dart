import 'package:example/tappable.dart';
import 'package:flutter/material.dart';
import 'package:mutable_state/mutable_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  final viewModel = MainViewModel();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class MainViewModel {
  var counter = mutableStateOf(0);
}

class _MyHomePageState extends State<MyHomePage> {
  late final MainViewModel viewModel = widget.viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TappableButton(
                counter: viewModel.counter,
              ),
              TappableButton(
                counter: viewModel.counter,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
