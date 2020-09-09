import 'package:book_time/domain/usecases/get_BookByGenre_usecase.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class ByGenrePresenter extends Presenter {
  Function getByGenreOnNext;
  Function getByGenreOnComplete;
  Function getByGenreOnWaiting;
  Function getByGenreOnError;

  final GetBookByGenreUseCase getBookByGenreUseCase;
  ByGenrePresenter(bookRepo) : getBookByGenreUseCase = GetBookByGenreUseCase(bookRepo);

  void getBookByGenre(String genre){
    getBookByGenreUseCase.execute(_GetBookByGenreObserver(this), GetBookByGenreParams(genre));
  }


  @override
  void dispose() {
    getBookByGenreUseCase.dispose();
  }
}

class _GetBookByGenreObserver extends Observer<GetBookByGenreUseCaseResponse> {
  final ByGenrePresenter presenter;
  _GetBookByGenreObserver(this.presenter);

  @override
  void onComplete() {
    assert(presenter.getBookByGenreUseCase != null);
    presenter.getByGenreOnComplete;
  }

  @override
  void onError(e) {
    assert(presenter.getByGenreOnComplete != null);
    presenter.getByGenreOnError(e);
  }

  @override
  void onNext(response) {
    assert(presenter.getByGenreOnNext != null);
    presenter.getByGenreOnNext(response.byGenreBook);
  }

  @override
  void onWaiting(){
    assert(presenter.getByGenreOnComplete == null);
    presenter.getByGenreOnWaiting();
  }

}