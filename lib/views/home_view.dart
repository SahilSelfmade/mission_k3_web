import 'package:csv_picker_button/csv_picker_button.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mission_k3_web/Models/theme_selector.dart';
import 'package:mission_k3_web/Models/view_wrapper.dart';
import '../widgets/text_field_input.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          // Note: Styles for TextSpans must be explicitly defined.
          // Child text spans will inherit styles from parent

          style: ThemeSelector.selectHeadline(context),
          children: const <TextSpan>[
            TextSpan(text: 'Welcome to '),
            TextSpan(
              text: 'Mission K3',
              style: TextStyle(
                color: Color(0xff21a179),
              ),
            ),
            TextSpan(text: '!'),
          ],
        ),
      );
    }

    return Center(
      child: header(),
    );
  }
}
