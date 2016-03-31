library retry_test;

import "package:retry/retry.dart";
import "package:test/test.dart";

void main() {
  test("Retry unsuccessfully", () async {
    final testFunction = () async {
      throw "Doesn't work lol";
    };

    expect(
        retry(testFunction, interval: new Duration(milliseconds: 50)), throws);
  });

  test("Retry successfully", () async {
    final testFunction = () async {
      return true;
    };

    expect(retry(testFunction, interval: new Duration(milliseconds: 50)),
        completion(equals(true)));
  });

  test("Retry successfully on third try", () async {
    int t = 0;

    final testFunction = () async {
      t++;

      if (t != 2)
        throw "Doesn't work";
      else
        return true;
    };

    expect(retry(testFunction, interval: new Duration(milliseconds: 50)),
        completion(equals(true)));
  });
}
