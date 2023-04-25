import 'package:flutter_test/flutter_test.dart';
import 'package:the_tourism_and_co/app.dart';
import 'package:the_tourism_and_co/mocks/mock_location.dart';
import 'package:image_test_utils/image_test_utils.dart';

void main() {
  testWidgets('test app startup', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(const App());

      final mockLocation = MockLocation.fetchAny();

      expect(find.text(mockLocation.name), findsOneWidget);

      expect(find.text('${mockLocation.name}blah'), findsNothing);
    });
  });
}
