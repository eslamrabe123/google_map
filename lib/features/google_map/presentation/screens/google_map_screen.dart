import 'package:flutter/material.dart';
import 'package:google_map/exports.dart';

class GoogleMapScreen extends StatelessWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoogleMapCubit()..loadMapStyle(context),
      child: BlocConsumer<GoogleMapCubit, GoogleMapStates>(
        listener: (context, state) {
          if (state is GoogleMapError)
            Alerts.snack(text: state.error, state: SnackState.failed);
        },
        builder: (context, state) {
          return CustomGoogleMapWidget();
        },
      ),
    );
  }
}
