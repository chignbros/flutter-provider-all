import 'package:flutter/cupertino.dart';
import 'package:provider_arc/core/models/post.dart';
import 'package:provider_arc/core/services/api.dart';
import 'package:provider_arc/core/viewmodel/base_model.dart';

class PostModel extends BaseModel {
  Api _api;
  PostModel({@required Api api}) : _api = api;

  List<Post> posts;

  Future getPosts(int userId) async {
    setBusy(true);
    posts = await _api.getPostsForUser(userId);
    setBusy(false);
  }
}
