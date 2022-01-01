import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tribe_app/core/errors/expceptions.dart' as ex;
import 'package:tribe_app/core/errors/failure.dart';
import 'package:tribe_app/core/network/network_info.dart';
import 'package:tribe_app/futures/post/domain/domain.dart';
import 'package:tribe_app/futures/post/domain/repository/post_repository.dart';
import 'package:tribe_app/futures/post/infrastructure/data/post_remot_data.dart';
import 'package:tribe_app/futures/post/infrastructure/repository/post_repository_impl.dart';

import 'post_repository_impl_test.mocks.dart';
@GenerateMocks([NetWorkInfo,PostRemoteData])
void main(){
  late MockNetWorkInfo mockNetWorkInfo;
  late MockPostRemoteData mockPostRemoteData;
  late PostRepository postRepository;

  setUp((){
    mockNetWorkInfo = MockNetWorkInfo();
    mockPostRemoteData = MockPostRemoteData();
    postRepository = PostRepositoryImpl(postRemoteData: mockPostRemoteData,
        netWorkInfo:mockNetWorkInfo);
  });

  group("post repository there is connection",(){
    List<Post> posts = [];
    test("should call remote data when the internet is connected", ()async{
      //
      when(mockNetWorkInfo.isConnected).thenAnswer((_) async=> true);
      when(mockPostRemoteData.getPosts()).thenAnswer((_) async=> posts);
      //assr
      final  result =await postRepository.getPosts();
      //act
      expect(result,Right(posts));

    });

    test("should throw server exception when call remote data", ()async{
      //
      when(mockNetWorkInfo.isConnected).thenAnswer((_) async=> true);
      when(mockPostRemoteData.getPosts()).thenAnswer((_) async=> throw ex.ServerException());
      //assr
      final result =await  postRepository.getPosts();
      verify(mockPostRemoteData.getPosts());
      //act
      expect(result!.isLeft(),true);

    });
  });


}