import 'package:book_time/app/searchPage/searchPage_presenter.dart';
import 'package:book_time/domain/entity/googleApiBook.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';



class SearchPageController extends Controller {
  VolumeJson _bookApi;

  VolumeJson get bookApi => _bookApi;
  final SearchPagePresenter searchPagePresenter;

  SearchPageController(bookRepo)
      : searchPagePresenter = SearchPagePresenter(bookRepo),
        super();

  @override
  void initListeners() {
    searchPagePresenter.getApiBookOnNext = (VolumeJson bookApi) {
      if (bookApi == null) {
        ScaffoldState state = getState();
        state.showSnackBar(SnackBar(content: Text(
          'Chargement des livres, veuillez patienter...',
          style: TextStyle(color: Colors.white),),
            elevation: 8,
            backgroundColor: Colors.grey[600]));
        refreshUI();
      } else {
        _bookApi = bookApi;
        refreshUI();
      }
    };

    searchPagePresenter.getApiBookOnComplete = () {
      print('API google retrieved');
    };

    searchPagePresenter.getApiBookOnError = (e) {
      print('Je n\'arrive pas à récupérer vos livres par APIGOOGLE');
      ScaffoldState state = getState();
      state.showSnackBar(SnackBar(content: Text(e.bookApi)));
      _bookApi = null;
      refreshUI();
    };

    searchPagePresenter.getApiBookOnWaiting = () {};
  }

  void getApiGoogleBook(String search) => searchPagePresenter.getBookApiBook(search);


  @override
  void onResumed() {
    print('en pause');
    super.onResumed();
  }

  @override
  void dispose() {
    searchPagePresenter.dispose();
    super.dispose();
  }
}
