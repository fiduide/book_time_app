import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:book_time/domain/entity/Book.dart';
import 'bookByGenre_presenter.dart';

class ByGenreBookController extends Controller {
  List<Book> _byGenreBook;

  List<Book> get byGenreBook => _byGenreBook;
  final ByGenrePresenter byGenrePresenter;

  ByGenreBookController(bookRepo)
      : byGenrePresenter = ByGenrePresenter(bookRepo),
        super();

  @override
  void initListeners() {
    byGenrePresenter.getByGenreOnNext = (List<Book> byGenreBook) {
      if (byGenreBook == null) {
        ScaffoldState state = getState();
        state.showSnackBar(SnackBar(content: Text(
          'Chargement des livres, veuillez patienter...',
          style: TextStyle(color: Colors.white),),
            elevation: 8,
            backgroundColor: Colors.grey[600]));
        refreshUI();
      } else {
        _byGenreBook = byGenreBook;
        refreshUI();
      }
    };

    byGenrePresenter.getByGenreOnComplete = () {
      print('bookByGenre retrieved');
    };

    byGenrePresenter.getByGenreOnError = (e) {
      print('Je n\'arrive pas à récupérer vos livres par genre');
      ScaffoldState state = getState();
      state.showSnackBar(SnackBar(content: Text(e.byGenreBook)));
      _byGenreBook = null;
      refreshUI();
    };

    byGenrePresenter.getByGenreOnWaiting = () {};
  }

  void getBookByGenre(String genre) => byGenrePresenter.getBookByGenre(genre);


  @override
  void onResumed() {
    print('en pause');
    super.onResumed();
  }

  @override
  void dispose() {
    byGenrePresenter.dispose();
    super.dispose();
  }
}
