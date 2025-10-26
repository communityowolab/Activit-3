import 'package:flutter_test/flutter_test.dart';
import 'package:dev_mobile_avance/main.dart'; // chemin correct

void main() {
  testWidgets('Example test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    // ...
  });
}
