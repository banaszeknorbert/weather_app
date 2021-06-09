import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app/main_route.dart';
import 'package:weather_app/data/repository/crash/crash_repository.dart';
import 'package:weather_app/data/repository/location/location_repository.dart';
import 'package:weather_app/data/repository/weather/weather_repository.dart';
import 'package:weather_app/injection/injection.dart';
import 'package:weather_app/screen/home/home_cubit.dart';
import 'package:weather_app/screen/home/home_screen_view.dart';
import 'package:weather_app/theme/gradients.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({HomeCubit? homeCubit})
      : cubit = homeCubit ??
            HomeCubit(
              getIt.get<WeatherRepository>(),
              getIt.get<LocationRepository>(),
              getIt.get<CrashRepository>(),
            );

  final HomeCubit cubit;

  static Route build() => MainRoute(HomeScreen());

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    widget.cubit.getWeatherData();
    print('Widget cubit state: ${widget.cubit.state}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocBuilder(
      bloc: widget.cubit,
      builder: (ctx, HomeState state) => state.when(
          initial: () => Container(),
          loading: () => HomeViewLoadingWidget(),
          success: (weather) => HomeScreenView(weather: weather),
          error: (error) => HomeViewErrorWidget(error)));
}

class HomeViewErrorWidget extends StatelessWidget {
  const HomeViewErrorWidget(this.message);

  final String message;

  @override
  Widget build(BuildContext context) => Scaffold(
          body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(gradient: errorGradient),
        padding: const EdgeInsets.all(60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'An error occurred\n$message',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        ),
      ));
}

class HomeViewLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(gradient: defaultGradient),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
                strokeWidth: 2,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Loading weather data',
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
        ),
      );
}
