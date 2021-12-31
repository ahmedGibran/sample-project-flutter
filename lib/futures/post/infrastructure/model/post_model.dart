import 'package:tribe_app/futures/post/domain/entities/post.dart';

class PostModel extends Post {
  final String createdAt;
  final int followersCount;
  final int totalRepliesCount;
  final bool hasMoreContent;
  final String id;
  final String imageIds;
  final String allowedEmojis;
  final bool isAnonymous;
  final bool isHidden;
  final String title;
  final String shortContent;
  final String space;
  final String imageUrl;
  PostModel({
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
  }) : super(
            title: title,
            createdAt: createdAt,
            shortContent: shortContent,
            space: space,
            id: id,
            isHidden: isHidden,
            isAnonymous: isAnonymous,
            hasMoreContent: hasMoreContent,
            followersCount: followersCount,
            imageUrl: imageUrl,
            imageIds: imageIds,
            allowedEmojis: allowedEmojis,
            totalRepliesCount: totalRepliesCount,
            );

  factory PostModel.fromJson(Map<String, dynamic> jsonData) {
    return PostModel(
      title: jsonData['title'],
      createdAt: jsonData['createdAt'].toString(),
      shortContent: jsonData['shortContent'],
      space: jsonData['space']['name'],
      id: jsonData['id'].toString(),
      isHidden: jsonData['isHidden']??true,
      isAnonymous: jsonData['isAnonymous'],
      hasMoreContent: jsonData['hasMoreContent'],
      followersCount: jsonData['followersCount']??0,
      imageIds: jsonData['imageIds'][0]??"",
      imageUrl: jsonData['imageUrl'].toString(),
      allowedEmojis: jsonData['allowedEmojis'].toString(),
      totalRepliesCount: jsonData['totalRepliesCount'],
    );
  }
}
