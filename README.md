# ChatToPic

Based on Nintendo's PicToChat application on the old ds and dsi models.

A showcase of PicToChat can be seen here: https://www.youtube.com/watch?v=edMAxb4P6Tk

Written with Flutter and using the bloc pattern.

## Setup

In order to ensure better and more readable code ensure you have swiftformat and swiftlint installed:

```
$ flutter pub get

# If language files are missing run
$ flutter pub run intl_utils:generate

# For dev run
$ flutter run --flavor dev -t lib/flavours/main_dev.dart

# For prod run
$ flutter run --flavor prod -t lib/flavours/main_prod.dart

```

Run tests:

```
# Run tests
$ flutter test

# Run tests with coverage (Optional: Install https://pub.dev/packages/remove_from_coverage)
$ flutter test --coverage
$ remove_from_coverage -f coverage/lcov.info -r 'generated/.+\.dart$'
```

## Deployment

```
Coming soon...
```

## License

ChatToPic (c) 2022 Lucas Goldner and contributors

SPDX-License-Identifier: AGPL-3.0
