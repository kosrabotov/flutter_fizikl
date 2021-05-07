import "package:flutter/material.dart";
import 'package:test_request/newsBoxTest.dart';

class testListViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(100, (i) => "Item $i");
    return Scaffold(
      appBar: AppBar(
        title: Text("Test of listView"),
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context,index){
          return ListTile(

            title: Container(
                    child: NewsBox(
                        "LoremImpkjf ahlsas;dlkfja;sdl kfja;sdlkfj ;asldkfja;s dklfj;sdkfj; asdklfja;sdkf ja;dfksjf aakjdf",
                        index),
                  ),

          );
        //   if (index < 100) {
        //     // ignore: missing_return
        //     return
        //   }
        //   return Text("end");
        },
      ),
      );

  }
}
