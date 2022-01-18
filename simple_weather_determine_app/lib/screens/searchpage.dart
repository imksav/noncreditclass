import 'package:flutter/material.dart';
import 'package:simple_weather_determine_app/screens/homepage.dart';

class DataSearch extends SearchDelegate<String> {
  final cities = [
    "Butwal",
    "Tokha",
    "Biratnagar",
    "Kathmandu",
    "Janakpur",
    "Ilam",
    "Jhapa",
    "Basundhara",
    "Morang"
  ];
  final recentCities = ["Janakpur", "Ilam", "Jhapa", "Basundhara", "Butwal"];
  @override
  List<Widget> buildActions(BuildContext context) {
    // actions for app bar
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the app bar
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, "null");
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    String city = query;
    // show some result based on the selection
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.90,
          margin: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 20.0),
              Text(
                city,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              TextButton(onPressed: () {}, child: Text("Call API")),
              Text(
                "12:00 PM",
                style: TextStyle(
                    fontSize: 26.0,
                    color: Colors.blue,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(height: 20.0),
              Image.asset(
                "assets/images/sunny.jpg",
                height: 100.0,
              ),
              SizedBox(height: 20.0),
              Text(
                "19 Degree Celsius",
                style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(children: [Text("Sunrise"), Text("6:43 AM")]),
                  Column(children: [Text("Wind"), Text("13 EW")]),
                  Column(children: [Text("Sunset"), Text("5:38 PM")]),
                ],
              )
            ],
          ),
        )
        //child: Container(height: 200, width: 200, color: Colors.red),
        );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    final suggestionList = query.isEmpty
        ? recentCities
        : cities.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) => ListTile(
            onTap: () {
              showResults(context);
            },
            leading: Icon(Icons.location_city),
            title: RichText(
                text: TextSpan(
                    text: suggestionList[index].substring(0, query.length),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                    children: [
                  TextSpan(
                      text: suggestionList[index].substring(query.length),
                      style: TextStyle(color: Colors.grey)),
                ]))));
  }
}
