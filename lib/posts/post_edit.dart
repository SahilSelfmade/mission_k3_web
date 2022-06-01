import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mission_k3_web/homepage.dart';
import 'package:mission_k3_web/main.dart';

import '../../widgets/text_field_input.dart';
import '../homepages copy.dart';

class PostDetailsEditPage extends StatefulWidget {
  const PostDetailsEditPage({Key? key, this.id}) : super(key: key);

  final String? id;

  @override
  State<PostDetailsEditPage> createState() => _PostDetailsEditPageState();
}

class _PostDetailsEditPageState extends State<PostDetailsEditPage> {
  bool isLoading = false;
  CollectionReference posts =
      FirebaseFirestore.instance.collection('home_posts');

  final TextEditingController _description = TextEditingController();
  final TextEditingController _postType = TextEditingController();
  final TextEditingController _shares = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> updateUser(
    id,
    description,
    postType,
    shares,
  ) async {
    posts
        .doc(id)
        .update({
          'description': description,
          'post_type': postType,
          'shares': shares,
        })
        .then(
          (value) => print("User Updated"),
        )
        .catchError(
          (onError) => print(onError),
        );
  }

  // Future<void> updateUser() {
  //   return Container();
  // }

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Container(
            color: Colors.white,
            // width: screenW < 1000 ? screenW * 0.95 : screenW * 0.4,
            child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              future: FirebaseFirestore.instance
                  .collection('home_posts')
                  .doc(widget.id)
                  .get(),
              builder: (_, snapshot) {
                if (snapshot.hasError) {
                  print('Something went Wrong');
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                var data = snapshot.data!.data();
                var description = data!['description'];
                var postType = data['post_type'];
                var shares = data['shares'];

                _description.text = description.toString();
                _postType.text = postType.toString();
                _shares.text = shares.toString();

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 24,
                        ),
                        Center(
                          child: Text(
                            'Edit Post Details',
                            style: GoogleFonts.oswald(
                              textStyle: const TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 48,
                        ),
                        TextFieldInput(
                          textEditingController: _description,
                          labelText: 'Description',
                          textInputType: TextInputType.text,
                          onChanged: (value) => description = value,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        TextFieldInput(
                          labelText: 'Post Type',
                          // enabled: false,
                          textEditingController: _postType,
                          textInputType: TextInputType.text,
                          onChanged: (value) => postType = value,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        TextFieldInput(
                          textEditingController: _shares,
                          labelText: 'Shares',
                          // hintText: 'Hello',
                          textInputType: TextInputType.text,
                          onChanged: (value) => shares = value,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        InkWell(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                                updateUser(
                                  widget.id,
                                  description,
                                  shares,
                                  postType,
                                );
                              });
                              // print(updateUser);
                              Get.back;
                              Get.snackbar(
                                'Success',
                                'Post Updated Successfully.',
                                isDismissible: true,
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.5,
                                backgroundColor: Colors.white,
                                duration: const Duration(
                                  seconds: 2,
                                ),
                                snackPosition: SnackPosition.BOTTOM,
                              );
                              // Get.to
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                              vertical: 12.0,
                            ),
                            decoration: ShapeDecoration(
                              color: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            child: Text(
                              'Update'.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        InkWell(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });

                              Get.off(MyApp());
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                              vertical: 12.0,
                            ),
                            decoration: ShapeDecoration(
                              color: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            child: Text(
                              'HOME'.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                      ],
                    ),
                  ),
                );
              },
            )),
      ),
    );
  }
}
