import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_map/core/resources/assets.gen.dart';
import '../../../core/data_source/dio_helper.dart';
import '../../../core/utiles/Locator.dart';
import '../domain/repository/repository.dart';
import 'google_map_states.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gmaps;

class GoogleMapCubit extends Cubit<GoogleMapStates> {
  GoogleMapCubit() : super(GoogleMapInitial());

  static GoogleMapCubit get(context) => BlocProvider.of(context);

  GoogleMapRepository googleMapRepository = GoogleMapRepository(locator<DioService>());
  String? mapStyle;

  loadMapStyle(BuildContext context) async {
    emit(GoogleMapLoading());
    final style = await DefaultAssetBundle.of(context).loadString(Assets.json.mapStyle);
    if (style.isEmpty) {
      emit(GoogleMapError('Error loading map style'));
    } else {
      mapStyle = style;
      emit(GoogleMapStyleLoaded());
    }
  }

  bool isBottomSheetVisible = false;

  void toggleBottomSheet() {
    isBottomSheetVisible = !isBottomSheetVisible;
    emit(GoogleMapBottomSheetVisibilityChanged());
  }

  Set<gmaps.Marker> markers = {};

  setMarkersOnMap() async {
    emit(GoogleMapLoading());

    await getMarkerIcon(Assets.images.newMarker.path).then(
      (path) {
        markers.add(
          gmaps.Marker(
            markerId: const gmaps.MarkerId('3'),
            position: const gmaps.LatLng(31.178420171396422, 31.48565330857640),
            icon: path,
            infoWindow: const gmaps.InfoWindow(title: 'My Location'),
            onTap: () => toggleBottomSheet(),
          ),
        );
      },
    );
    emit(GoogleMapMarkersLoaded());
  }

  Future<gmaps.BitmapDescriptor> getMarkerIcon(String path) async {
    final gmaps.BitmapDescriptor bitmapDescriptor = await gmaps.BitmapDescriptor.asset(ImageConfiguration(size: Size(48.w, 48.h)), path);
    return bitmapDescriptor;
  }
}
