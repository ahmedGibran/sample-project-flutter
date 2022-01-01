import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:tribe_app/main.dart' as app;

import 'robots/home_robot.dart';
void  main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  HomeRobot homeRobot;

  setUp((){

  });
  group("home test",(){
    testWidgets("should find all elements",(WidgetTester tester) async{
     app.main();
     homeRobot = HomeRobot(tester);
     await homeRobot.findHomeTitle();
     await homeRobot.scrollUp(false);

    });
  });
}