part of 'search_screen_cubit.dart';

@immutable
sealed class SearchScreenState {}
 class SearchScreenInitial extends SearchScreenState {}


///search


class LoadingSearchingSuggestion      extends SearchScreenState{}
class SearchingSuggestionLoadedState      extends SearchScreenState{}
class SelectedSuggestionState      extends SearchScreenState{
  final Movie movie;
  SelectedSuggestionState(this.movie);
}



class SearchingSuggestionErrorState      extends SearchScreenState{
  final String error;
  SearchingSuggestionErrorState(this.error);
}
