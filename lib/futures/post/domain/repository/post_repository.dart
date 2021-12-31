import 'package:dartz/dartz.dart';
import 'package:tribe_app/core/errors/failure.dart';
import 'package:tribe_app/futures/post/domain/entities/post.dart';

abstract class PostRepository{
  Future<Either<Failure,List<Post>>> getPost();
}