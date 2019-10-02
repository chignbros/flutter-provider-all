

import 'package:flutter/material.dart';
import 'package:provider_arc/core/models/comment.dart';
import 'package:provider_arc/core/services/api.dart';
import 'package:provider_arc/core/viewmodel/base_model.dart';

class CommentModel extends BaseModel{
  Api _api;
  CommentModel({@required Api api}):_api=api;

  List<Comment> comments;

  Future getComment(int postId)async{
    setBusy(true);
    comments=await _api.getCommentsForPost(postId);
    setBusy(false);


  }

}