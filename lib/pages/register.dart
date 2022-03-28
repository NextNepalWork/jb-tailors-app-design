import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:jbtailors/Network%20provider/dataprovider.dart';
import 'package:jbtailors/pages/signin.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController email = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController cpassword = TextEditingController();
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
                height: 400,
              ),
              textfield("Email", Icons.email_outlined, email),
              const SizedBox(
                height: 15,
              ),
              textfield("Name", Icons.person, name),
              const SizedBox(
                height: 15,
              ),
              textfield("Password", Icons.lock_outline_rounded, password),
              const SizedBox(
                height: 15,
              ),
              textfield("Confirm Password", Icons.person, cpassword),
              const SizedBox(height: 20),
              SizedBox(
                height: 70,
                width: MediaQuery.of(context).size.width - 40,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () async {
                      final response = await _apiProvider.performRegister(
                          "abcd@example.com", "abcd", "abcd", "abcd"
                          // email.text.trim().toString(),
                          // name.text.trim().toString(),
                          // password.text.trim().toString(),
                          // password.text.trim().toString()
                          // );
                          );

                      if (response.user!.email.isNotEmpty) {
                        print("Success");
                      } else {
                        print("fails");
                      }
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have account?",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignIn()));
                      },
                      child: const Text(
                        "Login",
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
}
