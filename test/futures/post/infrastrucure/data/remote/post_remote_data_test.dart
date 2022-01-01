import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tribe_app/futures/post/domain/domain.dart';
import 'package:tribe_app/futures/post/infrastructure/data/post_remot_data.dart';
import 'package:tribe_app/futures/post/infrastructure/model/post_model.dart';

import '../../../../../fixture/fixture_reader.dart';
import 'post_remote_data_test.mocks.dart';

@GenerateMocks([GraphQLClient])

void main(){
 late  PostRemoteData remoteData;
  late MockGraphQLClient mockGraphQLClient;

  setUp((){
    mockGraphQLClient = MockGraphQLClient();
    remoteData = PostRemoteDataImpl(graphQLClient:mockGraphQLClient);
  });


  group("post remote data",(){

    test("should response successfully data when we make request",()async{

      final fixtureData = json.decode(await fixture("posts_remote.json"));
      // List<Post> posts = List<Post>.from(fixtureData["data"]['posts']['nodes'].map((item)=>PostModel.fromJson(item)));
      //handle
      when(mockGraphQLClient.query(any)).thenAnswer((_) async=>
          QueryResult(data: fixtureData["data"], source:  QueryResultSource.network));
      //asser
       await remoteData.getPosts();

      verify(mockGraphQLClient.query(any));

      //act


  });
  });
}