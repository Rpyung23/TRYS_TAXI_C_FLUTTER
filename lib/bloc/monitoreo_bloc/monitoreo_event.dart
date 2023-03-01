part of 'monitoreo_bloc.dart';

@immutable
abstract class MonitoreoEvent {
  MonitoreoEvent();
}

class UpdateMonitoreoEvent extends MonitoreoEvent {
  LatLng LatLngMoniteoEvent;
  double rumboMoniteoEvent;
  UpdateMonitoreoEvent(this.LatLngMoniteoEvent, this.rumboMoniteoEvent);
}
