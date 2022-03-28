import 'package:flutter/material.dart';
import 'package:jbtailors/main.dart';
import 'package:jbtailors/pages/constant.dart';
import 'package:jbtailors/pages/createorder.dart';
import 'package:jbtailors/pages/inbox.dart';
import 'package:jbtailors/pages/notification.dart';
import 'package:jbtailors/pages/order.dart';
import 'package:jbtailors/pages/profile.dart';
import 'package:jbtailors/pages/search.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool isSwitched = false;
  List<_SalesData> data = [
    _SalesData('Jan', 10000),
    _SalesData('Feb', 20000),
    _SalesData('Mar', 30000),
    _SalesData('Apr', 40000),
    _SalesData('May', 50000),
    _SalesData('Jun', 60000),
  ];
  @override
  Widget build(BuildContext context) {
    print("object");
    return Scaffold(
      drawer: Drawer(
          child: Column(
        children: [
          AppBar(
            title: const Text("Drawer"),
            backgroundColor: Colors.red,
            automaticallyImplyLeading: false,
            centerTitle: false,
            actions: [
              Switch(
                  activeTrackColor: Colors.white,
                  activeColor: Colors.white,
                  inactiveTrackColor: Colors.black,
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                      MyApp.themeNotifier.value =
                          MyApp.themeNotifier.value == ThemeMode.light
                              ? ThemeMode.dark
                              : ThemeMode.light;
                    });
                  })
            ],
          ),
          Container(
            height: 50,
            width: double.infinity,
            color: Colors.black45,
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Create()),
                  );
                },
                child: const Text(
                  "Create Order",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
          ),
          const Divider(),
          Container(
            height: 50,
            width: double.infinity,
            color: Colors.black45,
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Inbox()),
                  );
                },
                child: const Text(
                  "Inbox",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
          ),
          const Divider(),
          Container(
            height: 50,
            width: double.infinity,
            color: Colors.black45,
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Noti()),
                  );
                },
                child: const Text(
                  "Notification",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
          )
        ],
      )),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        title: const Text("User Name"),
        centerTitle: false,
        actions: [
          Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Profile()),
                  );
                },
                child: const CircleAvatar(
                  backgroundImage: AssetImage("images/Login.jpg"),
                  radius: 40,
                ),
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(1)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Search()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.white),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Search",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black26),
                              ),
                            ),
                            Icon(
                              Icons.search,
                              size: 30,
                              color: Colors.red,
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(color: Colors.black12),
                child: Row(
                  children: [
                    Expanded(
                      child: balance("Total Profit", Icons.arrow_upward,
                          Colors.green, Colors.green.shade100),
                    ),
                    Expanded(
                      child: balance("Total Expenses", Icons.arrow_downward,
                          Colors.red, Colors.red.shade100),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Dashboard",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black87),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      //Initialize the spark charts widget
                      child: SfSparkLineChart.custom(
                        //Enable the trackball
                        trackball: const SparkChartTrackball(
                            activationMode: SparkChartActivationMode.tap),
                        //Enable marker
                        marker: const SparkChartMarker(
                            displayMode: SparkChartMarkerDisplayMode.all),
                        //Enable data label
                        labelDisplayMode: SparkChartLabelDisplayMode.all,
                        xValueMapper: (int index) => data[index].year,
                        yValueMapper: (int index) => data[index].sales,
                        dataCount: 5,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Resent Order",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black87),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Order()),
                          );
                        },
                        child: const Text(
                          "See More",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black87),
                        ),
                      ),
                    ),
                  ),
                  order(Colors.red, "Pending"),
                  const SizedBox(
                    height: 20,
                  ),
                  order(Colors.green, "Assign"),
                  const SizedBox(
                    height: 20,
                  ),
                  order(Colors.red, "Pending"),
                  const SizedBox(
                    height: 20,
                  ),
                  order(Colors.green, "Assign"),
                  const SizedBox(
                    height: 20,
                  ),
                  order(Colors.red, "Pending")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget order(Color ap, String pa) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            context: context,
            builder: (BuildContext context) {
              return SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 750,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            const Text(
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
                      const Divider(
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
                ),
              );
            });
      },
      child: Column(
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
                    decoration: BoxDecoration(
                        color: ap,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20))),
                    child: Center(
                      child: Text(
                        pa,
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
      ),
    );
  }

  Widget balance(String ep, IconData arrow, Color rg, Color cv) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
          decoration: const BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(ep), const Icon(Icons.more_horiz)],
              ),
              const Text(
                "Rs. 00,000.00",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: cv,
                    child: Icon(
                      arrow,
                      color: rg,
                    ),
                  ),
                  const Text(
                    "34.23%",
                    style: TextStyle(color: Colors.green),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text("Months")
                ],
              )
            ],
          )),
    );
  }

  Widget btnsh(String title, String name) {
    return Padding(
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
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
