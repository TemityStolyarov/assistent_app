part of 'main_page_bloc.dart';

sealed class MainPageState {
  int limit = 0;
  MainPageState({
    required this.limit,
  });
}

final class MainPageInitialState extends MainPageState {
  MainPageInitialState({required super.limit});
  // MainPageInitialState() : super(limit: 0);
}

// final class MainPageLoadingState extends MainPageState {
//   MainPageLoadingState({required super.limit});
// }

// final class MainPageIsLoadedState extends MainPageState {
//   MainPageIsLoadedState({required super.limit});
// }

final class MainPageOnChangeState extends MainPageState {
  MainPageOnChangeState(
    int limit,
  ) : super(limit: limit);
}
