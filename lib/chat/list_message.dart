import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
// import 'package:cached_network_image/cached_network_image.dart';

var currentUserEmail;

class ChatMessageListItem extends StatelessWidget {
  final DataSnapshot messageSnapshot;
  final Animation animation;
  var currentUserEmail;

  ChatMessageListItem(
      {this.messageSnapshot, this.animation, this.currentUserEmail});

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: CurvedAnimation(parent: animation, curve: Curves.decelerate),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          children: currentUserEmail == messageSnapshot.value['email']
              ? getSentMessageLayout()
              : getReceivedMessageLayout(),
        ),
      ),
    );
  }

  List<Widget> getSentMessageLayout() {
    return <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          // messageSnapshot.value['type'] == 0
              // ? 
              Container(
                  child: Text(
                    messageSnapshot.value['text'],
                    style: TextStyle(color: Colors.white),
                  ),
                  // padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.blue),
                  margin: EdgeInsets.only(
                      right: 10.0,left: 20.0),
                )
              // : Container(
                  // child: Material(
                  //   child: CachedNetworkImage(
                  //     placeholder: Container(
                  //       child: CircularProgressIndicator(),
                  //       width: 200.0,
                  //       height: 200.0,
                  //       padding: EdgeInsets.all(70.0),
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.all(
                  //             Radius.circular(8.0),
                  //           ),
                  //           color: Colors.blue),
                  //     ),
                  //     errorWidget: Material(
                  //       child: Image.asset(
                  //         'images/img_not_available.jpeg',
                  //         width: 200.0,
                  //         height: 200.0,
                  //         fit: BoxFit.cover,
                  //       ),
                  //       borderRadius: BorderRadius.all(
                  //         Radius.circular(8.0),
                  //       ),
                  //       clipBehavior: Clip.hardEdge,
                  //     ),
                  //     imageUrl: messageSnapshot.value['text'],
                  //     width: 200.0,
                  //     height: 200.0,
                  //     fit: BoxFit.cover,
                  //   ),
                  //   borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  //   clipBehavior: Clip.hardEdge,
                  // ),
                  // margin: EdgeInsets.only(right: 10.0),
                  // )
        ],
      )
    ];
  }

  List<Widget> getReceivedMessageLayout() {
    return <Widget>[
      // Expand
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              margin: const EdgeInsets.only(right: 5.0),
              child: CircleAvatar(
                backgroundImage:
                    NetworkImage(messageSnapshot.value['senderPhotoUrl']),
              )),
          // messageSnapshot.value['type'] == 0
              // ?
               Container(
                  //  color: Colors.blue,
                  child: Text(
                    messageSnapshot.value['text'],
                    style: TextStyle(color: Colors.white),
                  ),
                  // padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                  // width: 200.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.blue),
                  margin: EdgeInsets.only(left: 10.0,right: 20.0),
                )
              // : Container(
                  // child: Material(
                  //   child: CachedNetworkImage(
                  //     placeholder: Container(
                  //       child: CircularProgressIndicator(),
                  //       width: 200.0,
                  //       height: 200.0,
                  //       padding: EdgeInsets.all(70.0),
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.all(
                  //             Radius.circular(8.0),
                  //           ),
                  //           color: Colors.blue),
                  //     ),
                  //     errorWidget: Material(
                  //       child: Image.asset(
                  //         'images/img_not_available.jpeg',
                  //         width: 200.0,
                  //         height: 200.0,
                  //         fit: BoxFit.cover,
                  //       ),
                  //       borderRadius: BorderRadius.all(
                  //         Radius.circular(8.0),
                  //       ),
                  //       clipBehavior: Clip.hardEdge,
                  //     ),
                  //     imageUrl: messageSnapshot.value['text'],
                  //     width: 200.0,
                  //     height: 200.0,
                  //     fit: BoxFit.cover,
                  //   ),
                  //   borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  //   clipBehavior: Clip.hardEdge,
                  // ),
                  // margin: EdgeInsets.only(right: 10.0),
                  // )
        ],
      ),
    ];
  }
}
