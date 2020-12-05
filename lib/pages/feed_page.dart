import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pdp_ui9/models/post_model.dart';
import 'package:pdp_ui9/models/story_model.dart';
class FeedPage extends StatefulWidget {
  static final String id="feed_page";
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<Post> _posts=[
    Post(userNme: 'Brianne',userImg:'assets/images/user_1.jpeg',postImg: 'assets/images/feed_1.jpeg',caption: 'Consequatur ni hil aliquid omnis consequatur'),
    Post(userNme: 'Henri',userImg:'assets/images/user_2.jpeg',postImg: 'assets/images/feed_2.jpeg',caption: 'Consequatur ni hil aliquid omnis consequatur'),
    Post(userNme: 'Mariano',userImg:'assets/images/user_3.jpeg',postImg: 'assets/images/feed_3.jpeg',caption: 'Consequatur ni hil aliquid omnis consequatur'),
  ];
  List<Story> _stories=[
    Story(userNme:'Jazmin',userImg: 'assets/images/user_1.jpeg'),
    Story(userNme:'Sylvester',userImg: 'assets/images/user_2.jpeg'),
    Story(userNme:'Lavina',userImg: 'assets/images/user_3.jpeg'),
    Story(userNme:'Jazmin',userImg: 'assets/images/user_1.jpeg'),
    Story(userNme:'Sylvester',userImg: 'assets/images/user_2.jpeg'),
    Story(userNme:'Lavina',userImg: 'assets/images/user_3.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black,
      body:Container(
        child:SingleChildScrollView(
          child:Column(
            children:[
              SizedBox(height: 17,),
            //  #header
              Container(
                margin:EdgeInsets.symmetric(horizontal:20,),
                child:Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children:[
                    Text('Stories',style:TextStyle(color:Colors.grey,fontSize:14,fontFamily:'Roboto')),
                    Text('Watch All',style:TextStyle(fontSize:14,color:Colors.grey,fontFamily:'Roboto')),
                  ],
                ),
              ),
            //  #stories
              Container(
                height:100,
                width:MediaQuery.of(context).size.width,
                margin:EdgeInsets.symmetric(vertical: 10),
                child:ListView(
                  scrollDirection:Axis.horizontal,
                  shrinkWrap:true,
                  children:_stories.map((Story i){
                    return _itemsOfStories(i);
                  }).toList(),
                ),
              ),
            //  #posts
              Container(
                width:MediaQuery.of(context).size.width,
                child:ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:_posts.length,
                  itemBuilder:(context,index){
                    return _itemsOfPosts(_posts[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  //#story widget
  Widget _itemsOfStories(Story item){
    return Column(
      children:[
       Container(
         height: 70,
         width: 70,
         margin:EdgeInsets.symmetric(horizontal: 15),
         decoration:BoxDecoration(
           borderRadius:BorderRadius.circular(70),
           border:Border.all(
             color:Color(0xFF8e44ad),
             width:3,
           ),
         ),
         child:Container(
           padding:EdgeInsets.all(2),
           child:ClipRRect(
             borderRadius:BorderRadius.circular(70),
             child: Image(
               image:AssetImage(item.userImg),
               fit:BoxFit.cover,
             ),
           ),
         ),
        ),
        SizedBox(height:10),
        Text(item.userNme,style:TextStyle(color:Colors.grey,fontSize:15,fontFamily:'Roboto')),
      ],
    );
  }
//  #post widget
Widget _itemsOfPosts(Post item){
    return Container(
      color:Colors.black,
        child:Column(
          children:[
            //  user
            Container(
              margin:EdgeInsets.symmetric(horizontal: 10,vertical:10),
              child:Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children:[
                //  #uresimg username
                  Row(
                    children:[
                      //#userimg
                      Container(
                        height:40,
                        width:40,
                        child:ClipRRect(
                          borderRadius:BorderRadius.circular(20),
                          child:Image(
                            image:AssetImage(item.userImg),
                            fit:BoxFit.cover,
                          ),
                        ),
                      ),
                    //  #username
                      SizedBox(width: 9,),
                      Text(item.userNme,style:TextStyle(color:Colors.grey,fontSize:15,fontFamily:'Roboto')),
                    ],
                  ),
                  IconButton(
                    icon:Icon(SimpleLineIcons.options),
                    color:Colors.grey[400],
                    onPressed:(){
                    },
                  ),
                ],
              ),
            ),
           //#post image
           FadeInImage(
             image:AssetImage(item.postImg),
             fit:BoxFit.cover,
             width:MediaQuery.of(context).size.width,
             placeholder: AssetImage('assets/images/placeholder.png'),
           ),
          //  #icons
            Container(
              child:Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children:[
                  Row(
                    children:[
                      IconButton(
                        icon:Icon(FontAwesome.heart_o,size:25),
                        color:Colors.grey,
                        onPressed:(){},
                      ),
                      IconButton(
                        icon:Icon(FontAwesome.comment_o,size:25),
                        color:Colors.grey,
                        onPressed:(){},
                      ),
                      IconButton(
                        icon:Icon(FontAwesome.send_o,size:25),
                        color:Colors.grey,
                        onPressed:(){},
                      ),
                    ],
                  ),
                  IconButton(
                    icon:Icon(FontAwesome.bookmark_o,size:25),
                    color:Colors.grey,
                    onPressed:(){},
                  ),
                ],
              ),
            ),
            Container(
              width:MediaQuery.of(context).size.width,
              margin:EdgeInsets.symmetric(horizontal: 10),
              child:Text.rich(
                TextSpan(
                  text:'Liked by ',
                  style:TextStyle(fontSize:15,fontFamily:'Roboto',color:Colors.grey),
                  children:[
                    TextSpan(
                      text:'Sigmund, Yessenia, Dayana ',
                      style:TextStyle(fontWeight:FontWeight.bold,color:Colors.white),
                    ),
                    TextSpan(text:'and '),
                    TextSpan(
                      text:'1236 others',
                      style:TextStyle(fontWeight:FontWeight.bold,color:Colors.white),
                    ),
                  ],
                ),
                softWrap:true,
                overflow:TextOverflow.visible,
              ),
            ),
            SizedBox(height:3),
            //#texts
            Container(
              width:MediaQuery.of(context).size.width,
              margin:EdgeInsets.symmetric(horizontal: 10),
              child:RichText(
                softWrap: true,
                overflow:TextOverflow.visible,
                text:TextSpan(
                  text:'${item.userNme} ',
                  style:TextStyle(fontWeight:FontWeight.bold,fontSize:15,color:Colors.white),
                  children:[
                    TextSpan(text:item.caption,style:TextStyle(color:Colors.grey,fontWeight:FontWeight.normal,fontSize:15),),
                  ],
                ),
              ),
            ),
            SizedBox(height:3),
            //#text year
            Container(
              alignment: Alignment.topLeft,
              margin:EdgeInsets.symmetric(horizontal: 10),
              child:Text('February 2020',style:TextStyle(color:Colors.grey,fontFamily:'Roboto'),textAlign:TextAlign.start,),
            ),
          ],
        ),
    );
}
}
