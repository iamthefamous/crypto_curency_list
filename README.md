# Crypto Currency List

A Flutter application that displays real-time cryptocurrency prices in USD, powered by the [CryptoCompare API](https://min-api.cryptocompare.com/).

## Features

- 📋 Browse a list of cryptocurrencies with their current USD prices and icons
- 🔄 Pull-to-refresh to update prices on demand
- 📄 Tap on any coin to view its detail page
- ⚡ Fetches up to 200 coins per request using chunked API calls
- 🛠️ Error handling with a retry option when the API is unreachable

## Architecture

The app follows a clean architecture approach using the **BLoC** pattern for state management:

```
lib/
├── main.dart                   # App entry point & dependency injection setup
├── presentations/
│   ├── pages/
│   │   ├── crypto_list_page.dart   # Main list screen
│   │   └── crypto_coin_page.dart   # Coin detail screen
│   └── widgets/                    # Reusable UI components
├── services/
│   ├── bloc/                       # BLoC: events, states, and bloc class
│   ├── crypto_coins/               # CryptoCompare API service implementation
│   ├── models/                     # Data models (CryptoCoin, CoinsList)
│   └── abstract_crypto_coins_service.dart
├── router/
│   └── router.dart                 # Named route definitions
└── theme/                          # App theme configuration
```

## Tech Stack

| Package | Purpose |
|---|---|
| [flutter_bloc](https://pub.dev/packages/flutter_bloc) | State management |
| [get_it](https://pub.dev/packages/get_it) | Dependency injection |
| [dio](https://pub.dev/packages/dio) | HTTP client |
| [equatable](https://pub.dev/packages/equatable) | Value equality for models |
| [flutter_svg](https://pub.dev/packages/flutter_svg) | SVG asset rendering |

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) `^3.5.2`
- A CryptoCompare API key (a key is already included for development)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/iamthefamous/crypto_curency_list.git
   cd crypto_curency_list
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

### Supported Platforms

- Android
- iOS
- Web
- Linux
- macOS
- Windows

## API

Cryptocurrency data is fetched from the [CryptoCompare](https://www.cryptocompare.com/) public API:

```
https://min-api.cryptocompare.com/data/pricemultifull?fsyms={symbols}&tsyms=USD
```

Coin symbols are loaded from a local list and batched into chunks of up to 200 symbols per request to stay within API limits.

## Running Tests

```bash
flutter test
```
