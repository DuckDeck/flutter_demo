import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';
import '../entity/post.dart';

part 'post.g.dart';

@JsonSerializable()
@immutable
class PostState {

  final Map<String,PostEntity> posts;
  final Map<String,List<int>> postPublished;
  final Map<String,List<int>> postsLiked;
  final List<int> postsFollowing;

  PostState({
    this.posts = const {},
    this.postPublished = const {},
    this.postsLiked = const {},
    this.postsFollowing = const []
  });

  PostState copyWith({
      Map<String,PostEntity> posts,
   Map<String,List<int>> postPublished,
   Map<String,List<int>> postsLiked,
   List<int> postFollowing
  }) => PostState(
     posts : posts ?? this.posts,
    postPublished : postPublished ?? this.postPublished,
    postsLiked : postsLiked ?? this.postsLiked,
    postsFollowing : postFollowing ?? this.postsFollowing,

  );


      factory PostState.fromJson(Map<String,dynamic> json) => _$PostStateFromJson(json);
    Map<String,dynamic> toJson() => _$PostStateToJson(this);


}