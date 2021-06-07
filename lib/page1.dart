import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:staze_test/page2.dart';

import 'components/buttons.dart';
import 'components/pageIndicators.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> with SingleTickerProviderStateMixin {
  late AnimationController _animController;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      duration: Duration(seconds: 10),
      vsync: this,
    );

    _animController.forward();

    _animController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        _animController.stop();

        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => Page2(),
          ),
        ).then((_) {
          _animController.reset();
          _animController.forward();
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.yellow,
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              width: double.infinity,
              child: Image(
                fit: BoxFit.fill,
                image: AssetImage('assets/onboarding-1.png'),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Text(
                  'The best trips are the ones you never saw coming',
                  style: TextStyle(
                    fontFamily: 'SharpSans',
                    letterSpacing: 0,
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 20.0),
                child: PageIndicators(
                  animController: _animController,
                  animateBar1: 1.0,
                  animateBar2: 0.0,
                ),
              ),
            ),
          ),
          Expanded(
            child: PageBottomButton(
              title: 'Next',
              color: Colors.black,
              textColor: Colors.white,
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Page2(),
                  ),
                ).then((_) {
                  _animController.reset();
                  _animController.forward();
                }); //
              },
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 80.0,
            ),
          ),
        ],
      ),
    ));
  }
}
