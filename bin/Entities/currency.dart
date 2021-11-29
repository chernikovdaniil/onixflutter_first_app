import 'dart:core';

class Currency {
  final String id;
  final String name;
  final String symbol;
  final double rateToUAH;

  const Currency(this.name, this.symbol, double? rateToUAH)
      : id = "Currency - $name, symbol - $symbol",
        rateToUAH = (rateToUAH ?? 1);

  showInfo() {
    print("$name.toUpperCase()");
  }
}

class EURCurrency extends Currency {
  const EURCurrency() : super("EUR", "€", 30.67);
}

class USDCurrency extends Currency {
  const USDCurrency() : super("USD", "\$", 27.09);
}

class UAHCurrency extends Currency {
  const UAHCurrency() : super("UAH", "₴", null);
}
