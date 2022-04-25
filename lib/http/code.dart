///错误编码
class Code {
  ///网络错误
  static const networkError = -1;

  ///网络超时
  static const networkTimeout = -2;

  ///网络返回数据格式化一次
  static const networkJsonException = -3;

  static const success = 200;

  static errorHandleFunction(code, message, noTip) {
    if (noTip) {
      return message;
    }
    return message;
  }
}