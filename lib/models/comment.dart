//@dart=2.9
import 'package:social_app_demo/models/user.dart';

class Comment{
   UserModel user;
  final String content;

  Comment(this.content, {this.user});
}