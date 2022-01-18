import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:simple_weather_determine_app/screens/searchpage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Map<String, dynamic>> _getUsers() async {
    var url = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=5728c4a08b1b4ea8b3695129221801&q=Butwal&aqi=no');

        
    var data = await http.get(url);
    var jsonData = json.decode(data.body);
    print(jsonData['location']['name']);
    print(jsonData);
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
                      child: CircularProgressIndicator(),
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
                                snapshot.data['location']['name'],
                                style: TextStyle(
                                  fontSize: 30.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                snapshot.data['location']['tz_id'],
                                style: TextStyle(
                                    fontSize: 26.0,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w300),
                              ),
                              Text(
                                snapshot.data['location']['country'],
                                style: TextStyle(
                                    fontSize: 26.0,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w300),
                              ),
                              Text(
                                snapshot.data['location']['localtime'],
                                style: TextStyle(
                                    fontSize: 26.0,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w300),
                              ),
                              SizedBox(height: 20.0),
                              Image.network(
                                "https:" +
                                    snapshot.data['current']['condition']
                                        ['icon'],
                                height: 250.0,
                                width: 250.0,
                              ),
                              SizedBox(height: 20.0),
                              SizedBox(height: 20.0),
                              Text(
                                snapshot.data['current']['temp_c'].toString() +
                                    " °C",
                                style: TextStyle(
                                    color: Colors.deepOrangeAccent,
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(height: 30.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(children: [
                                    Text("Sunrise",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold)),
                                    Text("6:43 AM",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold))
                                  ]),
                                  Column(children: [
                                    Text(
                                      "Wind",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                        snapshot.data['current']['wind_kph']
                                                .toString() +
                                            " " +
                                            snapshot.data['current']
                                                ['wind_dir'],
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold))
                                  ]),
                                  Column(children: [
                                    Text("Sunset",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold)),
                                    Text("5:38 PM",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold))
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
