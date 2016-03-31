# dart-retry
Execute a function repeatedly until no exception is thrown

## Usage

  Future connectFunction(){ ... }

  Future main() async {
    // Tries to connect to a database 6 times, waiting 10 seconds each time 
    final db = await retry(connectFunction);
  }

Useful for waiting for a server to come up.
