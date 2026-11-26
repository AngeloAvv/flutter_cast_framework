import 'package:flutter_cast_framework_example/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  testWidgets('Shows the initial cast and session state', (tester) async {
    await tester.pumpWidget(MaterialApp(home: MyApp()));

    expect(find.text('Cast plugin example app'), findsOneWidget);
    expect(find.text('Cast State: CastState.idle'), findsOneWidget);
    expect(find.text('Session State: SessionState.idle'), findsOneWidget);
  });
}
