import 'package:flutter/material.dart';
import 'package:jbtailors/Network%20provider/dataprovider.dart';
import 'package:jbtailors/pages/register.dart';

import 'dashboard.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

Widget textfield(
    String email, IconData abc, TextEditingController? controller) {
  return Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        color: Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextFormField(
          controller: controller,
          textAlign: TextAlign.start,
          style: const TextStyle(fontSize: 20, color: Colors.white),
          decoration: InputDecoration(
              icon: Icon(
                abc,
                size: 40,
                color: Colors.white,
              ),
              hintText: email,
              hintStyle: const TextStyle(color: Colors.white, fontSize: 20),
              border: InputBorder.none),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.done,
          cursorColor: Colors.white,
        ),
      ));
}

class _SignInState extends State<SignIn> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final APIProvider _apiProvider = APIProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(""),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/Login.jpg"), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(""),
              const SizedBox(
                height: 520,
              ),
              textfield("email", Icons.email_outlined, email),
              const SizedBox(
                height: 15,
              ),
              textfield("password", Icons.lock_outline_rounded, password),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
              SizedBox(
                height: 70,
                width: MediaQuery.of(context).size.width - 40,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () async {
                      final response = await _apiProvider.performLogin(
                          email.text.trim(), password.text.trim());

                      if (response.user!.email.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Dashboard()),
                        );
                      } else {
                        // ignore: avoid_print
                        print("fail");
                      }
                    },
                    child: const Text(
                      "Log in",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Not a memeber?",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Register()),
                        );
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
