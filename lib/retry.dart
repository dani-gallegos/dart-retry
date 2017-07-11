library retry;

import "dart:async";

/**
 * Calls [f] repeatedly until it doesn't throw an exception or [tryLimit] is
 * reached (in which case the future completes with the last thrown exception).
 * f is called every [interval] seeconds.
 */
Future<T> retry<T>(Future<T> f(),
    {int tryLimit: 6, Duration interval}) async {
  if (interval == null) interval = new Duration(seconds: 10);

  for (int t = 0; t < tryLimit; t++) {
    try {
      final result = await f();

      return result;
    } catch (e) {
      if (t == tryLimit - 1) rethrow;

      await new Future.delayed(interval);
    }
  }

  // To prevent static warning
  throw new Exception("Retry failed");
}
