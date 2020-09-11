import 'dart:async';
import 'package:book_time/domain/entity/Book.dart';
import 'package:book_time/domain/entity/googleApiBook.dart';
import 'package:book_time/domain/repositories/BookInterface.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class ApiGoogleBookUseCase extends UseCase<GetApiGoogleBookUseCaseResponse, GetApiGoogleBookUseCaseParams> {

  BookInterface bookSource;
  ApiGoogleBookUseCase([this.bookSource]);

  @override
  Future<Stream<GetApiGoogleBookUseCaseResponse>> buildUseCaseStream(GetApiGoogleBookUseCaseParams params) async {
    StreamController apiController = StreamController <GetApiGoogleBookUseCaseResponse>();
    try{
      //GetBooks
      VolumeJson bookApiGoogle = await bookSource.getBookWithSearch(search: params.search);
      apiController.add(GetApiGoogleBookUseCaseResponse(bookApiGoogle));
      logger.finest('GOOGLE  a été réussi');
      apiController.close();
    }catch (e){
      logger.severe('GOOGLE API n a pas fonctionné...');
      apiController.addError(e);
    }
    return apiController.stream;
  }

}

class GetApiGoogleBookUseCaseResponse{
  VolumeJson bookApiGoogle;
  GetApiGoogleBookUseCaseResponse(this.bookApiGoogle);
}

class GetApiGoogleBookUseCaseParams {
  final String search;
  GetApiGoogleBookUseCaseParams(this.search);

}