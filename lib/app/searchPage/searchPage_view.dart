import 'dart:developer';
import 'package:book_time/Factory/FactoryBook.dart';
import 'package:book_time/app/bookByGenre/bookByGenre_view.dart';
import 'package:book_time/app/homePage/homePage_view.dart';
import 'package:book_time/app/searchPage/searchPage_controller.dart';
import 'package:book_time/domain/entity/googleApiBook.dart';
import 'package:book_time/profilePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:book_time/domain/repositories/BookInterface.dart';




class searchPage extends View {
  @override
  State<StatefulWidget> createState() => searchPageState();
}

class searchPageState extends ViewState<searchPage, SearchPageController> {
    searchPageState() : super(SearchPageController(bookSource));

  int _currentIndex = 2;

  static BookInterface bookSource =  (FactoryAll(1)).bookSource;

  String search;

  void initState(){
    super.initState();
    controller.getApiGoogleBook(search);
  }






    @override
    Widget buildPage() {
      VolumeJson apiBook = controller.bookApi;
    return Scaffold(
      key: globalKey,
        appBar: AppBar(
          leading: Icon(Icons.search),
          title: TextField(
            onChanged: (String search){
              if(search.isNotEmpty) {
                controller.getApiGoogleBook(search);
              }
            },
            onSubmitted: (String search){
              if(search.isNotEmpty) {
                controller.getApiGoogleBook(search);
              }
            },
          ),
        ),
        body:  SingleChildScrollView(
          child: Center(
              child: Container(
                      width: 1000,
                      height: 1000,
                      child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                          itemCount: apiBook?.items?.length ?? 0,
                          itemBuilder: (BuildContext context, int index){
                            //return FlatButton(onPressed: (){
                              //Navigator.push(context, MaterialPageRoute(builder: (context)=>oneBook(book[index].idBook, book[index].title)));
                            //},
                                return Container(
                                  margin: EdgeInsets.only(top: 50),
                                  child: ListTile(
                                    title: Image.network(apiBook.items[index].volumeinfo.image.thumb),
                                    subtitle: Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text(apiBook.items[index].volumeinfo.title, style: TextStyle(fontFamily: 'Fredock', fontSize: 10,), textAlign: TextAlign.center, maxLines: 2),
                                    )
                                  ),
                                );
                          //  );
                          }
                      )
                  ),
            ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 2,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              title: Text('Livres'),
              backgroundColor: Colors.black26,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.style),
              title: Text('Genres'),
              backgroundColor: Colors.black26,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.grey,),
              title: Text('Recherche', style: TextStyle(color: Colors.grey),),
              backgroundColor: Colors.black26,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.perm_identity),
              title: Text('Profile'),
              backgroundColor: Colors.black26,
            )
          ],
          onTap: (index) {
            switch(index){
              case 0:
                Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
                  return HomePage();
                }));
                break;
              case 1:
                Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
                  return BookByGenre();
                }));
                break;
              case 2:
                Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
                  return searchPage();
                }));
                break;
              case 3:
                Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
                  return ProfilePage();
                }));
                break;
              default:
            }
          },
        ),
    );
  }
}