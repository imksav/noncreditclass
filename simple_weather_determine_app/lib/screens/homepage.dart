import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final String url = "https://swapi.dev/api/people/5";
  // late List data;

  // @override
  // void initState() {
  //   super.initState();
  //   this.getJsonData();
  // }

  // // var url = Uri.parse('https://swapi.dev/api/people/');

  // Future<String> getJsonData() async {
  //   var response =
  //       await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
  //   // print(response.body);
  //   setState(() {
  //     var convertDataToJson = JSON.decode(response.body);
  //     data = convertDataToJson['results'];
  //   });
  //   return "Sucess";
  // }

  final List data;
  getApiData() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
    var response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print("Success");
      final data = jsonDecode(response.body);
      print(data);
      // final text = data['title'];
      // print(text);
    } else {
      print("Oops, something went wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic),
              decoration: InputDecoration(
                  labelText: "Search",
                  labelStyle: TextStyle(
                      color: Colors.purple,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                  hintText: "Search here........",
                  hintStyle: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w300,
                      fontSize: 22.0),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 5.0,
                          color: Colors.blue,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(29.0),
                          topRight: Radius.circular(29.0),
                          bottomLeft: Radius.circular(29.0),
                          bottomRight: Radius.circular(29.0)))),
            ),
            SizedBox(height: 20.0),
            Container(
              child: Text(data[0]['title']),
            ),
            SizedBox(height: 20.0),
            Text(
              "City Name",
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            TextButton(
                onPressed: () {
                  // getJsonData();
                  getApiData();
                },
                child: Text("Call API")),
            Text(
              "Date and Time",
              style: TextStyle(
                  fontSize: 26.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.w300),
            ),
            SizedBox(height: 20.0),
            Image.asset("assets/images/sunny.jpg"),
            SizedBox(height: 20.0),
            Text(
              "24 Degree Celsius",
              style: TextStyle(
                  color: Colors.deepOrangeAccent,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(children: [Text("Sunrise"), Text("6:30 AM")]),
                Column(children: [Text("Sunrise"), Text("6:30 AM")]),
                Column(children: [Text("Sunrise"), Text("6:30 AM")]),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
