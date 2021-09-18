import 'package:social_app_demo/constants/strings.dart';
import 'package:social_app_demo/models/comment.dart';
import 'package:social_app_demo/models/user.dart';

class Posts {
  final User publisher;
  final ownedBy;
  dynamic likedBy = [];
  String? postTitle;
  String? postDescription;
  String? postImage;
  List<Comment>? comments;

  Posts(
      {required this.publisher,
      required this.likedBy,
      this.postTitle,
      this.postDescription,
      this.postImage,
      required this.ownedBy,
      this.comments});
}

List<Posts> postList = [
  Posts(
      publisher: User('id', 'Aiysha', 'assets/images/a.jpg'),
      likedBy: ['assets/images/a.jpg', 'assets/images/b.jpg'],
      postTitle: dummy,
      postDescription: dummyDes,
      postImage: 'assets/images/b.jpg',
      ownedBy: 'abccd'),
  Posts(
    publisher: User('id', 'Daniz', 'assets/images/a.jpg'),
    likedBy: ['assets/images/a.jpg', 'assets/images/b.jpg'],
    postTitle: dummy,
    postImage: '',
    postDescription: dummyDes,
    ownedBy: 'ccda',
  ),
  Posts(
      publisher: User('id', 'Bera', 'assets/images/a.jpg'),
      likedBy: ['assets/images/a.jpg', 'assets/images/b.jpg'],
      postTitle: dummy,
      postDescription: dummyDes,
      postImage: 'assets/images/c.jpg',
      ownedBy: 'nnaa'),
];
