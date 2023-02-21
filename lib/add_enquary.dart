import 'dart:developer';

import 'package:cybertize_admin/api/enquaryapi.dart';
import 'package:cybertize_admin/textfild.dart';
import 'package:cybertize_admin/util/userCred.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'dropdown.dart';

class AddEnquiry extends StatefulWidget {
  const AddEnquiry({super.key});

  @override
  State<AddEnquiry> createState() => _AddEnquiryState();
}

class _AddEnquiryState extends State<AddEnquiry> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  // TextEditingController passCon = TextEditingController();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/favicon (2) 1.png",
          ),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Add new enquiry",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          InkWell(
            onTap: () {
              userCred.logoutUser();
              Navigator.of(context).pushReplacementNamed(
                '/login',
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.red)),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "Logout",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            children: List.generate(
                1,
                (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            //set border radius more than 50% of height and width to make circle
                          ),
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Column(
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              100,
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                FormTTextFild(
                                                  icon: Icons.person,
                                                  hinttext: "Enter Lead name",
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                FormTTextFild(
                                                  icon: Icons.person,
                                                  hinttext:
                                                      "Enter email address",
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                FormTTextFild(
                                                  hinttext:
                                                      "Enter mobile number",
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                const Text(
                                                  "Looking for",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 5),
                                                  height: 30,
                                                  // width: 60,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: Colors.grey.shade200,
                                                    // border: Border.all(
                                                    //     color: const Color(0xff8F8F8F), width: 2),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.1),
                                                        spreadRadius: 1,
                                                        blurRadius: 1,
                                                        offset: const Offset(1,
                                                            3), // changes position of shadow
                                                      ),
                                                    ],
                                                  ),
                                                  child: DropDown(
                                                    showUnderline: false,
                                                    items: const [
                                                      "Business Development",
                                                      "Business Development",
                                                      "Business Development",
                                                    ],
                                                    onChanged: (value) {
                                                      // setState(() {
                                                      //   value == "Reject"
                                                      //       ? UpdatePopuP(context)
                                                      //       : Container();
                                                      // });
                                                      print(value);
                                                      // _accounttype = value.toString();
                                                    },
                                                    hint: const Text(
                                                      "Status",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black),
                                                    ),
                                                    icon: const Icon(
                                                      Icons.expand_more,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                const Text(
                                                  "For",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 5),
                                                  height: 30,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  // width: 60,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: Colors.grey.shade200,
                                                    // border: Border.all(
                                                    //     color: const Color(0xff8F8F8F), width: 2),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.1),
                                                        spreadRadius: 1,
                                                        blurRadius: 1,
                                                        offset: const Offset(1,
                                                            3), // changes position of shadow
                                                      ),
                                                    ],
                                                  ),
                                                  child: DropDown(
                                                    showUnderline: false,
                                                    items: const [
                                                      "Website",
                                                      "Website",
                                                      "Website",
                                                    ],
                                                    onChanged: (value) {
                                                      // setState(() {
                                                      //   value == "Reject"
                                                      //       ? UpdatePopuP(context)
                                                      //       : Container();
                                                      // });
                                                      print(value);
                                                      // _accounttype = value.toString();
                                                    },
                                                    hint: const Text(
                                                      "Status",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black),
                                                    ),
                                                    icon: const Icon(
                                                      Icons.expand_more,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                const Text(
                                                  "Source",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 5),
                                                  height: 30,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  // width: 60,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: Colors.grey.shade200,
                                                    // border: Border.all(
                                                    //     color: const Color(0xff8F8F8F), width: 2),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.1),
                                                        spreadRadius: 1,
                                                        blurRadius: 1,
                                                        offset: const Offset(1,
                                                            3), // changes position of shadow
                                                      ),
                                                    ],
                                                  ),
                                                  child: DropDown(
                                                    showUnderline: false,
                                                    items: const [
                                                      "Website",
                                                      "Website",
                                                      "Website",
                                                    ],
                                                    onChanged: (value) {
                                                      // setState(() {
                                                      //   value == "Reject"
                                                      //       ? UpdatePopuP(context)
                                                      //       : Container();
                                                      // });
                                                      print(value);
                                                      // _accounttype = value.toString();
                                                    },
                                                    hint: const Text(
                                                      "Status",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black),
                                                    ),
                                                    icon: const Icon(
                                                      Icons.expand_more,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                              ])),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 6),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  Colors.grey.shade200,
                                              child: const Icon(Icons.person),
                                            ),
                                          )
                                        ],
                                      )
                                    ]),
                                const SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  onTap: () async {
                                    log(userCred.getToken());
                                    if (nameController.text.isEmpty) {
                                      Fluttertoast.showToast(
                                          msg: "invalid name !",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);

                                      return;
                                    } else if (emailController.text.isEmpty) {
                                      Fluttertoast.showToast(
                                          msg: "invalid email !",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);

                                      return;
                                    } else if (mobileController.text.isEmpty) {
                                      Fluttertoast.showToast(
                                          msg: "invalid moblie !",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);

                                      return;
                                    }
                                    EnquiryApi enquiryApi = EnquiryApi();
                                    try {
                                      List data = await enquiryApi.addEnquiry(
                                          name: nameController.text,
                                          phone: mobileController.text,
                                          email: emailController.text,
                                          source: "dcdc",
                                          department: "dcdscd");

                                      print(data[0]["response"].runtimeType);

                                      if (data[0]["response"] == "1") {
                                        Fluttertoast.showToast(
                                            msg: "dvdsvdv",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 3,
                                            backgroundColor: Colors.green,
                                            textColor: Colors.white,
                                            fontSize: 16.0);

                                        setState(() {
                                          loading = false;
                                        });
                                      } else {
                                        setState(() {
                                          loading = false;
                                        });
                                        Fluttertoast.showToast(
                                            msg: "cdscdscdscds",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                        setState(() {
                                          loading = false;
                                        });
                                      }
                                    } catch (e) {}
                                  },
                                  // onTap: () {
                                  //   Navigator.pushNamed(context, "/mobileRegister");
                                  //   // Navigator.pushNamed(context, "/googleverifiedotp");
                                  // },,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    height: 39,
                                    // width: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color(0xff247CFF),
                                      // border: Border.all(
                                      //     color: const Color(0xff8F8F8F), width: 2),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                          offset: const Offset(1,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Save",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )),
                    ))),
      ),
    );
  }
}
