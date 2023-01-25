// debounce.dart

import 'dart:async';

/// 函数防抖
///
/// [func]: 要执行的方法
/// [delay]: 要迟延的时长
Function debounce(
    Function func, [
      Duration delay = const Duration(milliseconds: 1000),
    ]) {
  Timer? timer;
  target() {
    if (timer?.isActive ?? false) {
      timer?.cancel();
    }
    timer = Timer(delay, () {
      func.call();
    });
  }
  return target;
}

// throttle.dart

// import 'dart:async';

/// 函数节流
///
/// [func]: 要执行的方法
Function? throttle(
    Future Function()? func,
    ) {
  if (func == null) {
    return func;
  }
  bool enable = true;
  target() {
    if (enable == true) {
      enable = false;
      func().then((_) {
        enable = true;
      });
    }
  }
  return target;
}
