part of 'allinv_bloc.dart';

enum AllInvStatus { initial, loading, success, failure }

class AllInvState extends Equatable {
  const AllInvState(
      {this.status = AllInvStatus.initial, this.allinvestments = const []});

  final AllInvStatus status;
  final List<Fund> allinvestments;

  AllInvState copyWith({
    AllInvStatus? status,
    List<Fund>? allinvestments,
  }) {
    return AllInvState(
        status: status ?? this.status,
        allinvestments: allinvestments ?? this.allinvestments);
  }

  @override
  List<Object?> get props => [status, allinvestments];
}