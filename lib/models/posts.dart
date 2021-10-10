import 'package:social_app_demo/constants/strings.dart';
import 'package:social_app_demo/models/comment.dart';
import 'package:social_app_demo/models/user.dart';
import 'package:social_app_demo/ui/home/main_page/main_page.dart';

//todo to be re implemented
class Posts {
  final UserModel publisher;
  List<UserModel> likedBy = [];
  final ownedBy;
  String? postTitle;
  String? postDescription;
  String? postImage;
  String? country;
  dynamic timePosted;
  int? numberOfLikes;
  List<Comment>? comments;
  List? followers = []; //will contain the user id of followings

  Posts(
      {required this.publisher,
      required this.likedBy,
      this.postTitle,
      this.postDescription,
      this.postImage,
      this.country,
      this.timePosted,
      this.numberOfLikes,
      required this.ownedBy,
      required this.followers,
      this.comments});
}

List<Posts> postList = [
  Posts(
      publisher: UserModel('id', 'Aiysha', 'assets/images/a.jpg'),
      likedBy: [
        UserModel('id', 'Koxc', 'assets/images/a.jpg'),
        UserModel('id', 'Mana', 'assets/images/b.jpg'),
        UserModel('id', 'Per', 'assets/images/a.jpg')
      ],
      postTitle: dummy,
      postDescription: dummyDes,
      numberOfLikes: 58,
      country: "Ghana",
      postImage: 'assets/images/postImage.png',
      followers: ['userId1', 'userId2'],
      timePosted: timeStamp,
      ownedBy: 'abccd'),
  Posts(
      publisher: UserModel('id', 'Aiysha', 'assets/images/a.jpg'),
      likedBy: [
        UserModel('id', 'Koxc', 'assets/images/a.jpg'),
        UserModel('id', 'Mana', 'assets/images/b.jpg'),
        UserModel('id', 'Per', 'assets/images/a.jpg')
      ],
      postTitle: dummy,
      postDescription: dummyDes,
      numberOfLikes: 58,
      country: "Ghana",
      postImage: '',
      followers: ['userId1', 'userId2'],
      timePosted: timeStamp,
      ownedBy: 'abccd'),
  Posts(
    publisher: UserModel('id', 'Daniz', 'assets/images/a.jpg'),
    likedBy: [
      UserModel('id', 'Koxc', 'assets/images/a.jpg'),
      UserModel('id', 'Mana', 'assets/images/b.jpg'),
      UserModel('id', 'Per', 'assets/images/a.jpg')
    ],
    postTitle: dummy,
    country: "Togo",
    postImage: 'assets/images/a.jpg',
    numberOfLikes: 30,
    postDescription: dummyDes,
    followers: ['userId1', 'userId2'],
    ownedBy: 'ccda',
    timePosted: timeStamp,
  ),
  Posts(
      publisher: UserModel('id', 'Bera', 'assets/images/a.jpg'),
      likedBy: [],
      postTitle: dummy,
      postDescription: dummyDes,
      country: "Nigeria",
      timePosted: timeStamp,
      postImage: 'assets/images/c.jpg',
      numberOfLikes: 15,
      followers: [],
      ownedBy: 'nnaa'),
];
