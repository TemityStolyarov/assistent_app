import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'main_page_event.dart';
part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  MainPageBloc() : super(MainPageInitialState(limit: 0)) {
    on<MainPageOnChangeEvent>((event, emit) async {
      SharedPreferences? prefs = await SharedPreferences.getInstance();
      state.limit = prefs.getInt('limit')!;
      emit(MainPageOnChangeState(state.limit));
    });
  }
}
