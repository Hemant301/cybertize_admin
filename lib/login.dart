import 'dart:developer';

import 'package:cybertize_admin/api/authapi.dart';
import 'package:cybertize_admin/textfild.dart';
import 'package:cybertize_admin/util/userCred.dart';
import 'package:fl_toast/fl_toast.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailCon = TextEditingController();
  TextEditingController passCon = TextEditingController();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Image.asset(
                      "assets/logo-inverted-new.png",
                      // height: 200,
                      width: MediaQuery.of(context).size.width,
                    ))),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: FormTTextFild(
                icon: Icons.person,
                hinttext: "Enter email address",
                controller: emailCon,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: FormTTextFild(
                hinttext: "Enter Password",
                controller: passCon,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            loading == true
                ? const CircularProgressIndicator()
                : Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: InkWell(
                      onTap: () async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        if (emailCon.text == "" || passCon.text == "") {
                          showTextToast(
                              text: "Enter email and password",
                              context: context);
                          return;
                        }
                        setState(() {
                          loading = true;
                        });

                        AuthApi api = AuthApi();
                        Map data = await api.login(context,
                            email: emailCon.text, pwd: passCon.text);
                        if (data['status'].toString() == "200") {
                          userCred.addUserId(data['user']['_id'].toString());
                          userCred.addToken(data['token'].toString());
                          log("fsefhsefrhjfjh${userCred.getUserId()}");
                          log(userCred.getToken());
                          Navigator.pushNamed(context, "/navbar");
                          setState(() {
                            loading = false;
                          });
                        } else {
                          showTextToast(
                              text: data['message'], context: context);
                          setState(() {
                            loading = false;
                          });
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        height: 50,
                        // width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
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
                            "LogIn",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
          ]),
    );
  }
}
