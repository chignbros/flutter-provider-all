import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_arc/core/models/comment.dart';
import 'package:provider_arc/core/viewmodel/comment_provisder.dart';
import 'package:provider_arc/ui/shared/app_colors.dart';
import 'package:provider_arc/ui/shared/ui_helpers.dart';
import 'package:provider_arc/ui/views/base_view.dart';


class Comments extends StatelessWidget {
  final int postId;
  Comments(this.postId);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<CommentModel>(
      model: CommentModel(api: Provider.of(context)),
      onModelReady: (model)=>model.getComment(postId),
      builder: (context,model,child)=> model.busy
      ? Center(child: CircularProgressIndicator(),) 
      :ListView.builder(
        itemCount: model.comments.length,
        itemBuilder: (context,index)=>CommentItem(model.comments[index]),
      )
      
    );
  }
}

/// Renders a single comment given a comment model
class CommentItem extends StatelessWidget {
  final Comment comment;
  const CommentItem(this.comment);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: commentColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            comment.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          UIHelper.verticalSpaceSmall,
          Text(comment.body),
        ],
      ),
    );
  }
}
