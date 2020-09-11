import 'package:book_time/domain/usecases/get_apiGoogleBook_usecase.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SearchPagePresenter extends Presenter {
  Function getApiBookOnNext;
  Function getApiBookOnComplete;
  Function getApiBookOnWaiting;
  Function getApiBookOnError;

  final ApiGoogleBookUseCase apiGoogleBookUseCase;
  SearchPagePresenter(bookRepo) : apiGoogleBookUseCase = ApiGoogleBookUseCase(bookRepo);

  void getBookApiBook(String search){
    apiGoogleBookUseCase.execute(_GetApiGoogleObserver(this), GetApiGoogleBookUseCaseParams(search));
  }


  @override
  void dispose() {
    apiGoogleBookUseCase.dispose();
  }
}

class _GetApiGoogleObserver extends Observer<GetApiGoogleBookUseCaseResponse> {
  final SearchPagePresenter presenter;
  _GetApiGoogleObserver(this.presenter);

  @override
  void onComplete() {
    assert(presenter.apiGoogleBookUseCase != null);
    presenter.getApiBookOnComplete();
  }

  @override
  void onError(e) {
    assert(presenter.getApiBookOnComplete != null);
    presenter.getApiBookOnError(e);
  }

  @override
  void onNext(response) {
    assert(presenter.getApiBookOnNext != null);
    presenter.getApiBookOnNext(response.bookApiGoogle);
  }

  void onWaiting(){
    assert(presenter.getApiBookOnComplete == null);
    presenter.getApiBookOnWaiting();
  }

}