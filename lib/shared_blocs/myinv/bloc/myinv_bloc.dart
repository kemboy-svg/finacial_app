import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:invst_repo/invst_repo.dart';
import 'package:data_api/data_api.dart';

part 'myinv_event.dart';
part 'myinv_state.dart';

class MyInvBloc extends Bloc<MyInvEvent, MyInvState> {
  MyInvBloc({required InvstRepo invRepo})
      : _invRepo = invRepo,
        super(const MyInvState()) {
    // calls the constructor in MyInvState to set the initial values
    on<MyInvFetch>(_onInvFetch);
    on<MyInvClearInvs>(_onInvReset);
  }

  final InvstRepo _invRepo;

  Future<void> _onInvReset(
      MyInvClearInvs event, Emitter<MyInvState> emit) async {
    return emit(state.copyWith(status: MyInvStatus.initial, investments: []));
  }

  Future<void> _onInvFetch(MyInvFetch event, Emitter<MyInvState> emit) async {
    // emit(state.copyWith(status: () => TodosOverviewStatus.loading));
    emit(state.copyWith(status: MyInvStatus.loading));

    try {
      List<Investment> invs = await _invRepo.listMyInv();

      return emit(
          state.copyWith(status: MyInvStatus.success, investments: invs));
    } catch (e) {
      emit(state.copyWith(status: MyInvStatus.failure));
    }
  }
}