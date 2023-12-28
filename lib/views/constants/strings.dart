import 'package:flutter/foundation.dart' show immutable;

@immutable
class Strings {
  static const appName = "InstaVoid";
  static const welcomeToAppName = "Welcome to ${Strings.appName}";
  static const youHaveNoPosts =
      "You have not made a post yet. Press either the photo-upload or the video-upload at the top of the screen to get started";
  static const noPostsAvailable =
      "Nobody seems to have made any posts yet. Why don't you make your first post";
  static const enterYourSearchTerm =
      "Enter your search term in order to get started. You can search in the description of all posts available in the system";

  static const facebook = "Facebook";
  static const facebookSignupUrl = "https://www.facebook.com/signup";
  static const google = "Google";
  static const googleSignupUrl = "https://accounts.google.com/signup";
  static const logIntoYourAccount =
      "Log into your account using one of the options below";
  static const comments = "Comments";
  static const writeYourCommentHere = "Write your comment here";
  static const checkOutThisPost = "Check out this post";
  static const postDetails = "Post Details";
  static const posts = "Posts";

  const Strings._();
}
