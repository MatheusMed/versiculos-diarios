import 'package:flutter/material.dart';
import 'package:todo_dia/app/theme/app_theme.dart';

class CustomDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Divider(
        color: appTheme.accentColor,
        endIndent: 10,
        indent: 10,
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'package:todo_dia/app/utils/build_divider.dart';

// class CustomDivider extends StatelessWidget {
//   final Widget icone;
//   final Color cores;

//   const CustomDivider({Key key, this.icone, this.cores}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: Get.height * 0.02),
//       width: Get.width * 0.9,
//       child: Row(
//         children: <Widget>[
//           BuildDivader(
//             cor: cores,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             child: icone,
//           ),
//           BuildDivader(
//             cor: cores,
//           ),
//         ],
//       ),
//     );
//   }
// }
