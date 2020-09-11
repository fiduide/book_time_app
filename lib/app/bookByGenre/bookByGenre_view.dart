import 'package:book_time/Factory/FactoryBook.dart';
import 'package:book_time/app/homePage/homePage_controller.dart';
import 'package:book_time/app/homePage/homePage_view.dart';
import 'package:book_time/app/searchPage/searchPage_view.dart';
import 'package:book_time/domain/entity/Book.dart';
import 'package:book_time/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:book_time/domain/repositories/BookInterface.dart';

import 'bookByGenre_controller.dart';


class BookByGenre extends View {
  @override
  State<StatefulWidget> createState() => BookByGenreState();
}

class BookByGenreState extends ViewState<BookByGenre, ByGenreBookController> {
  BookByGenreState() : super(ByGenreBookController(bookSource));

  int _currentIndex = 1;

  static BookInterface bookSource =  (FactoryAll(1)).bookSource;

  String genre = 'Roman';
  
  void changeToRoman(){
    setState(() {
      this.genre = 'Roman';
      controller.getBookByGenre(genre);
    });
  }

  void changeToHorreur(){
    setState(() {
      this.genre = 'Horreur';
      controller.getBookByGenre(genre);
    });
  }

  void changeToFantasy(){
    setState(() {
      this.genre = 'Fantasy';
      controller.getBookByGenre(genre);
    });
  }

  void initState(){
    super.initState();
    controller.getBookByGenre(genre);
  }


  @override
  Widget buildPage() {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Center(
              child: Text('Genres')
            ),
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: Colors.grey,
              indicatorWeight: 6.0,
              onTap: (index){
                switch(index){
                  case 0:
                    setState(() {
                      this.genre = 'Roman';
                      controller.getBookByGenre(genre);
                    });
                    break;
                  case 1:
                    setState(() {
                      this.genre = 'Horreur';
                      controller.getBookByGenre(genre);
                    });
                    break;
                  case 2:
                    setState(() {
                      this.genre = 'Fantasy';
                      controller.getBookByGenre(genre);
                    });
                    break;
                  case 3:
                    setState(() {
                      this.genre = 'Nouvelle';
                      controller.getBookByGenre(genre);
                    });
                    break;
                  case 4:
                    setState(() {
                      this.genre = 'Policier';
                      controller.getBookByGenre(genre);
                    });
                    break;
                  case 5:
                    setState(() {
                      this.genre = 'Science-fiction';
                      controller.getBookByGenre(genre);
                    });
                    break;
                  default:
                }
              },
              tabs: <Widget>[
                Tab(
                  child: Container(
                    child: Text('Roman'),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text('Horreur'),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text('Fantasy'),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text('Nouvelle'),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text('Policier'),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text('Science-Fiction'),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text('Poésie'),
                  ),
                ),
              ],
            )
        ),
        key: globalKey,
        backgroundColor: Colors.grey[800],
        body: ListBook(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              title: Text('Livres'),
              backgroundColor: Colors.black26,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.style, color: Colors.grey,),
              title: Text('Genres', style: TextStyle(color: Colors.grey),),
              backgroundColor: Colors.black26,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Recherche'),
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
      ),
    );
  }

  Widget ListBook(){
    List<Book> byGenreBook = controller.byGenreBook;

    return SingleChildScrollView(

      child: Container(
        child: Center(
          child: Column(
            children: [
              Container(
                  width: 1000,
                  height: 1000,
                  margin: EdgeInsets.only(top: 30),
                  child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                      itemCount: byGenreBook?.length ?? 0,
                      itemBuilder: (BuildContext context, int index){
                        return FlatButton(onPressed: (){
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>oneBook(book[index].idBook, book[index].title)));
                        },
                            child: Container(
                              child: ListTile(
                                title:  Image.asset("assets/images/book/"+byGenreBook[index].isbn+".png", height: 200,),
                                subtitle: Text(byGenreBook[index].title),
                              ),
                            )
                        );
                      }
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}