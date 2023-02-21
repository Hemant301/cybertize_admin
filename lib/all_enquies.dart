import 'package:cybertize_admin/api/enquaryapi.dart';
import 'package:cybertize_admin/dropdown.dart';
import 'package:cybertize_admin/util/userCred.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_dropdown/flutter_dropdown.dart'; /

class AllEnquiry extends StatefulWidget {
  const AllEnquiry({super.key});

  @override
  State<AllEnquiry> createState() => _AllEnquiryState();
}

class _AllEnquiryState extends State<AllEnquiry> {
  List allData = [];

  getEnquiry() async {
    try {
      EnquiryApi enquiryApi = EnquiryApi();
      Map data = await enquiryApi.getEnquiry();
      setState(() {
        allData = data['result'];
      });
      print(allData.toString());
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getEnquiry();
    // TODO: implement initState
    super.initState();
  }

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
                allData.length,
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
                                  Text(
                                    allData[index]['name'].toString(),
                                    style: const TextStyle(
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
                                    child: DropDown(
                                      // initialValue:
                                      //     allData[index]['status'].toString(),
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
                                      hint: Text(
                                        allData[index]['status'].toString(),
                                        style: const TextStyle(
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
                                children: [
                                  const CircleAvatar(
                                    radius: 12,
                                    backgroundColor: Color(0xff247CFF),
                                    child: Icon(
                                      Icons.email_outlined,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(allData[index]['email'].toString())
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 12,
                                    backgroundColor: Color(0xff247CFF),
                                    child: Icon(
                                      Icons.call,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "+91 ${allData[index]['phone'].toString()}",
                                    style: const TextStyle(
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
                                    child: Text(
                                      allData[index]['department'].toString(),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff247CFF),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
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
                                    child: Text(
                                      allData[index]['source'].toString(),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff247CFF),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const Spacer(
                                    flex: 1,
                                  ),
                                  Text(
                                    "${DateTime.parse(allData[index]['createdAt'].toString()).day}/${DateTime.parse(allData[index]['createdAt'].toString()).month}/${DateTime.parse(allData[index]['createdAt'].toString()).year}",
                                    style: const TextStyle(
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
