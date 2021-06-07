import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageBottomButton extends StatelessWidget {
  final String title;
  final Color color;
  final Color textColor;
  final void Function() onPressed;

  PageBottomButton({
    required this.title,
    required this.color,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: double.infinity,
            minHeight: 60.0,
          ),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(color),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
              ),
            ),
            onPressed: onPressed,
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'SharpSans',
                letterSpacing: 0.2,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TransportButton extends StatelessWidget {
  final String title;
  final String image;
  final void Function() onPressed;
  final bool isSelected;

  TransportButton({
    required this.title,
    required this.image,
    required this.onPressed,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
            side: BorderSide(
              color: isSelected ? Colors.black : Colors.white,
              width: 4,
            ),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.grey[200],
            child: SvgPicture.asset(
              image,
              height: 50.0,
              width: 50.0,
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 16.0,
          ),
        ],
      ),
    );
  }
}
