import 'package:social_app_demo/constants/strings.dart';
import 'package:social_app_demo/models/comment.dart';
import 'package:social_app_demo/models/user.dart';

//todo to be re implemented
class Posts {
  final User publisher;
  List<User> likedBy = [];
  final ownedBy;
  String? postTitle;
  String? postDescription;
  String? postImage;
  List<Comment>? comments;
  List? followers = []; //will contain the user id of followings

  Posts(
      {required this.publisher,
      required this.likedBy,
      this.postTitle,
      this.postDescription,
      this.postImage,
      required this.ownedBy,
      required this.followers,
      this.comments});
}

List<Posts> postList = [
  Posts(
      publisher: User('id', 'Aiysha', 'assets/images/a.jpg'),
      likedBy: [
        User('id', 'Koxc', 'assets/images/a.jpg'),
        User('id', 'Mana', 'assets/images/b.jpg'),
        User('id', 'Per', 'assets/images/a.jpg')
      ],
      postTitle: dummy,
      postDescription: dummyDes,
      postImage: 'assets/images/b.jpg',
      followers: ['userId1', 'userId2'],
      ownedBy: 'abccd'),
  Posts(
    publisher: User('id', 'Daniz', 'assets/images/a.jpg'),
    likedBy: [
      User('id', 'Koxc', 'assets/images/a.jpg'),
      User('id', 'Mana', 'assets/images/b.jpg'),
      User('id', 'Per', 'assets/images/a.jpg')
    ],
    postTitle: dummy,
    postImage: 'assets/images/a.jpg',
    postDescription: dummyDes,
    followers: ['userId1', 'userId2'],
    ownedBy: 'ccda',
  ),
  Posts(
      publisher: User('id', 'Bera', 'assets/images/a.jpg'),
      likedBy: [],
      postTitle: dummy,
      postDescription: dummyDes,
      postImage: 'assets/images/c.jpg',
      followers: [],
      ownedBy: 'nnaa'),
];
