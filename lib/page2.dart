import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'components/buttons.dart';
import 'components/pageIndicators.dart';
import 'components/passwordField.dart';

enum TransportSelected { TRAIN, CAR }

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  bool isSelected = true;
  TransportSelected transportOption = TransportSelected.TRAIN;

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
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10.0,
                    ),
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundColor: Colors.yellow,
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/caret.svg',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: FittedBox(
                    child: Text(
                      'Enter your password',
                      style: TextStyle(
                        fontFamily: 'SharpSans',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(flex: 4, child: PasswordTextField()),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: FittedBox(
                    child: Text(
                      'How do you travel?',
                      style: TextStyle(
                        fontFamily: 'SharpSans',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: double.infinity,
                          ),
                          // width: 288.0,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 3,
                                color: Colors.grey.shade200,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(60))),
                          child: Row(
                            children: [
                              TransportButton(
                                title: 'Train',
                                image: 'assets/train.svg',
                                onPressed: () {
                                  setState(() {
                                    transportOption = TransportSelected.TRAIN;
                                  });
                                },
                                isSelected:
                                    transportOption == TransportSelected.TRAIN
                                        ? true
                                        : false,
                              ),
                              TransportButton(
                                title: 'Car',
                                image: 'assets/car.svg',
                                onPressed: () {
                                  setState(() {
                                    transportOption = TransportSelected.CAR;
                                  });
                                },
                                isSelected:
                                    transportOption == TransportSelected.CAR
                                        ? true
                                        : false,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
              Expanded(
                flex: 3,
                child: SizedBox(
                  height: 50.0,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: PageIndicators(
                    animController: _animController,
                    animateBar1: 0.0,
                    animateBar2: 1.0,
                  ),
                ),
              ),
              // Expanded(
              //   child: SizedBox(
              //     height: 20,
              //   ),
              // ),
              Expanded(
                flex: 2,
                child: PageBottomButton(
                  title: 'Finish',
                  color: Colors.yellow,
                  textColor: Colors.black,
                  onPressed: () {},
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
