import 'package:dio/dio.dart';
import 'code.dart';
import './interceptor/log.dart';
import 'loading.dart';
import './interceptor/response.dart';
import 'result_data.dart';
import 'http_url.dart';
import 'data_helper.dart';

class HttpManager {
  static final HttpManager _instance = HttpManager._internal();
  Dio? _dio;

  static const codeSuccess = 200;
  static const codeTimeout = -1;
  static const connectTimeout = 15000;

  factory HttpManager() => _instance;

  ///通用全局单例，第一次使用时初始化
  HttpManager._internal() {
    if (null == _dio) {
      _dio = Dio(BaseOptions(
          baseUrl: HttpUrl.baseUrl, connectTimeout: connectTimeout));
      _dio?.interceptors.add(DioLogInterceptor());
      _dio?.interceptors.add(ResponseInterceptors());
    }
  }

  static HttpManager getInstance({String? baseUrl}) {
    if (baseUrl == null) {
      return _instance._normal();
    } else {
      return _instance._baseUrl(baseUrl);
    }
  }

  //用于指定特定域名
  HttpManager _baseUrl(String baseUrl) {
    _dio?.options.baseUrl = baseUrl;
    return this;
  }

  //一般请求，默认域名
  HttpManager _normal() {
    if (_dio?.options.baseUrl != HttpUrl.baseUrl) {
      _dio?.options.baseUrl = HttpUrl.baseUrl;
    }
    return this;
  }

  ///通用的GET请求
  get(api, {params, withLoading = true}) async {
    if (withLoading) {
      Loading.show();
    }

    Response response;

    params["platform"] = "android";
    params["system"] = "1.0.0";
    params["channel"] = "App";
    params["time"] = DateTime.now().millisecondsSinceEpoch.toString();
    params["sign"] = DataHelper.encryptParams(params);

    try {
      response = await _dio!.get(api, queryParameters: params);
      if (withLoading) {
        Loading.dismiss();
      }
    } on DioError catch (e) {
      if (withLoading) {
        Loading.dismiss();
      }
      return resultError(e);
    }

    if (response.data is DioError) {
      return resultError(response.data['code']);
    }

    return response.data;
  }

  ///通用的POST请求
  post(api, {params, withLoading = true}) async {
    if (withLoading) {
      Loading.show();
    }

    Response response;

    params["platform"] = "android";
    params["system"] = "1.0.0";
    params["channel"] = "App";
    params["time"] = DateTime.now().millisecondsSinceEpoch.toString();
    params["sign"] = DataHelper.encryptParams(params);

    try {
      response = await _dio!.post(api, data: params);
      if (withLoading) {
        Loading.dismiss();
      }
    } on DioError catch (e) {
      if (withLoading) {
        Loading.dismiss();
      }
      return resultError(e);
    }

    if (response.data is DioError) {
      return resultError(response.data['code']);
    }

    return response.data;
  }
}

ResultData resultError(DioError e) {
  Response errorResponse;
  if (e.response != null) {
    errorResponse = e.response!;
  } else {
    errorResponse = Response(statusCode: 666, requestOptions: RequestOptions(path: ''));
  }
  if (e.type == DioErrorType.connectTimeout ||
      e.type == DioErrorType.receiveTimeout) {
    errorResponse.statusCode = Code.networkTimeout;
  }
  return ResultData(null, false, errorResponse.statusCode);
}