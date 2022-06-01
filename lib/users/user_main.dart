// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'user_detail.dart';
import 'edit_user.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  CollectionReference owners = FirebaseFirestore.instance.collection('users');

  final Stream<QuerySnapshot> ownersStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  Future<void> deleteUser(id) {
    return owners
        .doc(id)
        .delete()
        .then((value) => Get.snackbar(
              'User Deleted Successfully',
              '',
              isDismissible: true,
              maxWidth: MediaQuery.of(context).size.width * 0.5,
              duration: const Duration(
                seconds: 2,
              ),
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.white,
            ))
        .catchError((error) => Get.snackbar(
              'User Deleted Failed',
              '$error',
              isDismissible: true,
              maxWidth: MediaQuery.of(context).size.width * 0.5,
              duration: const Duration(
                seconds: 2,
              ),
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.white,
            ));
  }

  _bodyRowCell(
    List<dynamic> userDetails,
    int i,
    filedName,
  ) {
    return ListTile(
      title: Center(
        child: Text(
          userDetails[i][filedName].toString(),
          style: const TextStyle(fontSize: 14, color: Colors.black),
        ),
      ),
      tileColor: Colors.grey[100],
    );
  }

  _topRowCell(text) {
    return ListTile(
      title: Text(
        text.toUpperCase(),
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      tileColor: Color(0xff21a179),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: ownersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          print('Something Went Wrong');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final List userDetails = [];

        snapshot.data!.docs.map((DocumentSnapshot document) {
          Map data = document.data() as Map<String, dynamic>;
          userDetails.add(data);
          data['id'] = document.id;
          print(document.id);
          print(data);
        }).toList();

        return Scaffold(
          // backgroundColor: Colors.black,
          body: Container(
            child: Scrollbar(
              scrollbarOrientation: ScrollbarOrientation.bottom,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Table(
                        defaultColumnWidth: FixedColumnWidth(200.0),
                        border: TableBorder.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 2,
                        ),
                        // defaultColumnWidth: const IntrinsicColumnWidth(flex: 2),

                        // columnWidths: const <int, TableColumnWidth>{
                        //   2: FixedColumnWidth(100),
                        // },
                        children: [
                          TableRow(
                            children: [
                              _topRowCell('Name'),
                              _topRowCell('Phone'),
                              _topRowCell('Action'),
                            ],
                          ),
                          for (var i = 0; i < userDetails.length; i++) ...[
                            TableRow(
                              children: [
                                _bodyRowCell(userDetails, i, 'first_name'),
                                _bodyRowCell(userDetails, i, 'phone_number'),
                                TableCell(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: IconButton(
                                          icon: const Icon(
                                            Icons.remove_red_eye,
                                            color: Colors.black,
                                          ),
                                          onPressed: () {
                                            Get.to(
                                              () => UserDetailsPage(
                                                  id: userDetails[i]['id']),
                                            );
                                            // print(userDetails);
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: IconButton(
                                          icon: const Icon(
                                            Icons.edit,
                                            color: Colors.black,
                                          ),
                                          onPressed: () {
                                            Get.to(
                                              () => UserDetailsEditPage(
                                                  id: userDetails[i]['id']),
                                            );
                                            // print(userDetails);
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: IconButton(
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.black,
                                          ),
                                          onPressed: () {
                                            deleteUser(userDetails[i]['id']);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ]
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
