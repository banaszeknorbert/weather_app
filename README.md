# weather_app
[![CI](https://github.com/banaszeknorbert/weather_app/actions/workflows/main.yml/badge.svg)](https://github.com/banaszeknorbert/weather_app/actions/workflows/main.yml)[![codecov](https://codecov.io/gh/banaszeknorbert/weather_app/branch/main/graph/badge.svg?token=HO6XUOPL2D)](https://codecov.io/gh/banaszeknorbert/weather_app)

## Getting Started

### Installation

1. Clone the repo:
```bash
$ git clone git@github.com:SkyeSoftware/weather_app.git
$ cd weather_app
```

2. Install dependencies:
```bash
$ flutter pub get
```

3. Run build runner to generate required files
```bash
$ sh generate.sh
```

### Running/Development
This app is using --dart-define way to pass values like api url or api key into the app.

```bash
$ flutter run --dart-define=API_URL=HERE_IS_A_PLACE_FOR_API_URL --dart-define=API_KEY=HERE_IS_A_PLACE_FOR_API_KEY
```

### Running Tests and Static analysis
For tests:

```bash
$ flutter test
```

For static analysis:
```bash
$ flutter analyze
```

