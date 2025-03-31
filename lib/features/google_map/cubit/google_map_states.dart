abstract class GoogleMapStates {}

class GoogleMapInitial extends GoogleMapStates {}

class GoogleMapStyleLoaded extends GoogleMapStates {
  final String style;

  GoogleMapStyleLoaded(this.style);
}

class GoogleMapError extends GoogleMapStates {
  final String error;

  GoogleMapError(this.error);
}

class GoogleMapLoading extends GoogleMapStates {}