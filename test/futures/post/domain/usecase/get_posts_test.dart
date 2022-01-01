import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tribe_app/core/errors/failure.dart';
import 'package:tribe_app/futures/post/domain/domain.dart';
import 'package:tribe_app/futures/post/domain/repository/post_repository.dart';
import 'package:tribe_app/futures/post/domain/usecase/get_posts.dart';

import 'get_posts_test.mocks.dart';
@GenerateMocks([PostRepository])
void main() {
  late GetPosts data;
  late MockPostRepository mockPostRepository;
  setUp((){
    mockPostRepository = MockPostRepository();
    data = GetPosts(repository: mockPostRepository);
  });

  group("get posts", (){
    test("should return list of posts when call the get posts method",()async{
      List<Post> posts = [];
      //
      when(mockPostRepository.getPosts()).thenAnswer((_) async=> Right(posts));
      //assrt
      final result = await data.getPosts();
      //act
      expect(result,Right(posts));

    });

    test("should return failure when call the get posts method unsuccessfully",()async{
      //
      when(mockPostRepository.getPosts()).thenAnswer((_) async=> Left(Failure()));
      //assrt
      final result = await data.getPosts();
      //act
      expect(result!.isLeft(),true);

    });
  });
}