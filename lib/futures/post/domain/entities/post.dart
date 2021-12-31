
import 'package:equatable/equatable.dart';

class Post extends Equatable{
  /**

      nodes {

      topRepliers{
      member{
      name
      email
      banner{
      __typename

      }
      displayName
      }
      repliesCount

      }
      tags{
      title
      }
      spaceId
      space{
      name
      id
      }
      singleChoiceReactions
      seoDetail{
      description
      title
      image
      }
      replies(limit:10){
      edges{
      node{
      title
      }
      cursor
      }

      }
      postType{
      name
      }


      }
   */






  final String createdAt;
  final int followersCount;
  final int totalRepliesCount;
  final  bool hasMoreContent;
  final  String id;
  final  String imageIds;
  final  String allowedEmojis;
  final bool isAnonymous;
  final bool isHidden;
  final String   title;
  final  String shortContent;
  final String space;
  final String imageUrl;
  const Post({
    required this.title,
    required this.id,
    required this.totalRepliesCount,
    required this.imageUrl,
    required this.createdAt,
    required this.imageIds,
    required this.allowedEmojis,
    required this.followersCount,
    required this.hasMoreContent,
    required this.isAnonymous,
    required this.isHidden,
    required this.shortContent,
    required this.space,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [ this.title,
     this.id,
     this.totalRepliesCount,
     this.imageUrl,
     this.createdAt,
     this.imageIds,
     this.allowedEmojis,
     this.followersCount,
     this.hasMoreContent,
     this.isAnonymous,
     this.isHidden,
     this.shortContent,
     this.space,];

}