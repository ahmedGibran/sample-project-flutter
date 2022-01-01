import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tribe_app/futures/post/application/post_state.dart';
import 'core/utils/dependencies_injection.dart';
import 'futures/post/presentation/screens/posts_screen.dart';

void main() async{
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<PostState>(
        create: (_)=>sl<PostState>(),
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
