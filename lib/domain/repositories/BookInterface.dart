import 'package:book_time/domain/entity/Book.dart';
import 'package:book_time/domain/entity/User.dart';

abstract class BookInterface {

  Future<bool> addUser(User addUser);

  Future<List<Book>> getBookSaved(String idUser);

  Future<List<Book>> getBookByGenre(String genre);

  Future<List<Book>> getAllBook();
}