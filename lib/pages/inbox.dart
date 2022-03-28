import 'package:flutter/material.dart';

class Inbox extends StatefulWidget {
  const Inbox({Key? key}) : super(key: key);

  @override
  _InboxState createState() => _InboxState();
}

Widget msg(String name, String day) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.circle,
                  size: 15,
                  color: Colors.red.shade900,
                ),
                const SizedBox(width: 10),
                Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              day,
              style: const TextStyle(fontSize: 10),
            )
          ],
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
            "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs."),
      )
    ],
  );
}

class _InboxState extends State<Inbox> {
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
          "Inbox",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.blue.shade900),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            msg("JB Tailors Promotions", "6th July"),
            const Divider(),
            msg("JB Tailors Promotions", "8th Aug"),
            const Divider(),
            msg("JB Tailors Promotions", "6th July"),
            const Divider(),
            msg("JB Tailors Promotions", "8th Aug"),
            const Divider(),
            msg("JB Tailors Promotions", "6th July"),
            const Divider(),
            msg("JB Tailors Promotions", "8th Aug"),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
