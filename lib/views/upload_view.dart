import 'package:csv_picker_button/csv_picker_button.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mission_k3_web/Models/theme_selector.dart';
import 'package:mission_k3_web/Models/view_wrapper.dart';
import '../widgets/text_field_input.dart';

List<DropdownMenuItem<String>> get postCategoryItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(child: const Text("Audio"), value: "audio"),
    const DropdownMenuItem(child: Text("Video"), value: "video"),
    const DropdownMenuItem(child: Text("Image"), value: "image"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get postTypeItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(child: const Text("Free"), value: "free"),
    const DropdownMenuItem(child: Text("Paid"), value: "paid"),
  ];
  return menuItems;
}

class MemberView extends StatefulWidget {
  const MemberView({Key? key}) : super(key: key);

  @override
  _MemberViewState createState() => _MemberViewState();
}

class _MemberViewState extends State<MemberView> {
  late var dataShow;
  late double screenHeight;
  late double screenWidth;
  String selectedPostTypeValue = "free";
  String selectedValue = "audio";

  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _postCategoryController = TextEditingController();
  final TextEditingController _postTypeController = TextEditingController();
  final TextEditingController _thumbnailController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();

  double getFontSize(bool isHeader) {
    double fontSize = screenWidth > 950 && screenHeight > 550 ? 30 : 25;
    return isHeader ? fontSize * 2.25 : fontSize;
  }

  Widget header(double fontSize) {
    return RichText(
      text: TextSpan(
        // Note: Styles for TextSpans must be explicitly defined.
        // Child text spans will inherit styles from parent
        style: ThemeSelector.selectHeadline(context),
        children: const <TextSpan>[
          TextSpan(text: 'Post '),
          TextSpan(text: 'Upload', style: TextStyle(color: Color(0xff21a179))),
          TextSpan(text: '!'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: SizedBox(
        child: Column(
          children: [
            const SizedBox(
              height: 34,
            ),
            header(getFontSize(true)),
            const SizedBox(
              height: 24,
            ),
            Center(
              child: Text(
                'Add Basic Description',
                style: GoogleFonts.oswald(
                  textStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            TextFieldInput(
              hintText: 'Title',
              textInputType: TextInputType.text,
              textEditingController: _titleController,
            ),
            const SizedBox(
              height: 24,
            ),
            TextFieldInput(
              hintText: 'Description',
              textInputType: TextInputType.text,
              textEditingController: _descriptionController,
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Post Category Type',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: DropdownButton(
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      isExpanded: true,
                      value: selectedPostTypeValue,
                      items: postTypeItems,
                      dropdownColor: Colors.grey[100],
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedPostTypeValue = newValue!;
                          print(newValue);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Post Type',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: DropdownButton(
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      isExpanded: true,
                      value: selectedValue,
                      items: postCategoryItems,
                      dropdownColor: Colors.grey[100],
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            MaterialButton(
              minWidth: screenWidth,
              padding: const EdgeInsets.symmetric(vertical: 20),
              color: Colors.grey[500],
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  allowMultiple: false,
                );

                if (result != null) {
                  PlatformFile file = result.files.first;

                  print(file.name);
                  // print(file.bytes);
                  print(file.size);
                  print(file.extension);
                  print(file.path);
                } else {
                  // User canceled the picker
                }
              },
              child: Text(
                'Select File'.toUpperCase(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(height: screenHeight * 0.01),
            MaterialButton(
              minWidth: screenWidth,
              padding: const EdgeInsets.symmetric(vertical: 20),
              color: Color(0xff21a179),
              onPressed: () {},
              child: Text(
                "PRESS TO UPLOAD FILE",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: screenWidth * 0.03)
          ],
        ),
      ),
    );
  }
}
