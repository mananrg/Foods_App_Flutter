import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class SecondPage extends StatefulWidget {
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String dropdownValue = list.first;
  bool isContainerVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CarouselSlider(
            items: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Image.asset('asset/imageslider1.jpg'),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Image.asset('asset/imageslider2.jpg'),
              ),
            ],
            options: CarouselOptions(
              height: 380.0,
              aspectRatio: 16 / 9,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Big Mad Burger',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 16),
                  child: Text(
                    'Potato Bun, cheddar cheese, beef, cucumber, red onion, iceberg, lettuce, avocado, tomato',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Choose Addition \n \n',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: 'Required',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isContainerVisible = !isContainerVisible;
                          if (kDebugMode) {
                            print(isContainerVisible);
                          }
                        });
                      },
                      icon: isContainerVisible
                          ? const Icon(Icons.arrow_downward)
                          : const Icon(Icons.arrow_upward),
                    ),
                  ],
                ),
                Visibility(
                  visible: isContainerVisible,
                  child: SizedBox(
                    height: 200,
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: isContainerVisible
                              ? Container()
                              : Container(
                                  color: Colors.white,
                                  child: Column(
                                    children: const [],
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
