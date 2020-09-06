import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Factory/FactoryBook.dart';
import 'domain/repositories/BookInterface.dart';
import 'domain/entity/Book.dart';
import 'oneBook.dart';



class HomePage extends StatelessWidget {

  BookInterface adapterSource =  (FactoryAll(1)).adapterSource;
  
  Widget CreateListbyGenre(String genre){
    return FutureBuilder(
        future: adapterSource.getBookByGenre(genre),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            List<Book> book = snapshot.data;

            return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemCount: book.length,

                itemBuilder: (BuildContext context, int index){
                  return FlatButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>oneBook(book[index].idBook, book[index].title)));
                  },
                      child: Container(
                        height: 350.0,
                        width: 100.0,
                        child: ListTile(
                          title:  Image.asset("assets/images/book/"+book[index].isbn+".png", height: 200,),
                        ),
                      )
                  );
                }
            );
          }if(snapshot.connectionState == ConnectionState.waiting){
            return CircularProgressIndicator();
          }else {
            return CircularProgressIndicator();
          }
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: 1000,
          width: 600,
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child:  Text('Roman', style: TextStyle(color: Colors.red, fontSize: 22),),
                      ),
                      FlatButton(onPressed: null, child: Text('Voir plus', style: TextStyle(color: Colors.red, fontSize: 22))),
                    ],
                  )
                ),
                Container(
                  height: 300,
                  width: 600,
                  child: CreateListbyGenre('Roman'),
                ),
                Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child:  Text('Horreur', style: TextStyle(color: Colors.red, fontSize: 22),),
                        ),
                        FlatButton(onPressed: null, child: Text('Voir plus', style: TextStyle(color: Colors.red, fontSize: 22))),
                      ],
                    )
                ),
                Container(
                  height: 300,
                  width: 600,
                  child: CreateListbyGenre('Horreur'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}