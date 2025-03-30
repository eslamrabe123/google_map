import '../../exports.dart';


class DioService {
  Dio _mydio = Dio();

  DioService([String baseUrl = AppConfig.baseUrl, BaseOptions? options]) {
    _mydio = Dio(
      BaseOptions(
          headers: {
            "Accept": "application/json",
            'Content-Type': "application/x-www-form-urlencoded",
          },
          baseUrl: baseUrl,
          contentType: "application/x-www-form-urlencoded",
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(milliseconds: 30000),
          receiveTimeout: const Duration(milliseconds: 30000),
          sendTimeout: const Duration(milliseconds: 30000)),
    )..interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
  }

  Future<ApiResponse> postData({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    bool loading = false,
    bool isForm = false,
    bool isFile = false,
  }) async {
    _mydio.options.headers["Authorization"] = 'Bearer ${Utils.token}';
    if (isFile == true) {
      _mydio.options.headers["Content-Type"] = 'multipart/form-data';
    }
    if (kDebugMode) {
      (FormData.fromMap(body ?? {}).fields).toString().logIfDebug();
    }
    try {
      if (loading) {
        MyLoading.show();
      }
      final response = await _mydio.post(url,
          queryParameters: query,
          data: isForm ? FormData.fromMap(body ?? {}) : body);
      if (loading) {
        MyLoading.dismis();
      }
      return checkForSuccess(response);
    } on DioException catch (e) {
      return getDioException(
        e: e,
      );
    }
  }

  Future<ApiResponse> putData({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    bool loading = false,
    bool isForm = false,
  }) async {
    //_mydio.options.headers["Authorization"] = 'Bearer ${Utils.token}';
    try {
      if (loading) {
        MyLoading.show();
      }
      final response = await _mydio.put(url,
          queryParameters: query,
          data: isForm ? FormData.fromMap(body ?? {}) : body);
      if (loading) {
        MyLoading.dismis();
      }
      return checkForSuccess(response);
    } on DioException catch (e) {
      return getDioException(
        e: e,
      );
    }
  }

  Future<ApiResponse> deleteData({
    required String url,
    Map<String, dynamic>? query,
    bool loading = false,
  }) async {
    _mydio.options.headers["Authorization"] = 'Bearer ${Utils.token}';

    try {
      if (loading) {
        MyLoading.show();
      }
      final response = await _mydio.delete(url, queryParameters: query);
      if (loading) {
        MyLoading.dismis();
      }
      return checkForSuccess(response);
    } on DioException catch (e) {
      return getDioException(
        e: e,
      );
    }
  }

  Future<ApiResponse> getData({
    required String url,
    Map<String, dynamic>? query,
    bool loading = false,
  }) async {
    _mydio.options.headers["Authorization"] = 'Bearer ${Utils.token}';

    try {
      if (loading) {
        MyLoading.show();
      }
      final response = await _mydio.get(url, queryParameters: query);
      if (loading) {
        MyLoading.dismis();
      }
      return checkForSuccess(response);
    } on DioException catch (e) {
      return getDioException(
        e: e,
      );
    }
  }

  FutureOr<ApiResponse> getDioException({
    required DioException e,
  }) async {
    MyLoading.dismis();

    if (DioExceptionType.receiveTimeout == e.type ||
        DioExceptionType.connectionTimeout == e.type) {
      Alerts.snack(text: "Connetion timeout", state: SnackState.failed);
      'case 1'.logIfDebug();
      'Server is not reachable. Please verify your internet connection and try again'
          .logIfDebug();
    } else if (DioExceptionType.badResponse == e.type) {
      'case 2'.logIfDebug();
      'Server reachable. Error in resposne'.logIfDebug();

      Alerts.snack(
          text: e.response?.data["message"] ?? "لا يمكن الوصول للسيرفير",
          state: SnackState.failed);
      if (e.response?.data["message"]?.contains("Unauthenticated") ?? false) {
        //TODO Save Locally
        // await Utils.dataManager.deleteUserData();

        CustomNavigator.push(Routes.loginScreen, clean: true);
      }
      if (e.response?.statusCode == 401) {
        //TODO Save Locally
        // await Utils.dataManager.deleteUserData();
        CustomNavigator.push(Routes.layoutScreen, clean: true);
      }
    } else if (DioExceptionType.connectionError == e.type) {
      if (e.message!.contains('SocketException')) {
        'case 3'.logIfDebug();
        'Network error'.logIfDebug();
        Alerts.snack(text: "No Network", state: SnackState.failed);
      }
    } else {
      // show snak server error
      'case 4'.logIfDebug();
      'Problem connecting to the server. Please try again.'.logIfDebug();
    }
    return ApiResponse(isError: true, response: e.response);
  }

  ApiResponse checkForSuccess(Response response) {
    if ((response.data["status"]) == "Success") {
      return ApiResponse(isError: false, response: response);
    } else {
      Alerts.snack(text: response.data["error"], state: SnackState.failed);
      return ApiResponse(isError: true, response: response);
    }
  }
}

class ApiResponse {
  bool isError;
  Response? response;
  ApiResponse({this.response, required this.isError});
}
