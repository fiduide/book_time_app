
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:book_time/domain/entity/Book.dart';
import 'package:book_time/domain/entity/User.dart';
import 'package:book_time/domain/entity/googleApiBook.dart';
import 'package:book_time/domain/repositories/BookInterface.dart';
import 'package:http/http.dart';
import 'package:mysql1/mysql1.dart';
import 'package:flutter/material.dart';

class SQL implements BookInterface {



  Future<List<Book>> getBookSaved(String idUser) async {
    List<Book> bookList = [];

    var settings = new ConnectionSettings(
    host: 'cappedorian.fr',
    port: 3306,
    user: 'c1453962c_root',
    password: 'fiduide161100',
    db: 'c1453962c_BookTime',
    );

    var connection = await MySqlConnection.connect(settings);

    Results results =
    await connection.query('SELECT * FROM book_saved LEFT JOIN book ON book.id = book_saved.idBook WHERE idUser = ? ', [idUser]).catchError((e) {
      print(e);
      return false;
    });

    for (var table in results.toList()) {
      Book query = new Book();
      query.idBook = table[0].toString();
      query.isbn = table[3].toString();
      query.title = table[4].toString();
      bookList.add(query);
    }
    return bookList;
  }

  Future<List<Book>> getBookByGenre({String genre}) async {
    List<Book> bookList = [];

    var settings = new ConnectionSettings(
      host: 'cappedorian.fr',
      port: 3306,
      user: 'c1453962c_root',
      password: 'fiduide161100',
      db: 'c1453962c_BookTime',
    );

    var connection = await MySqlConnection.connect(settings);

    Results results =
    await connection.query('SELECT * FROM book WHERE genre = ?', [genre]).catchError((e) {
      print(e);
      return false;
    });

    for (var table in results.toList()) {
      Book query = new Book();
      query.idBook = table[0].toString();
      query.isbn = table[1].toString();
      query.title = table[2].toString();
      bookList.add(query);
    }
    return bookList;
  }



  Future<List<Book>> getAllBook() async {
    List<Book> bookList = [];

    var settings = new ConnectionSettings(
      host: 'cappedorian.fr',
      port: 3306,
      user: 'c1453962c_root',
      password: 'fiduide161100',
      db: 'c1453962c_BookTime',
    );

    var connection = await MySqlConnection.connect(settings);

    Results results =
    await connection.query('SELECT * FROM book').catchError((e) {
      print(e);
      return false;
    });

    for (var table in results.toList()) {
      Book query = new Book();
      query.idBook = table[0].toString();
      query.isbn = table[1].toString();
      query.title = table[2].toString();
      bookList.add(query);
    }
    return bookList;
  }



  Future<bool> addUser(User addUser) async {
    var settings = new ConnectionSettings(
      host: 'cappedorian.fr',
      port: 3306,
      user: 'c1453962c_root',
      password: 'fiduide161100',
      db: 'c1453962c_BookTime',
    );

    var connection = await MySqlConnection.connect(settings);

    Results results = await connection.query(
        "SELECT * FROM utilisateur WHERE email = ?",
        [addUser.email]).catchError((e) {
      print(e);
      return false;
    });

    if(results.isEmpty){
      await connection.query(
          "INSERT INTO utilisateur (email, pass) VALUES (? , ?)",
          [addUser.email, addUser.pass]).catchError((e) {
        print(e);
        return false;
      });
      return true;
    }
    else{
      return false;
    }
  }

  Future<VolumeJson> getBookWithSearch({String search}) async {

    VolumeJson volumeList;

    print('Im Starting');

    Response jsonResponse = await http.get('https://www.googleapis.com/books/v1/volumes?q=$search&printType=books&maxResults=15&filter=ebooks');

    Map jsonBody = json.decode(jsonResponse.body);
    print(jsonBody);

    volumeList = VolumeJson.fromJson(jsonBody);


    return volumeList;

  }


}

