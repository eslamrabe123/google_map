import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/data_source/dio_helper.dart';
import '../../../core/utiles/Locator.dart';
import '../domain/repository/repository.dart';
import 'google_map_states.dart';

class GoogleMapCubit extends Cubit<GoogleMapStates> {
  GoogleMapCubit() : super(GoogleMapInitial());
  static GoogleMapCubit get(context) => BlocProvider.of(context);
  
 GoogleMapRepository google_mapRepository =  GoogleMapRepository(locator<DioService>());
}