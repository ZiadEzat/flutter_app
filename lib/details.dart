import 'package:flutter/material.dart';

class details extends StatelessWidget {
  String owner;
  String description;
  String name;

  details(this.name, this.owner, this.description);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.name),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.blue,
            margin: EdgeInsets.all(0),
            child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top:16.0),
                  child: Text(
                    "Author: " + this.owner,
                    style: TextStyle(
                        color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                )),
          ),

          Container(
            color: Colors.blue,

            child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: Text(
                    "Description: " + this.description,
                    style: TextStyle(
                        color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                )),
          )

        ],
      ),
    );
  }
}
