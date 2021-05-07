import 'package:flutter/material.dart';

class loginScreen extends StatelessWidget {
  String _id;
  loginScreen({String id}):_id = id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Второе окно с id $_id"),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFF0095DE)


        ),
        child: Center(

          child: Column(

            children: [
              TextButton(onPressed: (){Navigator.pop(context);},
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black,width: 10),
                      boxShadow: [BoxShadow(
                        offset: Offset(10,10),
                        color: Color(0xFF9CBD5E),
                        spreadRadius: 2,
                        blurRadius: 15,

                      )],
                    ),
                      child: Text(
                          "Сережа беги домой"))
                  )
            ],
          ),
        ),
      ),
    );
  }
}
