import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tribe_app/futures/post/application/post_state.dart';
import 'package:tribe_app/futures/post/domain/usecase/get_posts.dart';
import 'package:tribe_app/futures/post/infrastructure/data/post_remot_data.dart';
import 'package:tribe_app/futures/post/infrastructure/repository/post_repository_impl.dart';

import 'futures/post/presentation/screens/posts_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<PostState>(
        create: (_)=>PostState(getPosts: GetPosts(repository: PostRepositoryImpl(postRemoteData: PostRemoteDataImpl()))),
      )
    ],
    child: MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: PostsScreen(),
    ),
    );
  }
}
