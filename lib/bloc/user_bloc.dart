import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_event.dart';
import 'user_state.dart';
import 'package:flutter_suit_question1_dika/model/getuser_api.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState()) {
    on<tampilkanUser>(_ontampilkanUser);
  }

  void _ontampilkanUser(tampilkanUser event, Emitter<UserState> emit) async {
    if (event.isRefresh) {
      emit(state.copyWith(users: [], hasMoreData: true, currentPage: 1));
    }

    if (!state.hasMoreData || state.isLoadingMore) return;

    emit(state.copyWith(isLoadingMore: true));

    final newUsers = await ApiService.tampilkanUser(state.currentPage, 10);
    if (newUsers.isNotEmpty) {
      emit(state.copyWith(
        users: List.from(state.users)..addAll(newUsers),
        currentPage: state.currentPage + 1,
        isLoadingMore: false,
      ));
    } else {
      emit(state.copyWith(hasMoreData: false, isLoadingMore: false));
    }
  }
}