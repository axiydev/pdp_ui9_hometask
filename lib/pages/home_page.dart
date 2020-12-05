import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pdp_ui9/pages/feed_page.dart';
class HomePage extends StatefulWidget {
  static final String id="home_page";
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  bool isWhite=true;
  int _currentIndex=0;
  var _pages=[
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar:AppBar(
        title:Text('Instagram',style:TextStyle(fontSize:25,fontWeight:FontWeight.w500,color:Colors.grey,fontFamily:'Roboto'),),
        centerTitle:true,
        elevation:0.0,
        bottomOpacity:0.0,
        brightness:Brightness.dark,
        backgroundColor:Colors.black,
        //#camera button
        leading: IconButton(
              icon:Icon(Feather.camera,size:25),
              color:Colors.grey,
              onPressed:(){},
            ),
        //#tv and send icons
        actions:[
          IconButton(
            icon:Icon(Feather.tv,size:25),
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
      body:_pages[_currentIndex],
      bottomNavigationBar:BottomNavigationBar(
        onTap:(int i){
          setState((){
            _currentIndex=i;
          });
        },
        items:[
          BottomNavigationBarItem(icon:Icon(Foundation.home,size:24),title:Text('Home')),
          BottomNavigationBarItem(icon:Icon(Feather.search,size:24),title:Text('Search')),
          BottomNavigationBarItem(icon:Icon(Feather.plus_square,size:24),title:Text('Add')),
          BottomNavigationBarItem(icon:Icon(Feather.heart,size:24),title:Text('Favourite')),
          BottomNavigationBarItem(icon:Icon(Feather.user,size:24),title:Text('Account')),
         ],
        selectedItemColor:Colors.white,
        type:BottomNavigationBarType.fixed,
        showSelectedLabels:false,
        showUnselectedLabels:false,
        currentIndex:_currentIndex,
        backgroundColor:Colors.grey[800],
        unselectedItemColor:Colors.black,
        elevation: 20.0,
      ),
    );
  }
}
