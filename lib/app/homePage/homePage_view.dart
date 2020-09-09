import 'package:book_time/Factory/FactoryBook.dart';
import 'package:book_time/app/bookByGenre/bookByGenre_view.dart';
import 'package:book_time/app/homePage/homePage_controller.dart';
import 'package:book_time/domain/entity/Book.dart';
import 'package:book_time/domain/entity/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:book_time/domain/repositories/BookInterface.dart';
import '../../profilePage.dart';


class HomePage extends View {
 final User currentUser;
 HomePage({this.currentUser});

  @override
State<StatefulWidget> createState() => HomePageState(this.currentUser);
}

class HomePageState extends ViewState<HomePage, HomePageController> {

  User currentUser;
  HomePageState(this.currentUser) :  super(HomePageController(bookSource));

  static BookInterface bookSource =  (FactoryAll(1)).bookSource;

  void initState(){
    super.initState();
    controller.getAllBook();
  }


  @override
  Widget buildPage() {
    List<Book> book = controller.book;
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 1000,
                    height: 600,
                    margin: EdgeInsets.only(top: 30),
                    child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                        itemCount: book?.length ?? 0,
                        itemBuilder: (BuildContext context, int index){
                          return FlatButton(onPressed: (){
                            //Navigator.push(context, MaterialPageRoute(builder: (context)=>oneBook(book[index].idBook, book[index].title)));
                          },
                              child: Container(
                                height: 300.0,
                                width: 1000.0,
                                child: ListTile(
                                  title:  Image.asset("assets/images/book/"+book[index].isbn+".png", height: 200,),
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
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.book, color: Colors.grey,),
                title: Text('Livres', style: TextStyle(color: Colors.grey),),
                backgroundColor: Colors.black26,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.style),
              title: Text('Genres'),
              backgroundColor: Colors.black26,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Recherche'),
              backgroundColor: Colors.black26,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.perm_identity),
              title: Text(''),
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
                //return searchBook();
              }));
              break;
            case 3:
              Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
                return ProfilePage(currentUser: currentUser,);
              }));
              break;
            default:
          }
        },
      ),
    );
  }

}