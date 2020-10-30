import 'Post.dart';

class User{
  String username;
  List<Post> posts;
  List<User> totalNumber;
  List<Post> savedPosts;
  bool hasStory;

  User(this.username, this.posts, this.totalNumber, this.savedPosts,
      this.hasStory);
}