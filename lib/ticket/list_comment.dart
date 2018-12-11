import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class CommentItem extends StatefulWidget {
  DataSnapshot dataSnapshot ;
  Animation animation ;
  CommentItem({Key key, this.dataSnapshot, this.animation}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CommentItemState();
  }
}
class CommentItemState extends State<CommentItem> {
  _commentItem(DataSnapshot dataSnapshot, Animation animation) {
    return Row(
      children: <Widget>[
        Container(
            margin: const EdgeInsets.only(right: 5.0),
            child: CircleAvatar(
              backgroundImage:
                  NetworkImage(dataSnapshot.value['senderPhotoUrl']),
            )),
            Container(
                  // color: Colors.blue,
                  child: Text(
                    dataSnapshot.value['content'],
                    style: TextStyle(color: Colors.white),
                  ),
                  // padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                  width: 200.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.blueAccent[100]),
                  margin: EdgeInsets.all(5.0),
                ),
                
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _commentItem(widget.dataSnapshot, widget.animation);
  }
}
