import 'package:cybertize_admin/textfild.dart';
import 'package:flutter/material.dart';

import 'dropdown.dart';

class AddEnquiry extends StatelessWidget {
  const AddEnquiry({super.key});

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
          Padding(
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
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  height: 30,
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
                                        offset: const Offset(
                                            1, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Business Development",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
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