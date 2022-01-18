import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:simple_weather_determine_app/models/user.dart';
import 'package:simple_weather_determine_app/screens/searchpage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<User>> _getUsers() async {
    // var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var url = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=5728c4a08b1b4ea8b3695129221801&q=Butwal&aqi=no');
    var data = await http.get(url);
    var jsonData = json.decode(data.body);
    print(jsonData);
    List<User> users = [];
    for (var u in jsonData) {
      User user = User(u['current']['condition']['code'],
          u['current']['is_day'], u['location']['name'], u['location']['lat']);
      users.add(user);
    }
    print(users.length);
    setState(() {
      _getUsers();
    });
    return jsonData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: Container(
          child: FutureBuilder(
              future: _getUsers(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  print(snapshot.data);
                  return Container(
                    child: Center(
                      child: Text("Loading........"),
                    ),
                  );
                }
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.90,
                          margin: const EdgeInsets.symmetric(
                              vertical: 50.0, horizontal: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(height: 20.0),
                              Text(
                                snapshot.data[index].title,
                                style: TextStyle(
                                  fontSize: 30.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 20.0),
                              TextButton(
                                  onPressed: () {
                                    _getUsers();
                                  },
                                  child: Text("Call API")),
                              Text(
                                snapshot.data['loaction']['name'],
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(children: [
                                    Text("Sunrise"),
                                    Text("6:43 AM")
                                  ]),
                                  Column(
                                      children: [Text("Wind"), Text("13 EW")]),
                                  Column(children: [
                                    Text("Sunset"),
                                    Text("5:38 PM")
                                  ]),
                                ],
                              )
                            ],
                          ),
                        )
                        //child: Container(height: 200, width: 200, color: Colors.red),
                        );
                  },
                );
              })),
    );
  }
}
