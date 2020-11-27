import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double tFont;
  final Color cor;

  const CustomText({Key key, this.text, this.tFont, this.cor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: tFont,
        color: cor,
      ),
    );
  }
}
