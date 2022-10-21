import 'package:data_connection_checker/data_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker _dateConnectionChecker;
  NetworkInfoImpl(this._dateConnectionChecker);
  @override
  Future<bool> get isConnected => _dateConnectionChecker.hasConnection;
}
