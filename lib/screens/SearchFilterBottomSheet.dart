import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SearchBottomSheetScreen extends StatefulWidget {
  @override
  _SearchBottomSheetState createState() => _SearchBottomSheetState();
}

class Category {
  String catName = "";
  bool isSelected = false;
  Category(this.catName, this.isSelected);
}

class _SearchBottomSheetState extends State<SearchBottomSheetScreen> {
  final Color _accentColor = const Color(0xFF272727);
  final Color _containerColor = const Color(0xFFF0F2F5);
  RangeValues _currentRangedValue = const RangeValues(20, 60);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .scaffoldBackgroundColor,
        elevation: 0,
        leading: Icon(Icons.menu, color: _accentColor),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Job Search",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: _accentColor),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: size.width - 115.0,
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "Search for jobs",
                                hintStyle: TextStyle(
                                    fontSize: 15.0,
                                    color: _accentColor,
                                    fontWeight: FontWeight.normal),
                                contentPadding: const EdgeInsets.all(15.0),
                                border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0)))),
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(25.0))),
                                builder: (context) {
                                  return StatefulBuilder(
                                      builder: (context, StateSetter setState) {
                                        return Container(
                                          width: size.width,
                                          height: size.height,
                                          child: Padding(
                                            padding: EdgeInsets.all(20.0),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Center(
                                                  child: Container(
                                                    width: 70.0,
                                                    height: 5.0,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                10.0)),
                                                        color: _accentColor),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 20.0,
                                                ),
                                                const Text(
                                                  "Category",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight
                                                          .bold,
                                                      color: Colors.black,
                                                      fontSize: 18.0),
                                                ),
                                                const SizedBox(
                                                  height: 15.0,
                                                ),

                                                Wrap(
                                                  spacing: 10.0,
                                                  runSpacing: 10.0,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {

                                                      },
                                                      child: Container(
                                                        padding: const EdgeInsets
                                                            .symmetric(
                                                            horizontal: 20.0,
                                                            vertical: 10.0),
                                                        decoration: BoxDecoration(
                                                            color: _accentColor,
                                                            borderRadius: const BorderRadius
                                                                .all(
                                                                Radius.circular(
                                                                    20.0))
                                                        ),
                                                        child: const Text(
                                                          "Android",
                                                          style: TextStyle(
                                                              fontWeight: FontWeight
                                                                  .normal,
                                                              color: Colors
                                                                  .white,
                                                              fontSize: 14.0
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {

                                                      },
                                                      child: Container(
                                                        padding: const EdgeInsets
                                                            .symmetric(
                                                            horizontal: 20.0,
                                                            vertical: 10.0),
                                                        decoration: BoxDecoration(
                                                            color: _accentColor,
                                                            borderRadius: const BorderRadius
                                                                .all(
                                                                Radius.circular(
                                                                    20.0))
                                                        ),
                                                        child: const Text(
                                                          "iOS",
                                                          style: TextStyle(
                                                              fontWeight: FontWeight
                                                                  .normal,
                                                              color: Colors
                                                                  .white,
                                                              fontSize: 14.0
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {

                                                      },
                                                      child: Container(
                                                        padding: const EdgeInsets
                                                            .symmetric(
                                                            horizontal: 20.0,
                                                            vertical: 10.0),
                                                        decoration: BoxDecoration(
                                                            color: _containerColor,
                                                            borderRadius: const BorderRadius
                                                                .all(
                                                                Radius.circular(
                                                                    20.0))
                                                        ),
                                                        child: const Text(
                                                          "FrontEnd",
                                                          style: TextStyle(
                                                              fontWeight: FontWeight
                                                                  .normal,
                                                              color: Colors
                                                                  .black,
                                                              fontSize: 14.0
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {

                                                      },
                                                      child: Container(
                                                        padding: const EdgeInsets
                                                            .symmetric(
                                                            horizontal: 20.0,
                                                            vertical: 10.0),
                                                        decoration: BoxDecoration(
                                                            color: _containerColor,
                                                            borderRadius: const BorderRadius
                                                                .all(
                                                                Radius.circular(
                                                                    20.0))
                                                        ),
                                                        child: const Text(
                                                          "Backend",
                                                          style: TextStyle(
                                                              fontWeight: FontWeight
                                                                  .normal,
                                                              color: Colors
                                                                  .black,
                                                              fontSize: 14.0
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {

                                                      },
                                                      child: Container(
                                                        padding: const EdgeInsets
                                                            .symmetric(
                                                            horizontal: 20.0,
                                                            vertical: 10.0),
                                                        decoration: BoxDecoration(
                                                            color: _containerColor,
                                                            borderRadius: const BorderRadius
                                                                .all(
                                                                Radius.circular(
                                                                    20.0))
                                                        ),
                                                        child: const Text(
                                                          "UI/UX Design",
                                                          style: TextStyle(
                                                              fontWeight: FontWeight
                                                                  .normal,
                                                              color: Colors
                                                                  .black,
                                                              fontSize: 14.0
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {

                                                      },
                                                      child: Container(
                                                        padding: const EdgeInsets
                                                            .symmetric(
                                                            horizontal: 20.0,
                                                            vertical: 10.0),
                                                        decoration: BoxDecoration(
                                                            color: _containerColor,
                                                            borderRadius: const BorderRadius
                                                                .all(
                                                                Radius.circular(
                                                                    20.0))
                                                        ),
                                                        child: const Text(
                                                          "Networking",
                                                          style: TextStyle(
                                                              fontWeight: FontWeight
                                                                  .normal,
                                                              color: Colors
                                                                  .black,
                                                              fontSize: 14.0
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 20.0,),
                                                const Text(
                                                  "Salary Range",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight
                                                          .bold,
                                                      color: Colors.black,
                                                      fontSize: 18.0),
                                                ),
                                                const SizedBox(height: 20.0),
                                                RangeSlider(
                                                    values: _currentRangedValue,
                                                    max: 100,
                                                    labels: RangeLabels(_currentRangedValue.start.toString(), _currentRangedValue.end.toString()),
                                                    activeColor: _accentColor,
                                                    inactiveColor: _containerColor,
                                                    divisions: 10,
                                                    onChanged: (RangeValues value) {
                                                      setState(() {
                                                        _currentRangedValue = value;
                                                      }
                                                      );
                                                    }),
                                                const SizedBox(height: 0.0,),
                                                const Text(
                                                  "Level",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight
                                                          .bold,
                                                      color: Colors.black,
                                                      fontSize: 18.0),
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Radio(
                                                          value: 0,
                                                          groupValue: 0,
                                                          activeColor: _accentColor,
                                                          onChanged: (value) {},
                                                        ),
                                                        Text('Entry')
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Radio(
                                                          value: 1,
                                                          groupValue: 0,
                                                          onChanged: (value) {},
                                                        ),
                                                        Text('Mid')
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Radio(
                                                          value: 2,
                                                          groupValue: 0,
                                                          onChanged: (value) {},
                                                        ),
                                                        Text('Staff')
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Radio(
                                                          value: 3,
                                                          groupValue: 0,
                                                          onChanged: (value) {},
                                                        ),
                                                        Text('Senior')
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Radio(
                                                          value: 4,
                                                          groupValue: 0,
                                                          onChanged: (value) {},
                                                        ),
                                                        Text('Manager')
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                });
                          },
                          child: Container(
                            width: 45.0,
                            height: 45.0,
                            decoration: BoxDecoration(
                                color: _accentColor,
                                borderRadius:
                                const BorderRadius.all(Radius.circular(10.0))),
                            child: const Center(
                              child: Icon(
                                Icons.filter_list,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
