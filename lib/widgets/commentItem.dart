import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:social_app_demo/models/comment.dart';

class CommentItem extends StatefulWidget {
  final Comment comments;
  final int source;
  const CommentItem(this.comments,this.source, {Key? key}) : super(key: key);

  @override
  _LiveChatItemState createState() => _LiveChatItemState();
}

class _LiveChatItemState extends State<CommentItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20),topRight: Radius.circular(5),bottomRight: Radius.circular(5))
        ),
        child: ListTile(
          leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(50),
              image: widget.comments.user != null
                  ? DecorationImage(
                  image: Image.asset(widget.comments.user.image).image,
                fit: BoxFit.cover
              ): null,
              color: Colors.red,
            ),
          ),
          title: Text(widget.comments.content , style: TextStyle(color: widget.source == 1 ? Colors.white: Colors.black),),
        ),
      ),
    );
  }
}
