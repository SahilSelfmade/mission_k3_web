// import 'package:csv_picker_button/csv_picker_button.dart';
// import 'package:flutter/material.dart';
// import 'package:mission_k3_web/Models/theme_selector.dart';
// import 'package:mission_k3_web/Models/view_wrapper.dart';
// import 'package:mission_k3_web/widgets/navigation_arrow.dart';

// class MemberView extends StatefulWidget {
//   @override
//   _MemberViewState createState() => _MemberViewState();
// }

// class _MemberViewState extends State<MemberView> {
//   late double screenHeight;
//   late double screenWidth;
//   var dataShow;

//   Widget desktopView() {
//     return Stack(
//       children: [
//         NavigationArrow(isBackArrow: false),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               width: screenWidth * 0.45,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   header(getFontSize(true)),
//                   SizedBox(height: screenHeight * 0.05),
//                   subHeader('add', getFontSize(false)),
//                   SizedBox(height: screenHeight * 0.01),
//                   Container(
//                     color: Colors.amber,
//                     child: Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: CsvButton(
//                               child: Text("PRESS TO UPLOAD CSV"),
//                               csvConfiguration: CsvConfiguration(
//                                   hasTitle: true, separator: Separator.comma),
//                               onJsonReceived: (data) {
//                                 print(data);
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(width: screenWidth * 0.03),
//           ],
//         )
//       ],
//     );
//   }

//   Widget mobileView() {
//     return Column(
//       children: [
//         SizedBox(height: screenHeight * 0.02),
//         header(30),
//         SizedBox(height: screenHeight * 0.01),
//         subHeader('Computer Scientist - App Developer - Flutter Enthusiast', 15)
//       ],
//     );
//   }

//   double getImageSize() {
//     if (screenWidth > 1600 && screenHeight > 800) {
//       return 400;
//     } else if (screenWidth > 1300 && screenHeight > 600) {
//       return 350;
//     } else if (screenWidth > 1000 && screenHeight > 400) {
//       return 300;
//     } else {
//       return 250;
//     }
//   }

//   double getFontSize(bool isHeader) {
//     double fontSize = screenWidth > 950 && screenHeight > 550 ? 30 : 25;
//     return isHeader ? fontSize * 2.25 : fontSize;
//   }

//   Widget header(double fontSize) {
//     return RichText(
//       text: TextSpan(
//         // Note: Styles for TextSpans must be explicitly defined.
//         // Child text spans will inherit styles from parent
//         style: ThemeSelector.selectHeadline(context),
//         children: <TextSpan>[
//           TextSpan(text: 'Member Sheet '),
//           TextSpan(text: 'Upload', style: TextStyle(color: Color(0xff21a179))),
//           TextSpan(text: '!'),
//         ],
//       ),
//     );
//   }

//   Widget subHeader(String text, double fontSize) {
//     return Text(text, style: ThemeSelector.selectSubHeadline(context));
//   }

//   @override
//   Widget build(BuildContext context) {
//     screenHeight = MediaQuery.of(context).size.height;
//     screenWidth = MediaQuery.of(context).size.width;

//     return ViewWrapper(desktopView: desktopView(), mobileView: mobileView());
//   }
// }
