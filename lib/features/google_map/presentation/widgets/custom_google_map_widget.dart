import 'package:flutter/material.dart';
import 'package:google_map/exports.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gmaps;

class CustomGoogleMapWidget extends StatefulWidget {
  CustomGoogleMapWidget({super.key});

  static gmaps.CameraPosition myPosition = gmaps.CameraPosition(
    target: gmaps.LatLng(31.178420171396432, 31.48565330857646),
    zoom: 14.4746,
  );

  @override
  State<CustomGoogleMapWidget> createState() => _CustomGoogleMapWidgetState();
}

class _CustomGoogleMapWidgetState extends State<CustomGoogleMapWidget> {
  final Completer<gmaps.GoogleMapController> mapController =
      Completer<gmaps.GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GoogleMapCubit, GoogleMapStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = GoogleMapCubit.get(context);
        return Scaffold(
          body: gmaps.GoogleMap(
            style: cubit.mapStyle,
            markers: cubit.markers,
            initialCameraPosition: CustomGoogleMapWidget.myPosition,
            onMapCreated: (gmaps.GoogleMapController controller) {
              mapController.complete(controller);
              cubit.setMarkersOnMap();
            },

          ),
          bottomSheet: Visibility(
            visible: cubit.isBottomSheetVisible,
            child: Container(
              height: 150.h,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Center(
                child: Text('Bottom Sheet'),
              ),
            ),
          ),
        );
      },
    );
  }
}
