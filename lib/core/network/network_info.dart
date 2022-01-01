import 'package:data_connection_checker_tv/data_connection_checker.dart';

abstract class NetWorkInfo{
  Future<bool> get isConnected;
}
class NetWorkInfoImpl implements NetWorkInfo{
  final DataConnectionChecker dataConnectionChecker;
  NetWorkInfoImpl({required this.dataConnectionChecker});
  @override
  Future<bool> get isConnected async=> dataConnectionChecker.hasConnection;
}