part of 'main_page_bloc.dart';

sealed class MainPageEvent {
  MainPageEvent();
}

final class MainPageInitialEvent extends MainPageEvent {}

final class MainPageOnChangeEvent extends MainPageEvent {
  MainPageOnChangeEvent();
}