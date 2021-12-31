import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:tribe_app/futures/post/domain/entities/post.dart';
import 'package:tribe_app/futures/post/infrastructure/data/qeuries.dart';
import 'package:tribe_app/futures/post/infrastructure/model/post_model.dart';
import 'package:html/parser.dart' as html_parsae;
import 'package:timeago/timeago.dart' as timeago;


abstract class PostRemoteData{
  Future<List<Post>> getPosts();
}

class PostRemoteDataImpl extends PostRemoteData{
  static Map<String,String> header = {
    "Authorization":"bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IkdVRVNUX0NSR3JEeU5TdE9vZHJPYyIsIm5ldHdvcmtJZCI6Im5VTGZ2NEtlMEkiLCJuZXR3b3JrRG9tYWluIjoidGVzdC1wcm9qZWN0LnRyaWJlcGxhdGZvcm0uY29tIiwidG9rZW5UeXBlIjoiR1VFU1QiLCJlbnRpdHlJZCI6bnVsbCwicGVybWlzc2lvbkNvbnRleHQiOm51bGwsInBlcm1pc3Npb25zIjpudWxsLCJpYXQiOjE2NDA0NjcwNTIsImV4cCI6MTY0MzA1OTA1Mn0.V-_nAGndFPNXZZbaDxOOgAzSbF4GLceTXj8jBo6SCaE"
  };

  @override
  Future<List<Post>> getPosts() async{

    List<Post> posts = [];
    final query = Queries().getPosts;
    final HttpLink httpLink = HttpLink("https://app.tribe.so/graphql",defaultHeaders: header);
    GraphQLClient client = GraphQLClient(link: httpLink, cache: GraphQLCache(
      store: InMemoryStore(),
    ));
    QueryResult queryResult = await client.query(
      QueryOptions(document: query)
    );
    if(queryResult.hasException){

      throw const ServerException();
    }else if(queryResult.data!=null){

      for(var item in queryResult.data!['posts']['nodes']){
        var data = DateFormat('dd-MM-yyyy h:mma').format(DateTime.parse(item['createdAt']));
        // timeago.format(DateFormat('d/M/yyyy').parse(item['createdAt']));
        print(data);
           final document =  html_parsae.parse(item['shortContent']);
           final results = document.getElementsByClassName("imageBlot");
           for(var result in results){
             print(result.getElementsByTagName("img").first.attributes['src']);
             item['imageUrl']=result.getElementsByTagName("img").first.attributes['src'];
           }

           posts.add(PostModel.fromJson(item));
      }
    }



    return posts;
  }

}