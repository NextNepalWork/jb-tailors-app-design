import 'package:flutter/material.dart';

class Noti extends StatefulWidget {
  const Noti({Key? key}) : super(key: key);

  @override
  _NotiState createState() => _NotiState();
}

Widget notif(String notifi, String time) {
  return SizedBox(
    height: 50,
    width: double.infinity,
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Icon(
            Icons.circle,
            size: 10,
            color: Colors.red.shade900,
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notifi,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              time,
              style: const TextStyle(fontSize: 10),
            )
          ],
        )
      ],
    ),
  );
}

class _NotiState extends State<Noti> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue.shade900),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Notification",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.blue.shade900),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            notif("Your order has been picked up.", "Now"),
            const Divider(thickness: 1),
            notif("Your order has been delivered.", "1h ago"),
            const Divider(thickness: 1),
            notif("Your order has been picked up.", "3h ago"),
            const Divider(thickness: 1),
            notif("Your order has been picked up.", "12 Aug 2020"),
            const Divider(thickness: 1),
            notif("Your order has been picked up.", "15 Sept 2018"),
            const Divider(thickness: 1),
          ],
        ),
      ),
    );
  }
}
