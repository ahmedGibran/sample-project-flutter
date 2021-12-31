import 'package:flutter/foundation.dart';
import 'package:tribe_app/futures/post/domain/entities/post.dart';
import 'package:tribe_app/futures/post/domain/usecase/get_posts.dart';

class PostState extends ChangeNotifier{
  late List<Post> _posts ;
  late bool _error,_loading;
  final GetPosts getPosts;
  PostState({required this.getPosts}){
    _posts =[];
    _error =false;
    _loading =false;
    getPostsState();
  }

  List<Post> get posts=>_posts;
  bool get error=>_error;
  bool get loading=>_loading;

  Future<void> getPostsState()async{
    _loading =true;
    notifyListeners();

    final result = await getPosts.getPosts();
    result.fold((l){
      _error =true;
      _loading =false;
    }, (r){
      _posts=r;
      _error =false;
      _loading =false;
    });
    notifyListeners();
  }
}