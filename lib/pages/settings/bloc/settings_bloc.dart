// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitialState(limit: 0)) {
    on<SettingsChangedEvent>((event, emit) async {
      SharedPreferences? prefs = await SharedPreferences.getInstance();
      state.limit = prefs.getInt('limit')!;
      emit(SettingsInitializedState(state.limit));
    });
  }
}
