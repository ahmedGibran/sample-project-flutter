import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:tribe_app/core/network/network_info.dart';
import 'package:tribe_app/futures/post/application/post_state.dart';
import 'package:tribe_app/futures/post/domain/repository/post_repository.dart';
import 'package:tribe_app/futures/post/domain/usecase/get_posts.dart';
import 'package:tribe_app/futures/post/infrastructure/data/post_remot_data.dart';
import 'package:tribe_app/futures/post/infrastructure/repository/post_repository_impl.dart';

final sl = GetIt.instance;
Future<void> init() async{
  ///Start of Post future
  //provider
  sl.registerFactory(() => PostState(getPosts: sl()));

  //use cases
  sl.registerLazySingleton(() => GetPosts(repository: sl()));

  // repository
  sl.registerLazySingleton<PostRepository>(() =>
      PostRepositoryImpl(postRemoteData: sl(), netWorkInfo: sl()));

  //data source
  sl.registerLazySingleton<PostRemoteData>(()=>PostRemoteDataImpl(graphQLClient: sl()));

  /// End of Post future

  //core
  sl.registerLazySingleton<NetWorkInfo>(() => NetWorkInfoImpl(dataConnectionChecker: sl()));

  //external
  sl.registerLazySingleton<GraphQLClient>(() => GraphQLClient(link: HttpLink("https://app.tribe.so/graphql",
      defaultHeaders:
      {
        "Authorization":"bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IkdVRVNUX0NSR3JEeU5TdE9vZHJPYyIsIm5ldHdvcmtJZCI6Im5VTGZ2NEtlMEkiLCJuZXR3b3JrRG9tYWluIjoidGVzdC1wcm9qZWN0LnRyaWJlcGxhdGZvcm0uY29tIiwidG9rZW5UeXBlIjoiR1VFU1QiLCJlbnRpdHlJZCI6bnVsbCwicGVybWlzc2lvbkNvbnRleHQiOm51bGwsInBlcm1pc3Npb25zIjpudWxsLCJpYXQiOjE2NDA0NjcwNTIsImV4cCI6MTY0MzA1OTA1Mn0.V-_nAGndFPNXZZbaDxOOgAzSbF4GLceTXj8jBo6SCaE"
      }
  ), cache: sl()));
  sl.registerLazySingleton(() => GraphQLCache(store: InMemoryStore()));
  sl.registerFactory(() => DataConnectionChecker());


}