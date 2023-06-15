import 'package:ecommerce/utils/firebase_helper/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: Image.asset("assets/images/logo-01.png"),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(15),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Register Your Account",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Row(
                            //   children: [
                            //     Container(
                            //       margin: EdgeInsets.all(5),
                            //       height: 50,
                            //       width: 50,
                            //       decoration: BoxDecoration(
                            //         border: Border.all(
                            //             color: Colors.black, width: 0.5),
                            //         borderRadius: BorderRadius.circular(10),
                            //       ),
                            //       child: Icon(
                            //         Icons.account_circle_outlined,
                            //         color: Color(0xffE38800),
                            //       ),
                            //     ),
                            //     Expanded(
                            //       child: Container(
                            //         margin: EdgeInsets.all(5),
                            //         padding: EdgeInsets.symmetric(horizontal: 10),
                            //         height: 50,
                            //         decoration: BoxDecoration(
                            //           border: Border.all(
                            //               color: Colors.black, width: 0.5),
                            //           borderRadius: BorderRadius.circular(10),
                            //         ),
                            //         child: TextField(
                            //           controller: txtName,
                            //           decoration: InputDecoration(
                            //               hintText: "Enter Your Name",
                            //               border: InputBorder.none),
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            //
                            // SizedBox(
                            //   height: 5,
                            // ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(5),
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 0.5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                    Icons.mail_outlined,
                                    color: Color(0xffE38800),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    height: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 0.5),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: TextField(
                                      controller: txtEmail,
                                      decoration: InputDecoration(
                                          hintText: "Enter E-mail",
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(5),
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 0.5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                    Icons.lock_outline_rounded,
                                    color: Color(0xffE38800),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    height: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 0.5),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: TextField(
                                      controller: txtPassword,
                                      decoration: InputDecoration(
                                          hintText: "Enter Password",
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () async {
                          print("==========================================signin");
                          String? msg = await FireBaseHelper.fireBaseHelper.signUp(email: txtEmail.text, password: txtPassword.text);
                          Get.snackbar("$msg", "FireBase");
                          Get.offAndToNamed('/');
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xffE38800),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Sign Up",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            "Already have an account? Log In",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
