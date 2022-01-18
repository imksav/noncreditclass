import 'package:flutter/material.dart';

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
    return Text("Fake");
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
