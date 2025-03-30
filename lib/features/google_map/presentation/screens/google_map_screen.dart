import 'package:flutter/material.dart';
import 'package:google_map/exports.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoogleMapCubit(),
      child: BlocConsumer<GoogleMapCubit, GoogleMapStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = GoogleMapCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  CustomTextWidget("GoogleMapScreen"),
                  // AIzaSyBGNgsJDUY6rwNB6zVzHbIfel_BHqJuyEI?
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
