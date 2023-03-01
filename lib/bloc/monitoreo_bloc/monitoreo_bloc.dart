import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

part 'monitoreo_event.dart';
part 'monitoreo_state.dart';

class MonitoreoBloc extends Bloc<MonitoreoEvent, MonitoreoState> {
  MonitoreoBloc() : super(MonitoreoInitialState()) {
    on<UpdateMonitoreoEvent>((event, emit) {
      // TODO: implement event handler
      print("UPDATE MONITOREO");
      emit(UpdateMonitoreoState(
          event.LatLngMoniteoEvent, event.rumboMoniteoEvent));
    });
  }
}
