import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
class HomeRobot{
  final WidgetTester tester;
  HomeRobot(this.tester);

  Future<void> findHomeTitle()async{
    await tester.pumpAndSettle();
    final finder = find.text("Community");
    await tester.pumpAndSettle();
    expect(finder, findsOneWidget);
  }

  Future<void> scrollUp(bool scrollUp)async{
    await tester.runAsync(()async{
      final findList = find.byKey(const Key("home_posts_list"));
      await tester.pumpAndSettle();
      expect(findList, findsOneWidget);
      if(scrollUp){
        await tester.fling(findList,const Offset(0,10000), 10000);

      }else{
        await tester.fling(findList,const Offset(0,-10000), 10000);
      }
      await tester.pumpAndSettle();

    });
}
}