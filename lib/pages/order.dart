import 'package:flutter/material.dart';
import 'package:jbtailors/pages/constant.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  _OrderState createState() => _OrderState();
}

Widget orders(Color rg, String rgt) {
  return Column(
    children: [
      Container(
        height: 30,
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.black12),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Order : #123456",
                style: TextStyle(fontSize: 15, color: Colors.black87),
              ),
              Container(
                width: 80,
                height: 30,
                decoration: BoxDecoration(
                    color: rg,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20))),
                child: Center(
                  child: Text(
                    rgt,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 10),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: const [
              Text(
                "10:00",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 50,
              ),
              Text(
                "AM",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Casual Suit- Customer Name",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "Kathmandu, Nepal",
              ),
            ],
          ),
          Column(
            children: const [
              Text(""),
              Text(
                "Rs. 5000",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      )
    ],
  );
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.red,
        title: const Text(
          "Orders",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
          child: InkWell(
        onTap: () {
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              context: context,
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: 750,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Text(
                                "Order Id",
                                style: ktextstyle,
                              ),
                              Text("#123456789",
                                  style: ktextstyle.copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal))
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      btnsh("Customer Name:", "Hemlock Ruchal"),
                      btnsh("Date: ", "2020/03/02 06:30PM"),
                      btnsh("Deadline: ", "2020/05/03"),
                      btnsh("Location", "Kantipath, Kathmandu"),
                      btnsh("Price: ", "Rs. 5000"),
                      btnsh("Advance: ", "Rs. 2000"),
                      btnsh("Status: ", "Pending"),
                      Container(
                          alignment: Alignment.topRight,
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "See Measurement",
                                style: ktextstyle.copyWith(color: Colors.black),
                              )))
                    ],
                  ),
                );
              });
        },
        child: Column(
          children: [
            orders(Colors.red, "Pending"),
            const SizedBox(height: 20),
            orders(Colors.green, "Assign"),
            const SizedBox(height: 20),
            orders(Colors.red, "Pending"),
            const SizedBox(height: 20),
            orders(Colors.green, "Assign"),
            const SizedBox(height: 20),
            orders(Colors.red, "Pending"),
            const SizedBox(height: 20),
            orders(Colors.green, "Assign"),
            const SizedBox(height: 20),
            orders(Colors.red, "Pending"),
            const SizedBox(height: 20),
            orders(Colors.green, "Assign"),
            const SizedBox(height: 20),
          ],
        ),
      )),
    );
  }

  Widget btnsh(String title, String name) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: ktextstyle,
            ),
            Text(
              name,
              style: ktextstyle.copyWith(fontWeight: FontWeight.normal),
            )
          ],
        ),
      ),
    );
  }
}
