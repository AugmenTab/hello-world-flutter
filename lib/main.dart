import 'package:flutter/material.dart';

import 'viewmodel/MainViewModel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Counter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Flutter Counter Demo'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool _running = false;
  MainViewModel _viewModel = MainViewModel();

  void _toggleRunning() {
    setState(() {
      _running = !_running;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          if (!_running) IconButton(
            icon: Icon(
              Icons.replay,
              color: Colors.white,
            ),
            onPressed: null,
          ),
          IconButton(
            icon: _running ? Icon(Icons.pause) : Icon(Icons.play_arrow),
            onPressed: _toggleRunning,
          ),
          IconButton(
            icon: Icon(
              Icons.skip_next,
              color: Colors.white,
            ),
            onPressed: _viewModel.iterate,
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<int>(
              stream: _viewModel.iterationCountStream,
              builder: (context, snapshot) {
                return Text(
                  'Iterations: ${snapshot.data}',
                );
              },
            ),
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}
