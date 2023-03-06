import 'package:flutter/material.dart';

class Transaction {
  const Transaction(
      {required this.title,
      required this.amount,
      required this.date,
      required this.time,
      required this.image});

  final String title;
  final String amount;
  final String date;
  final String time;
  final Image image;
}

class StackWidget extends StatefulWidget {
  const StackWidget({super.key});

  @override
  State<StatefulWidget> createState() => _StackWidgetState();
}

class _StackWidgetState extends State<StackWidget> {
  late List<Transaction> transtionList;

  @override
  void initState() {
    super.initState();
    transtionList = const [
      Transaction(
          title: "Food For Lunch",
          amount: "₹ 120.00",
          date: "13 Feb 2023",
          time: "02.00 PM",
          image: Image(
            image: AssetImage("images/sandwich.png"),
          )),
      Transaction(
          title: "Grab Taxi",
          amount: "₹ 620.00",
          date: "11 Feb 2023",
          time: "05.00 PM",
          image: Image(
            image: AssetImage("images/taxi.png"),
          )),
      Transaction(
          title: "Paypal Payment",
          amount: "₹ 12000.00",
          date: "12 Feb 2023",
          time: "12.00 AM",
          image: Image(
            image: AssetImage("images/paypal.png"),
          )),
      Transaction(
          title: "Payment For Shopping",
          amount: "₹ 1200.00",
          date: "13 Feb 2023",
          time: "02.00 PM",
          image: Image(
            image: AssetImage("images/shopping-bag.png"),
          )),
      Transaction(
          title: "EMI Transaction",
          amount: "₹ 1000.00",
          date: "13 Feb 2023",
          time: "02.00 PM",
          image: Image(
            image: AssetImage("images/credit-card.png"),
          )),
      Transaction(
          title: "Food For Lunch",
          amount: "₹ 120.00",
          date: "13 Feb 2023",
          time: "02.00 PM",
          image: Image(
            image: AssetImage("images/profile.png"),
          )),
      Transaction(
          title: "Food For Lunch",
          amount: "₹ 120.00",
          date: "13 Feb 2023",
          time: "02.00 PM",
          image: Image(
            image: AssetImage("images/profile.png"),
          )),
      Transaction(
          title: "Food For Lunch",
          amount: "₹ 120.00",
          date: "13 Feb 2023",
          time: "02.00 PM",
          image: Image(
            image: AssetImage("images/profile.png"),
          )),
      Transaction(
          title: "Food For Lunch",
          amount: "₹ 120.00",
          date: "13 Feb 2023",
          time: "02.00 PM",
          image: Image(
            image: AssetImage("images/profile.png"),
          )),
      Transaction(
          title: "Food For Lunch",
          amount: "₹ 120.00",
          date: "13 Feb 2023",
          time: "02.00 PM",
          image: Image(
            image: AssetImage("images/profile.png"),
          )),
      Transaction(
          title: "Food For Lunch",
          amount: "₹ 120.00",
          date: "13 Feb 2023",
          time: "02.00 PM",
          image: Image(
            image: AssetImage("images/profile.png"),
          )),
      Transaction(
          title: "Food For Lunch",
          amount: "₹ 120.00",
          date: "13 Feb 2023",
          time: "02.00 PM",
          image: Image(
            image: AssetImage("images/profile.png"),
          )),
      Transaction(
          title: "Food For Lunch",
          amount: "₹ 120.00",
          date: "13 Feb 2023",
          time: "02.00 PM",
          image: Image(
            image: AssetImage("images/profile.png"),
          )),
      Transaction(
          title: "Food For Lunch",
          amount: "₹ 120.00",
          date: "13 Feb 2023",
          time: "02.00 PM",
          image: Image(
            image: AssetImage("images/profile.png"),
          )),
      Transaction(
          title: "Food For Lunch",
          amount: "₹ 120.00",
          date: "13 Feb 2023",
          time: "02.00 PM",
          image: Image(
            image: AssetImage("images/profile.png"),
          )),
      Transaction(
          title: "Food For Lunch",
          amount: "₹ 120.00",
          date: "13 Feb 2023",
          time: "02.00 PM",
          image: Image(
            image: AssetImage("images/profile.png"),
          )),
      Transaction(
          title: "Food For Lunch",
          amount: "₹ 120.00",
          date: "13 Feb 2023",
          time: "02.00 PM",
          image: Image(
            image: AssetImage("images/profile.png"),
          )),
      Transaction(
          title: "Food For Lunch",
          amount: "₹ 120.00",
          date: "13 Feb 2023",
          time: "02.00 PM",
          image: Image(
            image: AssetImage("images/profile.png"),
          )),
      Transaction(
          title: "Food For Lunch",
          amount: "₹ 120.00",
          date: "13 Feb 2023",
          time: "02.00 PM",
          image: Image(
            image: AssetImage("images/profile.png"),
          )),
      Transaction(
          title: "Food For Lunch",
          amount: "₹ 120.00",
          date: "13 Feb 2023",
          time: "02.00 PM",
          image: Image(
            image: AssetImage("images/profile.png"),
          )),
      Transaction(
          title: "Food For Lunch",
          amount: "₹ 120.00",
          date: "13 Feb 2023",
          time: "02.00 PM",
          image: Image(
            image: AssetImage("images/profile.png"),
          )),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Stack(children: [
            Container(
              height: 300,
              width: size.width,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.8),
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40))),
              child: Padding(
                padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Good Morning,",
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 18)),
                        const SizedBox(height: 10),
                        const Text("Vikas Suthar",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 24))
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10, right: 10),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        maxRadius: 30,
                        child: CircleAvatar(
                          backgroundColor: Colors.blue,
                          maxRadius: 28,
                          child: Image(
                            image: AssetImage("images/profile.png"),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]),
          Stack(
            children: [
              Positioned(
                  top: 170,
                  left: 60,
                  child: Container(
                    height: 200,
                    width: 290,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade600,
                      gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.topRight,
                          colors: [
                            Colors.black,
                            Colors.orange,
                            Colors.yellow,
                            Colors.deepOrange,
                            Colors.red,
                          ]),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  )),
              Positioned(
                  top: 185,
                  left: 45,
                  child: Container(
                    height: 200,
                    width: 320,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade700,
                      gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.topRight,
                          colors: [
                            Colors.orange,
                            Colors.deepOrange,
                            Colors.black,
                            Colors.red,
                            Colors.yellow
                          ]),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  )),
              Positioned(
                  top: 200,
                  left: 30,
                  child: Container(
                    height: 200,
                    width: 350,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      gradient: const RadialGradient(colors: [
                        Colors.orange,
                        Colors.deepOrange,
                        Colors.orangeAccent
                      ]),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(children: [
                      Positioned(
                        top: -50,
                        left: 200,
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.2),
                                  width: 30)),
                        ),
                      ),
                      Positioned(
                        right: -50,
                        top: 115,
                        child: Container(
                          width: 120,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(60),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.2),
                                  width: 100)),
                        ),
                      ),
                      Positioned(
                        bottom: -50,
                        left: 100,
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.2),
                                  width: 30)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "VIKAS SUTHAR",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text("**** **** ****",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                        color: Colors.black)),
                                Text(" 1234",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                        color: Colors.black)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text("Balance",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: Colors.black)),
                                    Text("₹ 12,43,332",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                            color: Colors.black)),
                                  ],
                                ),
                                const Image(
                                    width: 35,
                                    height: 35,
                                    image: AssetImage("images/mastercard.png"))
                              ],
                            )
                          ],
                        ),
                      ),
                    ]),
                  ))
            ],
          ),
          Positioned(
            top: 430,
            child: Container(
              padding: const EdgeInsets.all(20),
              width: size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Recent Transactions",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w700),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          "View all",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: transtionList.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.grey.shade300,
                                    child: transtionList[index].image,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        transtionList[index].title,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            transtionList[index].time,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w300),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            transtionList[index].date,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                transtionList[index].amount,
                                style: const TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider()
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
