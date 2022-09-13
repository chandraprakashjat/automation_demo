import 'package:flutter_driver/flutter_driver.dart' as driver;
import 'package:integration_test/integration_test_driver.dart';

Future<void> main() async {
  return integrationDriver(responseDataCallback: (data) async {
    if (data != null) {
      final _timeline = driver.Timeline.fromJson(data['scrolling_timeline']);

      final summary = driver.TimelineSummary.summarize(_timeline);

      await summary.writeTimelineToFile('scrolling_timeline',
          pretty: true, includeSummary: false);
    }
  });
}
