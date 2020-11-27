import 'package:flutter/material.dart';

class BuildDivader extends StatelessWidget {
  final Color cor;

  const BuildDivader({Key key, this.cor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Divider(
        color: cor,
        height: 2,
      ),
    );
  }
}
