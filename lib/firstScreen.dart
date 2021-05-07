import 'package:flutter/material.dart';

class firstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Первое окно")
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Text("firstBlock"),
              Text('secondBlock'),
              TextButton(
                child: Text("i'm button"),
                onPressed: () {
                  Navigator.pushNamed(context, '/testListView');
                },
              ),
              Text('thirdBlock'),
            ],
          ),
        ),
      ),
    );

  }
}
