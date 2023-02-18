import 'package:cybertize_admin/dropdown.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_dropdown/flutter_dropdown.dart'; /

class AllEnquiry extends StatelessWidget {
  const AllEnquiry({super.key});

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
              "Enquirers",
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              "total 45 entires",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 10,
              ),
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
                10,
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
                                horizontal: 15, vertical: 15),
                            child: Column(children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Niraj Kumar",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    height: 30,
                                    // width: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.blue,
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
                                    child: DropDown(
                                      showUnderline: false,
                                      items: const [
                                        "Attempted",
                                        "Approved",
                                        "pending",
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
                                            fontSize: 12, color: Colors.white),
                                      ),
                                      icon: const Icon(
                                        Icons.expand_more,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // const SizedBox(
                              //   height: 8,
                              // ),
                              Row(
                                children: const [
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Color(0xff247CFF),
                                    child: Icon(
                                      Icons.email_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text("niraj32@gmail.com")
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: const [
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Color(0xff247CFF),
                                    child: Icon(
                                      Icons.call,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "+91 8804209877",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),

                                    // width: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color(0xffF0F0F0),
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
                                    child: const Text(
                                      "Business Development",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff247CFF),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),

                                    // width: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color(0xffF0F0F0),
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
                                    child: const Text(
                                      "Web",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff247CFF),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "32 mins ago",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )
                            ]),
                          )),
                    ))),
      ),
    );
  }
}
