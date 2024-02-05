part of 'myinv_bloc.dart';

abstract class MyInvEvent {
  const MyInvEvent();
}

class MyInvFetch extends MyInvEvent {}

class MyInvClearInvs extends MyInvEvent {}