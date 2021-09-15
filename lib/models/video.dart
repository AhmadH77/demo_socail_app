import 'package:social_app_demo/models/comment.dart';
import 'package:social_app_demo/models/user.dart';

class Video {
  final int id;
  final String name, description, watches, image , likes, dislikes;
  final List category;
  final bool live;
  final User publisher;
  final List<Comment> comments;

  Video(this.id, this.watches, this.name, this.description, this.live,
      this.image, this.category, this.publisher, this.likes, this.dislikes, this.comments);
}
