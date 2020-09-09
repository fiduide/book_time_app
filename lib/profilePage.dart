import 'package:book_time/app/homePage/homePage_view.dart';
import 'package:book_time/oneBook.dart';
import 'package:book_time/domain/repositories/BookInterface.dart';
import 'package:book_time/domain/entity/Book.dart';
import 'package:book_time/domain/entity/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'Factory/FactoryBook.dart';

class ProfilePage extends StatelessWidget {

  final User currentUser;

  ProfilePage({this.currentUser});

  BookInterface bookSource =  (FactoryAll(1)).bookSource;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                  child: Container(
                    width: 300,
                    margin: EdgeInsets.all(30),
                    child: Padding(
                      padding: EdgeInsets.all(0),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: CircleAvatar(
                              maxRadius: 50,
                              backgroundColor: Colors.grey[700],
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text("ID user : " + currentUser.idUser),
                          Text("Email User : " + currentUser.email),
                          Text("Password User : " + currentUser.pass),
                        ],
                      ),
                    ),
                  )
              ),
              Container( // CARD BOOK
                height: 600,
                width: 300,
                child: Container(
                    child:  FutureBuilder<List<Book>>(
                      future: bookSource.getBookSaved(currentUser.idUser),
                      builder: (context, snapshot){
                        if(snapshot.connectionState == ConnectionState.done){
                          List<Book> book = snapshot.data;

                          return Container(
                            child: ListView.builder(
                              itemCount: book.length,
                              itemBuilder: (BuildContext context, int index) {
                                return FlatButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>oneBook(book[index].idBook, book[index].title)));
                                },
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: ListTile(
                                        title:  Image.asset("assets/images/book/"+book[index].isbn+".png", height: 200,),
                                      ),
                                    )
                                );
                              },
                            ),
                          );
                        }if(snapshot.connectionState == ConnectionState.waiting){
                          return CircularProgressIndicator();
                        }else {
                          return CircularProgressIndicator();
                        }
                      },
                    )
                ),
              ),
              BottomAppBar(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlatButton(onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));}, child: Text("Accueil")),
                      FlatButton(onPressed: null, child: Text("Mes favoris")),
                    ],
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
