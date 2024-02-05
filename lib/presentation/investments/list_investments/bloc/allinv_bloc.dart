import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:data_api/data_api.dart';
import 'package:invst_repo/invst_repo.dart';

part 'allinv_event.dart';
part 'allinv_state.dart';

class AllInvBloc extends Bloc<AllInvEvent, AllInvState> {
  AllInvBloc({required InvstRepo invRepo})
      : _invRepo = invRepo,
        super(const AllInvState()) {
    on<AllInvFetch>(_onAllInvFetch);
  }

  final InvstRepo _invRepo;

  Future<void> _onAllInvFetch(
      AllInvFetch event, Emitter<AllInvState> emit) async {
    emit(state.copyWith(status: AllInvStatus.loading));

    try {
      List<Fund> investments = await _invRepo.getAllInv();

      return emit(state.copyWith(
          status: AllInvStatus.success, allinvestments: investments));
    } catch (e) {
      print('_onAllInvFetch error: ${e}');
      emit(state.copyWith(status: AllInvStatus.failure));
    }
  }
}