import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

@immutable
abstract class UserState {
  UserState();
}

class UserInitialState extends UserState {
  UserInitialState() : super();
}

class UserOnOffLineState extends UserState {
  final bool isOnline;
  UserOnOffLineState(this.isOnline);
  @override
  List<Object> get props => [isOnline];
}
