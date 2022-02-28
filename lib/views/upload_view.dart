import 'package:csv_picker_button/csv_picker_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mission_k3_web/Models/theme_selector.dart';
import 'package:mission_k3_web/Models/view_wrapper.dart';
import 'package:mission_k3_web/widgets/navigation_arrow.dart';
import '../widgets/text_field_input.dart';

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("Audio"), value: "audio"),
    DropdownMenuItem(child: Text("Video"), value: "video"),
    DropdownMenuItem(child: Text("Image"), value: "image"),
  ];
  return menuItems;
}

class MemberView extends StatefulWidget {
  const MemberView({Key? key}) : super(key: key);

  @override
  _MemberViewState createState() => _MemberViewState();
}

class _MemberViewState extends State<MemberView> {
  String selectedValue = "audio";
  late var dataShow;
  late double screenHeight;
  late double screenWidth;

  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _postTypeController = TextEditingController();
  final TextEditingController _postCategoryController = TextEditingController();

  final TextEditingController _thumbnailController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();

  Widget desktopView() {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.20,
        child: Column(
          children: [
            const SizedBox(
              height: 34,
            ),
            // const NavigationArrow(
            //   isBackArrow: false,

            // ),
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

            TextFieldInput(
              hintText: 'Post Type',
              textInputType: TextInputType.text,
              textEditingController: _postTypeController,
            ),

            const SizedBox(
              height: 24,
            ),
            TextFieldInput(
              hintText: 'Post Category',
              textInputType: TextInputType.text,
              textEditingController: _postCategoryController,
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey[500],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Select Post Category Type',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: DropdownButton(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      isExpanded: true,
                      value: selectedValue,
                      items: dropdownItems,
                      dropdownColor: Colors.grey[500],
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
            TextFieldInput(
              hintText: 'Thumbnail',
              textInputType: TextInputType.text,
              textEditingController: _thumbnailController,
            ),
            const SizedBox(
              height: 24,
            ),
            // InkWell(
            //   onTap: () async {
            //     // if (
            //     // _addressController.value.text != "" &&
            //     // _clockInEmployeeController.value.text != "" &&
            //     // _companyNameController.value.text != "" &&
            //     // _ownerNameController.value.text != "" &&
            //     // _subscriptionExpiryController.value.text != "" &&
            //     // _totalEmployeeController != "" &&
            //     // _totalOfficeLocationController != "" &&
            //     // _zipController != ""
            //     //       ) {
            //     //     setState(() {
            //     //       isLoading = true;
            //     //     });
            //     //     registerEmployee(null);
            //     //     Get.snackbar(
            //     //       'Success',
            //     //       'Business Added Successfully.',
            //     //       isDismissible: true,
            //     //       maxWidth: MediaQuery.of(context).size.width * 0.5,
            //     //       backgroundColor: Colors.white,
            //     //       duration: const Duration(
            //     //         seconds: 2,
            //     //       ),
            //     //       snackPosition: SnackPosition.BOTTOM,
            //     //     );
            //     //     // Get.to
            //     //   } else {
            //     //     Get.snackbar(
            //     //       "Register Employee  Failed",
            //     //       'All Fields are required.',
            //     //       snackPosition: SnackPosition.BOTTOM,
            //     //       isDismissible: true,
            //     //       duration: const Duration(seconds: 2),
            //     //       icon: const Icon(
            //     //         Icons.dangerous,
            //     //         color: Colors.red,
            //     //       ),
            //     //     );
            //     //   }
            //   },
            //   child: Container(
            //     width: double.infinity,
            //     alignment: Alignment.center,
            //     padding: const EdgeInsets.symmetric(
            //       vertical: 12.0,
            //     ),
            //     decoration: ShapeDecoration(
            //       color: Colors.black,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(4),
            //       ),
            //     ),
            //     child: Text(
            //       'Submit'.toUpperCase(),
            //       style: const TextStyle(
            //         color: Colors.white,
            //         fontWeight: FontWeight.w500,
            //         fontSize: 18,
            //       ),
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 24,
            ),
            // subHeader('add', getFontSize(false)),
            SizedBox(height: screenHeight * 0.01),
            Container(
              color: Colors.amber,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CsvButton(
                        child: Text("PRESS TO UPLOAD DATA"),
                        csvConfiguration: CsvConfiguration(
                            hasTitle: true, separator: Separator.comma),
                        onJsonReceived: (data) {
                          print(data);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: screenWidth * 0.03)
          ],
        ),
      ),
    );
  }

  Widget mobileView() {
    return Column(
      children: [
        SizedBox(height: screenHeight * 0.02),
        header(30),
        SizedBox(height: screenHeight * 0.01),
        subHeader('Computer Scientist - App Developer - Flutter Enthusiast', 15)
      ],
    );
  }

  double getImageSize() {
    if (screenWidth > 1600 && screenHeight > 800) {
      return 400;
    } else if (screenWidth > 1300 && screenHeight > 600) {
      return 350;
    } else if (screenWidth > 1000 && screenHeight > 400) {
      return 300;
    } else {
      return 250;
    }
  }

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

  Widget subHeader(String text, double fontSize) {
    return Text(text, style: ThemeSelector.selectSubHeadline(context));
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return ViewWrapper(desktopView: desktopView(), mobileView: mobileView());
  }
}
