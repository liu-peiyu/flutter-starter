import 'http_manager.dart';
import 'http_url.dart';

/// 所有接口类
class Api {
  ///示例请求
  static request(Map<String, dynamic> param) {
    return HttpManager.getInstance().get(HttpUrl.testPath, params: param);
  }

  static requestOther(Map<String, dynamic> param) {
    return HttpManager.getInstance(baseUrl: HttpUrl.otherUrl)
        .post(HttpUrl.testPath, params: param);
  }
}