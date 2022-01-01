import 'package:dartz/dartz.dart';
import 'package:tribe_app/core/errors/failure.dart';
import 'package:tribe_app/futures/post/domain/entities/post.dart';
import 'package:tribe_app/futures/post/domain/repository/post_repository.dart';

class GetPosts{
  final PostRepository repository;
  GetPosts({required this.repository});
  Future<Either<Failure,List<Post>>?> getPosts() async {
    return repository.getPosts();
  }
}