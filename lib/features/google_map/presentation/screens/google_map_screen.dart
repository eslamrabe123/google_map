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
          if (state is GoogleMapError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: CustomTextWidget(state.error)),
            );
          }
        },
        builder: (context, state) {
          if (state is GoogleMapStyleLoaded) {
            return Scaffold(
              body: GoogleMap(
                style: state.style,
                initialCameraPosition: myPosition,
                onMapCreated: (GoogleMapController controller) {
                  mapController.complete(controller);
                },
              ),
            );
          } else if (state is GoogleMapLoading || state is GoogleMapInitial) {
            return  Scaffold(
              body: Center(child: Lottie.asset('assets/json/loading.json')),
            );
          } else {
            return  Container();
          }
        },
      ),
    );
  }


}
