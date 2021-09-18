import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:social_app_demo/models/comment.dart';

class LiveChatItem extends StatefulWidget {
  final Comment comments;
  final int source;
  const LiveChatItem(this.comments,this.source, {Key? key}) : super(key: key);

  @override
  _LiveChatItemState createState() => _LiveChatItemState();
}

class _LiveChatItemState extends State<LiveChatItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(50),
          image: widget.comments.user != null
              ? DecorationImage(
              image: Image.asset(widget.comments.user!.image).image,
                  fit: BoxFit.cover): null,
          color: Colors.red,
        ),
      ),
      title: Text(widget.comments.content , style: TextStyle(color: widget.source == 1 ? Colors.white: Colors.black),),
    );
  }
}
