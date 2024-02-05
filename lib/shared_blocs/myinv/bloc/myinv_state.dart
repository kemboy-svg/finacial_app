part of 'myinv_bloc.dart';

enum MyInvStatus {
  initial,
  loading,
  success,
  failure,
}

class MyInvState extends Equatable {
  const MyInvState(
      {this.status = MyInvStatus.initial, this.investments = const []});

  final MyInvStatus status;
  final List<Investment> investments;

  /// We implemented copyWith so that we can copy an instance of it and
  /// update zero or more properties conveniently
  MyInvState copyWith({
    MyInvStatus? status,
    List<Investment>? investments,
  }) {
    return MyInvState(
        status: status ?? this.status,
        investments: investments ?? this.investments);
  }

  @override
  List<Object?> get props => [status, investments];
}