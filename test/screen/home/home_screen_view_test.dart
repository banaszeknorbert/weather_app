import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/screen/home/home_screen_view.dart';

import '../../mocks/model_mocks.dart';

void main() {
  testWidgets('Should display properly city name and temperature',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: HomeScreenView(weather: weatherForCity),
    ));
    final tempValue =
        find.text('${weatherForCity.mainData.temp.toStringAsFixed(0)}°C');
    final cityValue = find.text(weatherForCity.name);
    expect(tempValue, findsOneWidget);
    expect(cityValue, findsOneWidget);
  });
}
