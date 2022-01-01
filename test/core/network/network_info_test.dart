import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tribe_app/core/network/network_info.dart';
import 'network_info_test.mocks.dart';
@GenerateMocks([DataConnectionChecker])
void main(){
  late  MockDataConnectionChecker mockDataConnectionChecker;
  late NetWorkInfoImpl netWorkInfo;
  setUp((){
    mockDataConnectionChecker = MockDataConnectionChecker();
    netWorkInfo = NetWorkInfoImpl(dataConnectionChecker: mockDataConnectionChecker);
  });

  group("network info", (){
    test("has connection", ()async{
      when(mockDataConnectionChecker.hasConnection).thenAnswer((_) async=> true);
      final result =await netWorkInfo.isConnected;
      verify(mockDataConnectionChecker.hasConnection);
      expect(result, true);
    });

    test("disconnection", ()async{
      when(mockDataConnectionChecker.hasConnection).thenAnswer((_) async=> false);
      final result =await netWorkInfo.isConnected;
      verify(mockDataConnectionChecker.hasConnection);
      expect(result, false);
    });
  });
}