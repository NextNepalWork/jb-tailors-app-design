import 'package:flutter/material.dart';
import 'package:jbtailors/pages/dashboard.dart';
import 'package:jbtailors/pages/signin.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

Widget text(String hint, String label) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Container(
      height: 50,
      decoration: const BoxDecoration(color: Colors.black12),
      child: TextFormField(
          decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hint,
        label: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: TextStyle(color: Colors.blue.shade900),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        hintStyle: const TextStyle(fontSize: 12),
      )),
    ),
  );
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.blue.shade900),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "Profile",
            style: TextStyle(
                color: Colors.blue.shade900,
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Column(
              children: [
                const Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("images/Login.jpg"),
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Edit Profile",
                      style: TextStyle(color: Colors.red),
                    )),
                Text(
                  "Full Name",
                  style: TextStyle(
                      color: Colors.blue.shade900,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Super Admin",
                  style: TextStyle(fontSize: 10, color: Colors.black45),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignIn()),
                      );
                    },
                    child: const Text(
                      "Sign Out",
                      style: TextStyle(color: Colors.red),
                    ))
              ],
            ),
            text("Full Name", "Name"),
            text("abc@gmail.com", "Email"),
            text("9800000000", "Mobile No."),
            text("Kathmandu, Nepal", "Address"),
            text("....", "Password"),
            text("...", "Confirm Password"),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue.shade900,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Dashboard()),
                    );
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
            )
          ],
        )));
  }
}
