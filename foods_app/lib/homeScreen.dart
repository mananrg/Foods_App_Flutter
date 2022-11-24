import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Card(
            elevation: 8,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.add_location_sharp,
                    color: Color(0xFFFFA012),
                  ),
                  title: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "796 Cheese Avenue, ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        TextSpan(
                            text: "NYC", style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFF2F4F5),
                      hintText: "Search for food",
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8, top: 20, right: 8, bottom: 10),
                  child: Row(
                    children: const [
                      Text(
                        "Something New",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                VerticalCardWidget(),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8, top: 20, right: 8, bottom: 10),
                  child: Row(
                    children: const [
                      Text(
                        "Recommended",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                HorizontalCardWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class VerticalCardWidget extends StatelessWidget {
  VerticalCardWidget({
    Key? key,
  }) : super(key: key);
  List<String> names = ["Pasta", "Sushi", "Salads"];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: names.length,
          itemBuilder: (context, index) {
            return SizedBox(
              width: 170,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: const Color(0xFFFFA012),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 8, 0, 0),
                      child: Text(
                        names[index],
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class HorizontalCardWidget extends StatelessWidget {
  HorizontalCardWidget({
    Key? key,
  }) : super(key: key);
  List<String> names = ["Heaven's Food", "Grill Hell House", "Pasta's"];
  List<String> rating = [" 4.5  ", " 4.9  ", " 4.2  "];
  List<String> time = [" 25 - 30 mins ", " 40 - 50 mins ", " 30 - 40 mins "];
  List<List<String>> cards = [
    ["Steak", "Fish", "Experimental"],
    ["Grill", "Meat", "Spicy"],
    ["Roasted", "Chilli", "Experimental"]
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 220,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: names.length,
          itemBuilder: (context, index) {
            return Container(
              color: const Color(0xFFF2F4F5),
              width: 280,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          "asset/${index + 1}.jpg",
                          height: 120,
                          width: 280,
                          fit: BoxFit.fitWidth,
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(names[index]),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      const WidgetSpan(
                                        child: Icon(
                                          Icons.star,
                                          size: 14,
                                          color: Color(0xFFFFA012),
                                        ),
                                      ),
                                      TextSpan(
                                        text: rating[index],
                                        style: const TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const WidgetSpan(
                                        child: Icon(
                                          Icons.watch_later_outlined,
                                          size: 14,
                                          color: Color(0xFFFFA012),
                                        ),
                                      ),
                                      TextSpan(
                                        text: time[index],
                                        style: const TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const TextSpan(
                                        text: " \$\$\$  ",
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    cards[index][0],
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    cards[index][1],
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    cards[index][2],
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
