import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tribe_app/futures/post/infrastructure/model/post_model.dart';

import '../../../../fixture/fixture_reader.dart';

void main(){
  late PostModel postModel;
  late List<PostModel> posts;
  setUp((){
    postModel =  PostModel(title: "Lorem Ipsum",
        id: "null",
        totalRepliesCount: 1 ,
        imageUrl: "null",
        createdAt:"2021-12-26T21:35:47.356Z" ,
        imageIds: "VvxGwwarIMFBF2ALRYdrQ",
        allowedEmojis: "null",
        followersCount: 0,
        hasMoreContent: false,
        isAnonymous: false,
        isHidden: true,
        shortContent: "<p>Lorem Ipsum is simply dummy text</p><figure data-type=\"image\" class=\"imageBlot\"><img data-id=\"VvxGwwarIMFBF2ALRYdrQ\" src=\"https://tribe-s3-production.imgix.net/VvxGwwarIMFBF2ALRYdrQ?w=1000&amp;auto=compress,format&amp;dl\" alt></figure><p><br></p>",

        space: "General");
    posts = [];
  });

 group("post model", (){
   setUp((){
     posts.add(postModel);
   });
   test("Should pass format Post data", ()async{
     //first
     final fixtureData = await fixture("post.json");
     //assert
     final result = PostModel.fromJson(json.decode(fixtureData));
     //act
     expectSync(result, postModel);
   });


   test("Should pass format list of posts", ()async{
     //first
     final fixtureData = json.decode(await fixture("posts.json"));
     //assert
     final result =List<PostModel>.from(fixtureData.map((item)=>PostModel.fromJson(item)));
     //act
     expectSync(result, posts);
   });
 });
}