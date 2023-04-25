import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:the_tourism_and_co/app.dart';
import 'package:the_tourism_and_co/mocks/mock_location.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("failing test example", (WidgetTester tester) async {
    await tester.pumpWidget(App());

    final mockLocation = MockLocation.fetchAny();

    expect(find.text(mockLocation.name), findsOneWidget);
    expect(find.text('${mockLocation.name}blah'), findsNothing);
  });
}
