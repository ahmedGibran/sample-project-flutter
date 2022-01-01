import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tribe_app/futures/post/application/post_state.dart';
class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<PostState>(
        builder: (context,state,child){
      return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text("Community",style: TextStyle(color: Colors.green),),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(15),
        color: Colors.grey.shade200,

        child: state.loading?
        const Center(child: const CircularProgressIndicator(),)
        :ListView.builder(
          key: const Key("home_posts_list"),
            itemCount: state.posts.length,
            itemBuilder: (context,index){
              return Container(
                color: Colors.white,
                margin: EdgeInsets.only(bottom: 25),
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Container(
                          height: 50,
                          width: 50,
                          decoration:  BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey
                          ),
                          child: Icon(Icons.perm_identity_sharp,color: Colors.white,)

                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Ahmed",style: TextStyle(fontSize: 14),),

                          Container(
                            width: 65,
                            height: 28,
                            margin: EdgeInsets.all(2),
                            decoration:  BoxDecoration(
                                color: Colors.green.shade100,
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.admin_panel_settings_outlined,color: Colors.green,size: 16,),
                                Text("Admin",style: TextStyle(color: Colors.green, fontSize: 14),),
                              ],
                            ),
                          ),

                          Text(" > ${state.posts[index].space}",style: TextStyle(fontSize: 14),),

                        ],
                      ),
                      subtitle: Text("${DateFormat('dd-MMMM h:mma').format(DateTime.parse(state.posts[index].createdAt))}",),
                      trailing: Container(
                        width: 45,
                        height: 20,
                        decoration:  BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.all(Radius.circular(5))
                        ),
                        child:Center(child: Text("posts",style: TextStyle(fontSize: 13),)),
                      ),

                    ),
                    const SizedBox(height: 10,),
                    Text("${state.posts[index].title}",style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87, ),),
                    const SizedBox(height: 10,),

                    HtmlWidget(state.posts[index].shortContent.substring(0,20)),
                    const SizedBox(height: 10,),

                    Container(
                      child: Image.network(state.posts[index].imageUrl,fit: BoxFit.cover,),
                    ),
                    ListTile(
                      leading: Container(
                          height: 30,
                          width: 30,
                          decoration:  BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black54
                          ),
                          child: Center(child: Text("A",style: TextStyle(fontSize: 10,color: Colors.white),))

                      ),
                      title:Text("${state.posts[index].totalRepliesCount} comments",style: TextStyle(fontSize: 14),),

                      trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 12,),

                    ),
                  ],
                ),
              );
            }),

      ),
    );
        });
  }
}
