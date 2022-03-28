import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jbtailors/pages/constant.dart';

class Create extends StatefulWidget {
  const Create({Key? key}) : super(key: key);

  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: false,
        backgroundColor: Colors.red,
        title: const Text("Create Order"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Order Id : #12345",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Divider(
                thickness: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Customer",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text("Hemlock Ruchal",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Contact", style: TextStyle(fontSize: 15)),
                      Text("98XXXXXXXX",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              const Divider(thickness: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Address",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text("Kathmandu, Nepal",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Items Name", style: TextStyle(fontSize: 15)),
                      Text("Clothes",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              const Divider(
                thickness: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Total Cost",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text("Rs. 5000",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Advance", style: TextStyle(fontSize: 15)),
                      Text("Rs. 5000",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Deadlines", style: TextStyle(fontSize: 15)),
                      Text("03/03/2022",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              const Divider(
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Measurement 1",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        length(),
                        length(),
                        length(),
                        length(),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          "Measurement 2",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        length(),
                        length(),
                        length(),
                        length(),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Center(
                child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () {},
                        child: const Text(
                          "Log in",
                          style: ktextstyle,
                        ))),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget length() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Text("Length:", style: TextStyle(fontSize: 15)),
          SizedBox(
            width: 80,
            height: 10,
            child: TextFormField(
              textInputAction: TextInputAction.done,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: const TextInputType.numberWithOptions(
                  signed: true, decimal: true),
              decoration: const InputDecoration(),
            ),
          )
        ],
      ),
    );
  }
}
