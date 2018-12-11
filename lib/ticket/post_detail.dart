import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:stdio/ticket/comment_onpress.dart';
import 'package:stdio/ticket/list_comment.dart';

class PostDetail extends StatefulWidget {
  String groupName;
  String groupId;
  DataSnapshot dataSnapshot;
  Animation animation;
  PostDetail(
      {Key key,
      this.dataSnapshot,
      this.animation,
      this.groupName,
      this.groupId})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PostDetailState();
  }
}

class PostDetailState extends State<PostDetail> {
  final TextEditingController _textEditingController =
      new TextEditingController();
  Comment postComment = Comment();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.groupName),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        // body: Container(
        //   margin: EdgeInsets.all(10.0),
        //   child: Column(
        //     children: <Widget>[
        //       Row(
        //         children: <Widget>[
        //           Container(
        //               margin: const EdgeInsets.only(right: 5.0),
        //               child: CircleAvatar(
        //                 backgroundImage: NetworkImage(
        //                     widget.dataSnapshot.value['senderPhotoUrl']),
        //               )),
        //           Container(
        //             // color: Colors.blue,
        //             child: Text(
        //               widget.dataSnapshot.value['senderName'],
        //               style: TextStyle(color: Colors.black),
        //             ),
        //             padding: EdgeInsets.fromLTRB(5.0, 10.0, 15.0, 10.0),
        //             width: 200.0,
        //             // decoration: BoxDecoration(
        //             //     borderRadius: BorderRadius.circular(8.0),
        //             //     color: Colors.blue),
        //             margin: EdgeInsets.only(left: 10.0),
        //           ),
        //         ],
        //       ),
        //       Container(
        //         margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.start,
        //           children: <Widget>[
        //             Container(
        //               child: Text('''${widget.dataSnapshot.value['content']}'''),
        //             ),
        //           ],
        //         ),
        //       ),
        //       // ListComment(groupId: widget.groupId,postId: widget.dataSnapshot.key),
        //       Container(
        //         margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
        //         child: Row(
        //           children: <Widget>[
        //             new Flexible(
        //               child: new TextField(
        //                 controller: _textEditingController,
        //                 decoration: new InputDecoration(
        //                   fillColor: Colors.blue,
        //                   contentPadding: EdgeInsets.all(5.0),
        //                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(6.0),borderSide: BorderSide(color: Colors.blue)),
        //                     hintText: "Type your comment..."),
        //               ),
        //             ),
        //             new Container(
        //                 margin: const EdgeInsets.symmetric(horizontal: 4.0),
        //                 child: IconButton(
        //                     icon: new Icon(Icons.send),
        //                     onPressed: () {
        //                       postComment.onComment(
        //                           widget.groupId,
        //                           widget.dataSnapshot.key,
        //                           _textEditingController.text);
        //                       _textEditingController.clear();
        //                     })),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        body: Card(
                  child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                      margin: const EdgeInsets.only(right: 5.0),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            widget.dataSnapshot.value['senderPhotoUrl']),
                      )),
                  Container(
                    // color: Colors.blue,
                    child: Text(
                      '${widget.dataSnapshot.value['senderName']}\n${widget.dataSnapshot.value['timePost']}',
                      style: TextStyle(color: Colors.black),
                    ),
                    padding: EdgeInsets.fromLTRB(5.0, 10.0, 15.0, 10.0),
                    width: 200.0,
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(8.0),
                    //     color: Colors.blue),
                    margin: EdgeInsets.only(left: 10.0),
                  ),
                ],
              ),
              Divider(
                 height: 10.0,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text('''${widget.dataSnapshot.value['content']}'''),
                    ),
                  ],
                ),
              ),
              Container(
                height: 30.0,
              ),
              Divider(
                height: 10.0,
              ),
              Container(
                height: 20.0,
              ),
              new Flexible(
                child: new FirebaseAnimatedList(
                  query: FirebaseDatabase.instance
                      .reference()
                      .child('Group')
                      .child('${widget.groupId}')
                      .child('post')
                      .child(widget.dataSnapshot.key)
                      .child('commment'),
                  padding: const EdgeInsets.all(8.0),
                  reverse: false,
                  sort: (a, b) => b.key.compareTo(a.key),
                  itemBuilder: (_, DataSnapshot dataSnapshotcm,
                      Animation<double> animation, int index) {
                    return Container(child: CommentItem(
                        dataSnapshot: dataSnapshotcm, animation: animation),
                        margin: EdgeInsets.only(left: 10.0,top: 5.0),);
                  },
                ),
              ),
              new Divider(height: 1.0),
              new Container(
                decoration: new BoxDecoration(color: Theme.of(context).cardColor),
                child: _buildTextComposer(),
              ),
            ],
          ),
        ));
  }

  Widget _buildTextComposer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: new Row(
        children: <Widget>[
          new Container(
            margin: new EdgeInsets.symmetric(horizontal: 4.0),
            child: new IconButton(
                icon: new Icon(
                  Icons.photo_camera,
                  color: Theme.of(context).accentColor,
                ),
                onPressed: () async {
                  //  File imageFile = await ImagePicker.pickImage();
                  // int timestamp = new DateTime.now().millisecondsSinceEpoch;
                  // StorageReference storageReference = FirebaseStorage
                  //     .instance
                  //     .ref()
                  //     .child("img_" + timestamp.toString() + ".jpg");
                  // StorageUploadTask uploadTask =
                  //     storageReference.put(imageFile);
                  // Uri downloadUrl = (await uploadTask.future).downloadUrl;
                  // sendMessage.onSendMessage(null, 1, widget.groupId);
                  // getImage() ;
                }),
          ),
          new Flexible(
            child: new TextField(
              controller: _textEditingController,
              decoration: new InputDecoration.collapsed(
                  hintText: "Type your comment..."),
            ),
          ),
          new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () {
                    postComment.onComment(widget.groupId,
                        widget.dataSnapshot.key, _textEditingController.text);
                    _textEditingController.clear();
                  })),
        ],
      ),
    );
  }
}
