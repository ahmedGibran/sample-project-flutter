import 'package:dartz/dartz.dart';
import 'package:tribe_app/core/errors/failure.dart';
import 'package:tribe_app/core/errors/expceptions.dart';
import 'package:tribe_app/core/network/network_info.dart';
import 'package:tribe_app/futures/post/domain/entities/post.dart';
import 'package:tribe_app/futures/post/domain/repository/post_repository.dart';
import 'package:tribe_app/futures/post/infrastructure/data/post_remot_data.dart';

class PostRepositoryImpl extends PostRepository{

  final PostRemoteData postRemoteData;
  final NetWorkInfo netWorkInfo;
  // final NetWorkInfo netWorkInfo;
  PostRepositoryImpl({required this.postRemoteData, required this.netWorkInfo});

  @override
  Future<Either<Failure,List<Post>>> getPosts()async{
   final isConnected = await  netWorkInfo.isConnected;
   if(isConnected){
     try{
       List<Post> posts= await postRemoteData.getPosts();
       return Right(posts);
     }on ServerException{
       return Left(Failure());

     }
   }else{
     return Left(Failure());

   }

  }
}