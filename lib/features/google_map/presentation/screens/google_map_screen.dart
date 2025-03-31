import 'package:flutter/material.dart';
import 'package:google_map/exports.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  final Completer<GoogleMapController> mapController = Completer<GoogleMapController>();

  static const CameraPosition myPosition = CameraPosition(
    target: LatLng(31.178420171396432, 31.48565330857646),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoogleMapCubit()..loadMapStyle(context),
      child: BlocConsumer<GoogleMapCubit, GoogleMapStates>(
        listener: (context, state) {
          if (state is GoogleMapError) Alerts.snack(text: state.error, state: SnackState.failed);
        },
        builder: (context, state) {
          if (state is GoogleMapLoading || state is GoogleMapInitial) {
            return Scaffold(
              body: const Center(child: CircularProgressIndicator()),
            );
          } else if (state is GoogleMapStyleLoaded) {
            return Scaffold(
              body: GoogleMap(
                style: state.style,
                initialCameraPosition: myPosition,
                onMapCreated: (GoogleMapController controller) {
                  mapController.complete(controller);
                },
              ),
            );
          } else {
            return Container(
              width: double.infinity,
              height: double.infinity,
              child: const Center(
                child: CustomTextWidget('Unknown Error'),
              ),
            );
          }
        },
      ),
    );
  }
}
