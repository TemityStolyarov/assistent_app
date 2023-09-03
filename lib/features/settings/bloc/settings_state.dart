part of 'settings_bloc.dart';

sealed class SettingsState {
  int limit = 0;
  SettingsState({
    required this.limit,
  });
}

final class SettingsInitialState extends SettingsState {
  SettingsInitialState({required super.limit});
}

final class SettingsInitializedState extends SettingsState {
  SettingsInitializedState(
    int limit,
  ) : super(limit: limit);
}
