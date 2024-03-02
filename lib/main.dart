import 'package:animate_demo1/animation_demos/animation_demos.dart';
import 'package:animate_demo1/key_demos/key_demos.dart';
import 'package:animate_demo1/scroll_demos/scroll_demos_page.dart';
import 'package:animate_demo1/sliver_demos/sliver_demos.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AnimationDemos();
                }));
              }, child: Text('Animation Demos')),

              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return KeyDemosPage();
                }));
              }, child: Text('Key Demos')),

              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ScrollDemosPage();
                }));
              }, child: Text('Scroll Demos')),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SliverDemosPage();
                }));
              }, child: Text('Sliver Demos'))

            ],
          ),
      // Center(
      //   // Center is a layout widget. It takes a single child and positions it
      //   // in the middle of the parent.
      //   child: AnimatedContainer(
      //     duration: Duration(seconds: 1),
      //     alignment: Alignment.center,
      //     width: 300,
      //     height: 300,
      //     // child: Text('Welcome', style: TextStyle(fontSize: 50), textAlign: TextAlign.center,),
      //     decoration: BoxDecoration(
      //         gradient: const LinearGradient(
      //           end: Alignment.topCenter,
      //           begin: Alignment.bottomCenter,
      //           colors: [Colors.orange, Colors.white],
      //           stops: [0.2, 0.3]
      //         ),
      //         boxShadow: [BoxShadow(spreadRadius: 25, blurRadius: 25)],
      //         borderRadius: BorderRadius.circular(150)),
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
