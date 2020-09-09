import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:book_time/domain/entity/Book.dart';

import 'homePage_presenter.dart';

class HomePageController extends Controller {

  List<Book> _book;
  List<Book>  get book => _book;
  final HomePresenter homePresenter;

  HomePageController(bookRepo): homePresenter = HomePresenter(bookRepo), super();

  @override
  void initListeners() {
    homePresenter.getAllBookOnNext =  (List<Book> book) {
      if(book == null){
        ScaffoldState state = getState();
        state.showSnackBar(SnackBar(content: Text(
          'Chargement des livres, veuillez patienter...',
          style: TextStyle(color: Colors.white, fontFamily: 'Fredock'),
        ),
          backgroundColor: Colors.grey[600],
          elevation: 8,
        ));
        refreshUI();
      }else {
        _book = book;
        refreshUI();
      }
    };
    homePresenter.getAllBookOnComplete = () {
      print('Book reçus !');
    };

    homePresenter.getAllBookOnError = (e) {
      print('Erreur pour récuperer les livres');
      ScaffoldState state = getState();
      state.showSnackBar(SnackBar(content: Text(e.book)));
      _book = null;
      refreshUI();
    };

    homePresenter.getAllBookOnWaiting = () {
      ScaffoldState state = getState();
      state.showSnackBar(SnackBar(content: Text(
        'Chargement des livres, veuillez patienter...',
        style: TextStyle(color: Colors.white, fontFamily: 'Fredock'),
      ),
        backgroundColor: Colors.grey[600],
        elevation: 8,
      ));
      refreshUI();
    };
  }

  void getAllBook() => homePresenter.getAllBook();

  @override
  void onResumed(){
    print('en pause');
    super.onResumed();
  }

  @override
  void dispose(){
    homePresenter.dispose();
    super.dispose();
  }


}