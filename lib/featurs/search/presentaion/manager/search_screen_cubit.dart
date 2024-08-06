

import 'dart:async';

import 'package:bi/featurs/homeScreen/data/models/add_profile_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import '../../../../helper/nav.dart';
import '../../../../route/paths.dart';
import '../../../../widgeta/contex.dart';
import '../../domain/use_cases/use_case.dart';

part 'search_screen_state.dart';

class SearchScreenCubit extends Cubit<SearchScreenState> {
  final  SearchScreenUseCase _screenUseCase;
  SearchScreenCubit( this._screenUseCase) : super(SearchScreenInitial());

  @override
  close() async {
    searchController.clear();
    searchResultsFrom = [];
    selectedMovie = null;
    super.close();
  }
 void resetState() {
  searchController.clear();
  searchResultsFrom = [];
  selectedMovie = null;
  emit(SearchScreenInitial());
}

  List <Movie>searchResultsFrom = <Movie>[];
  bool isDataLoading=false;

  searchAboutMovie(String searchTerm) async {
     isDataLoading=true;
    emit(LoadingSearchingSuggestion());


    var result =  await  _screenUseCase
      (searchTerm);
    result.whenOrNull(
      success: (data) {
        searchResultsFrom = data.data??[];
      },
      error: (error  , sresult) {
        emit(SearchingSuggestionErrorState(  error.toString()));
      },

    );
    emit(SearchingSuggestionLoadedState());
    isDataLoading=false;
    return searchResultsFrom;
  }

///get one
  TextEditingController  searchController  = TextEditingController();
  FocusNode  searchFocusNode = FocusNode();

  Movie ?selectedMovie;
  getLocationOfSelectedSearchItem(Movie item ,{context}) async {
    FocusScope.of(context).unfocus();
    searchController.text = item.title.toString();
    // searchResultsFrom = [];
    selectedMovie = item;
    NavigationHelper.navigateTo(context, AppPaths. detailsScreen,
        arguments: selectedMovie?.toMap());
    emit(SearchingSuggestionLoadedState());


  }
///for delay the search on change func

  Timer? _debounce;
  debounceFunction(Function() action) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      action();
    });
  }
  onChanged(value) async {


    await  debounceFunction(() async {
      print('onChanged: $value');

      if (value == null || value.isEmpty) {
        searchResultsFrom = [];
        // isDataLoading=false;
        FocusScope.of(ConText.context!).unfocus();
        emit(SearchingSuggestionLoadedState());
        return;
      }
      await searchAboutMovie(value);

      emit(SearchingSuggestionLoadedState());
      return;


    });
  }



}
