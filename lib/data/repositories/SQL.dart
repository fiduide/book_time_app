
import 'package:book_time/domain/entity/Book.dart';
import 'package:book_time/domain/entity/User.dart';
import 'package:book_time/domain/repositories/BookInterface.dart';
import 'package:mysql1/mysql1.dart';

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

     await connection.query(
        "INSERT INTO utilisateur (email, pass) VALUES (? , ?)",
        [addUser.email, addUser.pass]).catchError((e) {
      print(e);
      return false;
    });
    return true;
  }


}

