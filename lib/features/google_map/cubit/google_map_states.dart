abstract class GoogleMapStates {}

class GoogleMapInitial extends GoogleMapStates {}

class GoogleMapStyleLoaded extends GoogleMapStates {}

class GoogleMapError extends GoogleMapStates {
  final String error;

  GoogleMapError(this.error);
}

class GoogleMapLoading extends GoogleMapStates {}

class GoogleMapMarkersLoaded extends GoogleMapStates {}

class GoogleMapBottomSheetVisibilityChanged extends GoogleMapStates {}
