import 'package:dartz/dartz.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:tribe_app/core/errors/failure.dart';
import 'package:tribe_app/futures/post/domain/entities/post.dart';
import 'package:tribe_app/futures/post/domain/repository/post_repository.dart';
import 'package:tribe_app/futures/post/infrastructure/data/post_remot_data.dart';

class PostRepositoryImpl extends PostRepository{

  final PostRemoteData postRemoteData;
  // final NetWorkInfo netWorkInfo;
  PostRepositoryImpl({required this.postRemoteData, });

  @override
  Future<Either<Failure,List<Post>>> getPost()async{

    try{
     List<Post> posts= await postRemoteData.getPosts();
      return Right(posts);
    }on ServerException{
      return Left(Failure());

    }
  }
}