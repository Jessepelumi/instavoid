import 'package:flutter/foundation.dart' show immutable;

@immutable
class Strings {
  static const appName = "InstaVoid";
  static const welcomeToAppName = "Welcome to ${Strings.appName}!";
  static const youHaveNoPosts =
      "You have not made a post yet. Press either the photo-upload or the video-upload at the top of the screen to get started";
  static const noPostsAvailable =
      "Nobody seems to have made any posts yet. Why don't you make your first post";
  static const enterYourSearchTerm =
      "Enter your search term. You can search using the description of all posts available in the system";

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
  static const posts = "Post";

  static const createNewPost = "Create new post";
  static const pleaseWriteYourMessageHere = "Please write your message here";
  static const noCommentsYet =
      "Nobody has commented on this post yet. You can change that though, and be the first person to comment!";
  static const enterYourSearchTermHere = "Enter your search term here";

  static const dontHaveAnAccount = "Don't have an account?\n";
  static const signUpOn = "Sign up on ";
  static const orCreateAnAccountOn = " or create an account on ";

  const Strings._();
}
