import 'dart:convert';
import 'package:flutter_app/details.dart';

import 'Post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Post> post;

  Future<Post> fetchPost() async {
    var response = await http
        .get('https://api.github.com/search/repositories?q=language:python');
    if (response.statusCode == 200) {
      return Post.fromJson(json.decode(response.body));
    } else {
      throw Exception('failed to load');
    }
  }

  @override
  void initState() {
    super.initState();
    post = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GitHub Repositories"),

      ),
      body: FutureBuilder<Post>(
          future: post,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Text("Loading");
            }
            return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return _buildRepoItem(
                      context, snapshot.data.items[index], index);
                },
                itemCount: snapshot.data.items.length);
          }),
    );
  }
}

Widget _buildRepoItem(BuildContext context, var data, int index) {
  return Padding(
    padding: const EdgeInsets.all(25.0),
    child: InkWell(
      onTap: () {
        String description = data['description'];
        String name = data['name'];
        String owner = data['owner']['login'];
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return details(name, owner, description);
        }));
      },
      child: Container(
        color: Colors.blue,
        height: MediaQuery.of(context).size.height / 10,
        child: Center(
            child: Text(
          data['name'],
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        )),
      ),
    ),
  );
}
