import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:social_app_demo/models/comment.dart';

class LiveChatItem extends StatefulWidget {
  final Comment comments;
  final int source;

  const LiveChatItem(this.comments, this.source, {Key? key}) : super(key: key);

  @override
  _LiveChatItemState createState() => _LiveChatItemState();
}

class _LiveChatItemState extends State<LiveChatItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0,top: 10),
          child: Container(
            height: 33,
            width: 33,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(50),
              image: widget.comments.user != null
                  ? DecorationImage(
                      image: Image.asset(widget.comments.user!.image).image,
                      fit: BoxFit.cover)
                  : null,
              color: Colors.red,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 54.0,right: 27,top: 16),
          child: Text.rich(TextSpan(children: [
            TextSpan(
                text: '11:50 ',
                style:
                    TextStyle(fontWeight: FontWeight.w500, color: Colors.grey)),
            TextSpan(
              text: '${widget.comments.user.name} ',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            TextSpan(
              text: widget.comments.content,
              style: TextStyle(
                  color: widget.source == 1 ? Colors.white : Colors.black,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w300),
            ),
          ])),
        )
      ],
    );
    return ListTile(
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(50),
            image: widget.comments.user != null
                ? DecorationImage(
                    image: Image.asset(widget.comments.user!.image).image,
                    fit: BoxFit.cover)
                : null,
            color: Colors.red,
          ),
        ),
        title: Text.rich(TextSpan(children: [
          TextSpan(
              text: '11:50 ',
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.grey)),
          TextSpan(
            text: '${widget.comments.user.name} ',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          TextSpan(
            text: widget.comments.content,
            style: TextStyle(
                color: widget.source == 1 ? Colors.white : Colors.black,
                fontFamily: 'regular',
                fontWeight: FontWeight.w300),
          ),
        ])));
  }
}
