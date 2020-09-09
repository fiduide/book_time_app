import 'package:book_time/domain/usecases/get_allBook_usecase.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomePresenter extends Presenter {
Function getAllBookOnNext;
Function getAllBookOnComplete;
Function getAllBookOnError;
Function getAllBookOnWaiting;

final GetAllBookUseCase getAllBookUseCase;
HomePresenter(bookRepo) : getAllBookUseCase = GetAllBookUseCase(bookRepo);

void getAllBook() {
  getAllBookUseCase.execute(_GetAllBookObserver(this));
}

@override
  void dispose(){
  getAllBookUseCase.dispose();
}
}

class _GetAllBookObserver extends Observer<GetAllBookUseCaseResponse> {
  final HomePresenter presenter;
  _GetAllBookObserver(this.presenter);

  @override
  void onComplete(){
    assert(presenter.getAllBookUseCase != null);
    presenter.getAllBookOnComplete();
  }

  @override
  void onError(e){
    assert(presenter.getAllBookOnComplete != null);
    presenter.getAllBookOnError();
  }

  @override
  void onNext(response){
    assert(presenter.getAllBookOnNext != null);
    presenter.getAllBookOnNext(response.book);
  }

  @override
  void onWaiting(){
    assert(presenter.getAllBookOnComplete == null);
    presenter.getAllBookOnWaiting();
  }
}