import 'package:flutter/material.dart';

class Staff extends StatefulWidget {
  const Staff({Key? key}) : super(key: key);

  @override
  _StaffState createState() => _StaffState();
}

class _StaffState extends State<Staff> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.red,
        leading: const Icon(Icons.arrow_back),
        title: const Text(
          "Staff",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: const Center(
        child: Text(""),
      ),
    );
  }
}
