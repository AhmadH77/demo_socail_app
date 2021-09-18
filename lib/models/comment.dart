import 'package:social_app_demo/models/user.dart';

class Comment{
  User? user;
  final String content;

  Comment(this.content, {this.user});
}