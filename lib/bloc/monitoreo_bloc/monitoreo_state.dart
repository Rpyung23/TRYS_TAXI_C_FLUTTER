part of 'monitoreo_bloc.dart';

@immutable
abstract class MonitoreoState {
  MonitoreoState();
}

class MonitoreoInitialState extends MonitoreoState {}

class UpdateMonitoreoState extends MonitoreoState {
  LatLng LatLngMonitoreo;
  double rumboMonitoreo;
  UpdateMonitoreoState(this.LatLngMonitoreo, this.rumboMonitoreo);
  @override
  List<Object> get props => [LatLngMonitoreo, rumboMonitoreo];
}
