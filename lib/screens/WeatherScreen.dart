import 'dart:ui';

import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class WeatherData {
  late String day;
  late String date;
  late String maxTemp;
  late String minTemp;
  late AssetImage icons;
  late String raintChances;

  WeatherData(this.day, this.date, this.icons, this.maxTemp, this.minTemp,
      this.raintChances);
}

class _WeatherScreenState extends State<WeatherScreen> {
  late List<WeatherData> weatherData;

  @override
  initState() {
    super.initState();
    weatherData = <WeatherData>[
      WeatherData("Today,", "4 June", const AssetImage("images/light_rainsun.png"), "26", "16", "32%"),
      WeatherData("Sunday,", "5 June", const AssetImage("images/light_rainsun.png"), "27", "14", "32%"),
      WeatherData("Monday,", "6 June", const AssetImage("images/light_rain.png"), "29", "16", "35%"),
      WeatherData("Tuesday,", "7 June", const AssetImage("images/partly_cloudy.png"), "29", "13", "42%"),
      WeatherData("Wednesday,", "8 June", const AssetImage("images/rainy.png"), "24", "16", "80%"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Colors.black54,
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Cloudy and \nRainy",
                        style: TextStyle(
                            color: Colors.black,
                            wordSpacing: 5.0,
                            fontFamily: 'Sorts Mill Goudy',
                            fontWeight: FontWeight.bold,
                            fontSize: 35.0),
                      ),
                      Row(children: const [
                        Text(
                          "18",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 30.0),
                        ),
                        Text(
                          "o",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 30.0,
                              fontFeatures: [FontFeature.superscripts()]),
                        )
                      ]),
                    ],
                  ),
                  const Image(
                    image: AssetImage("images/weather.png"),
                    width: 100,
                    height: 100,
                    color: null,
                  ),
                ],
              ),
              const Text("Current Location: Bangalore, India", style:  TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontFamily: 'Sorts Mill Goudy', fontSize: 14.0),),
              const SizedBox(height: 10.0,),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: weatherData.length,
                  itemBuilder: (context, index) {
                    return nextFiveDayWeather(weatherData[index]);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget nextFiveDayWeather(WeatherData weatherData) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  weatherData.day,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(weatherData.date)
              ],
            ),
            Row(
              children: [
                Image(image: weatherData.icons,color: null,),
                const SizedBox(
                width: 20.0),
                Row(
                  children: [
                    Text(
                      weatherData.maxTemp,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "o",
                      style: TextStyle(fontFeatures: [FontFeature.superscripts()]),
                    )
                  ],
                ),
                const SizedBox(
                    width: 10.0),
                Row(
                  children: [
                    Text(weatherData.minTemp),
                    const Text(
                      "o",
                      style: TextStyle(fontFeatures: [FontFeature.superscripts()]),
                    )
                  ],
                ),
                const SizedBox(width: 20.0,),
                Text(weatherData.raintChances),
                const Icon(Icons.arrow_drop_down)
              ],
            )
          ],
        ),
      ),
    );
  }
}
