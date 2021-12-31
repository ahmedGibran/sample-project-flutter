import 'package:graphql_flutter/graphql_flutter.dart';

class Queries{
  final getPosts = gql("""
  query {
  posts(limit:10,spaceIds:"WQGoVLBq9P42"){
 totalCount 
    nodes {
      title
      shortContent
      hasMoreContent
      followersCount
      allowedEmojis
      attachments{
        downloadUrl
        url
      }
      authMemberProps{
        scopes
        
      }    
      imageIds
      allowedEmojis 
      createdAt
      embedIds
      createdById
      forbiddenEmojis 
      totalRepliesCount
      topRepliers{
        member{
          name
          email
          banner{
            __typename
            
          }
          displayName
        }
        repliesCount
    
      }
      tags{
        title
      }
      spaceId
      space{
        name
        id
      }
      singleChoiceReactions
      seoDetail{
        description
        title
        image
      }
      replies(limit:10){
        edges{
          node{
            title
          }
          cursor
        }
      
      }
      postType{
        name
      }
      isHidden
      isAnonymous
      
      
    }
    
  }
}
  """);
}