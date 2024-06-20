import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class tampilkanUser extends UserEvent {
  final bool isRefresh;
  tampilkanUser({this.isRefresh = false});

  @override
  List<Object> get props => [isRefresh];
}