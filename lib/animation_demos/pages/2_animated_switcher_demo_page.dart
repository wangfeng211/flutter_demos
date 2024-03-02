import 'package:flutter/material.dart';

class AnimatedSwitcherDemoPage extends StatefulWidget {
  const AnimatedSwitcherDemoPage({Key? key}) : super(key: key);

  @override
  _AnimatedSwitcherDemoPageState createState() =>
      _AnimatedSwitcherDemoPageState();
}

class _AnimatedSwitcherDemoPageState extends State<AnimatedSwitcherDemoPage> {
  bool _change = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedSwicher'),
      ),
      body: Center(
          child: GestureDetector(
              onTap: () {
                setState(() {
                  _change = !_change;
                });
              },
              child: Container(
                  width: 300,
                  height: 300,
                  color: Colors.orange,
                  child: AnimatedCrossFade(
                    firstChild: Text(
                      "Hello",
                      style: TextStyle(fontSize: 50),
                    ),
                    secondChild: Center(child: CircularProgressIndicator()),
                    crossFadeState: _change
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: Duration(seconds: 2),
                  )
                  // AnimatedSwitcher(
                  //   duration: Duration(seconds: 2),
                  //   child: Text(
                  //     'Hello',
                  //     key: UniqueKey(),
                  //     style: TextStyle(fontSize: 50),
                  //   ),
                  //   transitionBuilder: (Widget child, animation) {
                  //     print(animation.value);
                  //     return RotationTransition(
                  //       turns: animation,
                  //       child: ScaleTransition(
                  //           scale: animation,
                  //           child: FadeTransition(
                  //             opacity: animation,
                  //             child: child,
                  //           )),
                  //     );
                  //   },
                  // ),
                  ))),
    );
  }
}
