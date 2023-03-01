import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

@immutable
abstract class UserEvent {}

class UserInitialStateUserEvent extends UserEvent {
  UserInitialStateUserEvent();
}

class UserOnOffLineStateUserEvent extends UserEvent {
  final bool isOnLineOffLineUser;
  UserOnOffLineStateUserEvent(this.isOnLineOffLineUser);
}
