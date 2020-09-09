import 'dart:async';
import 'package:book_time/domain/entity/Book.dart';
import 'package:book_time/domain/repositories/BookInterface.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GetAllBookUseCase extends UseCase<GetAllBookUseCaseResponse, GetAllBookParams> {

BookInterface bookSource;
GetAllBookUseCase([this.bookSource]);

@override
Future<Stream<GetAllBookUseCaseResponse>> buildUseCaseStream(GetAllBookParams params) async {
  StreamController bookController = StreamController <GetAllBookUseCaseResponse>();
    try{
      //GetBooks
      List<Book> book = await bookSource.getAllBook();
      bookController.add(GetAllBookUseCaseResponse(book));
      logger.finest('GetAllBookUseCase a été réussi');
      bookController.close();
    }catch (e){
      logger.severe('GetAllBookUseCase n a pas fonctionné...');
      bookController.addError(e);
    }
    return bookController.stream;
    }

}

class GetAllBookUseCaseResponse{
List<Book> book;
GetAllBookUseCaseResponse(this.book);
}

class GetAllBookParams {

String uid;
GetAllBookParams(this.uid);

}