import 'dart:async';
import 'package:book_time/domain/entity/Book.dart';
import 'package:book_time/domain/repositories/BookInterface.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GetBookByGenreUseCase extends UseCase<GetBookByGenreUseCaseResponse, GetBookByGenreParams> {

  BookInterface bookSource;
  GetBookByGenreUseCase([this.bookSource]);

  @override
  Future<Stream<GetBookByGenreUseCaseResponse>> buildUseCaseStream(GetBookByGenreParams params) async {
    StreamController bookController = StreamController <GetBookByGenreUseCaseResponse>();
    try{
      //GetBooks
      List<Book> byGenreBook = await bookSource.getBookByGenre(genre: params.genre);
      bookController.add(GetBookByGenreUseCaseResponse(byGenreBook));
      logger.finest('GetAllBookUseCase a été réussi');
      bookController.close();
    }catch (e){
      logger.severe('GetAllBookUseCase n a pas fonctionné...');
      bookController.addError(e);
    }
    return bookController.stream;
  }

}

class GetBookByGenreUseCaseResponse{
  List<Book> byGenreBook;
  GetBookByGenreUseCaseResponse(this.byGenreBook);
}

class GetBookByGenreParams {
  final String genre;
  GetBookByGenreParams(this.genre);

}