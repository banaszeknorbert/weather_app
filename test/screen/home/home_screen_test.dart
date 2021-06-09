import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/screen/home/home_cubit.dart';
import 'package:weather_app/screen/home/home_screen.dart';

import 'home_cubit_test.mocks.dart';

void main() {
  final MockWeatherRepository _mockWeatherRepository = MockWeatherRepository();
  final MockLocationRepository _mockLocationRepository =
      MockLocationRepository();
  final MockCrashRepository _mockCrashRepository = MockCrashRepository();

  testWidgets(
      'Should display HomeViewLoadingWidget when cubit is in loading state',
      (WidgetTester tester) async {
    final loadingCubit = HomeCubit(
        _mockWeatherRepository, _mockLocationRepository, _mockCrashRepository,
        initialState: const HomeState.loading());
    await tester.pumpWidget(
      MaterialApp(
        home: HomeScreen(
          homeCubit: loadingCubit,
        ),
      ),
    );
    final loadingWidgetValue = find.byType(HomeViewLoadingWidget);
    expect(loadingWidgetValue, findsOneWidget);
  });

  testWidgets('Should display HomeViewErrorWidget when cubit is in error state',
      (WidgetTester tester) async {
    final errorCubit = HomeCubit(
        _mockWeatherRepository, _mockLocationRepository, _mockCrashRepository,
        initialState: const HomeState.error('message'));
    final widget = MaterialApp(
      home: HomeScreen(
        homeCubit: errorCubit,
      ),
    );
    await tester.pumpWidget(widget);
    await tester.pumpWidget(widget);
    final errorWidgetValue = find.byType(HomeViewErrorWidget);
    expect(errorWidgetValue, findsOneWidget);
  });
}
