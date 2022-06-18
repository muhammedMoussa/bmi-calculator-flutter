import 'package:flutter/widgets.dart';

import 'package:bmi_calculator/pages/input_page.dart';
import 'package:bmi_calculator/pages/results_page.dart';

const initialRoute = '/';

dynamic routes(BuildContext context) {
  return {
    '/': (context) => InputPage(),
    '/results': (context) => ResultsPage(),
  };
}
