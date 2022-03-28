import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jbtailors/pages/dashboard.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text(""),
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: Row(
          children: [
            const Text(""),
            const SizedBox(
              height: 150,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 80,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(15)),
                  child: TextFormField(
                    // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    // keyboardType: TextInputType.number,
                    showCursor: true,
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                    decoration: const InputDecoration(
                        icon: Icon(
                          Icons.search,
                          size: 40,
                          color: Colors.red,
                        ),
                        hintText: "search",
                        hintStyle:
                            TextStyle(color: Colors.black38, fontSize: 20),
                        border: InputBorder.none),
                    textInputAction: TextInputAction.done,
                    cursorColor: Colors.red,
                  ),
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("cancel"))
          ],
        ),
      ),
    );
  }
}
