import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsBox extends StatelessWidget {
  String _text;
  int _myIndex;

  NewsBox(String this._text, int this._myIndex);


  // const newsBox({Key key, this.newsText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Image(
          //   height: 100,
          //   width: 100,
          //
          // ),Text("Index = ${_myIndex}"),
          Text("${_myIndex}"),
          SizedBox(
            width: 50,
            height: 50,
          ),

          Expanded(
              child: Text(_text,
                softWrap: true,
                textAlign: TextAlign.justify,
              ),
            ),
            TextButton(onPressed: (){Navigator.pushNamed(context, '/second/$_myIndex');}, child: Text("$_myIndex PressMe")),
            // decoration: BoxDecoration(
            //   color: Colors.blue,
            //   shape: BoxShape.rectangle,
            //   boxShadow: [
            //     BoxShadow(
            //       offset: Offset(4.0,5.0),
            //       blurRadius: 100,
            //       color: Colors.green),]
            // ),
          // ),


          //Price
        ],
      ),
    );
  }
}

class NewsBoxStatefull extends StatefulWidget {
  @override
  _newsBoxStatefullState createState() => _newsBoxStatefullState();
}

class _newsBoxStatefullState extends State<NewsBoxStatefull> {
  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}

