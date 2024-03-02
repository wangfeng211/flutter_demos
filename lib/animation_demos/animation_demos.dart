import 'package:animate_demo1/animation_demos/pages/1_animation_container.dart';
import 'package:animate_demo1/animation_demos/pages/10_other_widget.dart';
import 'package:animate_demo1/animation_demos/pages/11_flare_demo.dart';
import 'package:animate_demo1/animation_demos/pages/2_animated_switcher_demo_page.dart';
import 'package:animate_demo1/animation_demos/pages/3_other_animation_widgets_page.dart';
import 'package:animate_demo1/animation_demos/pages/4_tween_animation_builder_page.dart';
import 'package:animate_demo1/animation_demos/pages/5_animated_counter_page.dart';
import 'package:animate_demo1/animation_demos/pages/6_controller.dart';
import 'package:animate_demo1/animation_demos/pages/7_tween.dart';
import 'package:animate_demo1/animation_demos/pages/8_animatedBuilder.dart';
import 'package:animate_demo1/animation_demos/pages/9_animate_snow_demo.dart';
import 'package:animate_demo1/animation_demos/pages/animation_controller_1.dart';

import 'package:flutter/material.dart';

class AnimationDemos extends StatefulWidget {
  const AnimationDemos({Key? key}) : super(key: key);

  @override
  _AnimationDemosState createState() => _AnimationDemosState();
}

class _AnimationDemosState extends State<AnimationDemos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationDemos'),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AnimationContainerDemoPage();
            }));
          }, child: Text('1-AnimatedContainer')),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AnimatedSwitcherDemoPage();
            }));
          }, child: Text('2-AnimatedSwitcher')),

          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return OtherAnimationWidgets();
            }));
          }, child: Text('3-OtherAnimationWidgets')),

          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return TweenAnimationBuilderPage();
            }));
          }, child: Text('4-TweenAnimationBuilder')),

          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AnimatedCounterPage();
            }));
          }, child: Text('5-AnimatedCounterPage')),

          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AnimationController1();
            }));
          }, child: Text('AnimationControllerDemo')),

          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return OtherWidgetPage();
            }));
          }, child: Text('OtherWidgetDemo')),

          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ControllerDemoPage();
            }));
          }, child: Text('6-AnimationControllerDemoPage')),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return TweenDemoPage();
            }));
          }, child: Text('7-TweenDemoPage')),

          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AnimatedBuilderDemoPage();
            }));
          }, child: Text('8-AnimatedBuilderDemoPage')),

          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SnowDemoPage();
            }));
          }, child: Text('9-SnowDemo')),

          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FlareDemo();
            }));
          }, child: Text('11-FlareDemo')),
        ],
      ),
    );
  }
}
