import 'package:assistent_app/core/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'main_page_event.dart';
part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  MainPageBloc() : super(MainPageInitialState(limit: 0)) {
    on<MainPageOnChangeEvent>((event, emit) async {
      SharedPreferences? prefs = await SharedPreferences.getInstance();
      if (prefs.getInt('limit') == null) {
        await prefs.setInt('limit', mainScreenTaskListLimit);
      }
      state.limit = prefs.getInt('limit')!;
      emit(MainPageOnChangeState(state.limit));
    });
  }
}
