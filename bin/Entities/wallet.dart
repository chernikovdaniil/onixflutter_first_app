import 'dart:core';
import 'currency.dart';

abstract class AddToWallet {
  addAmount(double amount);
}

abstract class TransferWalletCurrency {
  transferAmountTo(Wallet wallet, double amount);
  transferAllAmountTo(Wallet wallet);
}

abstract class ChangeWalletCurrency {
  changeWalletCurrency(Currency newCurrency);
}

abstract class ShowWalletInfo {
  showWalletInfo();
}

class Wallet
    implements
        AddToWallet,
        TransferWalletCurrency,
        ChangeWalletCurrency,
        ShowWalletInfo {
  double amount;
  Currency selectedCurrency;

  Wallet(this.amount, this.selectedCurrency);

  @override
  addAmount(double amount) => this.amount += amount;

  @override
  transferAmountTo(Wallet wallet, double amount) {
    if (amount > 0 && amount <= this.amount) {
      if (wallet.selectedCurrency.id != UAHCurrency().id) {
        print("Sorry, you can't transfer your money to not UAH Wallet!");
      } else {
        final resultAmount = amount * selectedCurrency.rateToUAH;
        wallet.addAmount(resultAmount);
        this.amount -= amount;
      }
    } else {
      final availableAmount = this.amount;
      print("""
      You can't transfer $amount amount, you available amount - $availableAmount
      """);
    }
  }

  @override
  transferAllAmountTo(Wallet wallet) {
    if (wallet.selectedCurrency.id != UAHCurrency().id) {
      print("Sorry, you can't transfer your money to not UAH Wallet!");
    } else {
      final resultAmount = amount * wallet.selectedCurrency.rateToUAH;
      wallet.addAmount(resultAmount);
      amount = 0;
    }
  }

  @override
  changeWalletCurrency(Currency newCurrency) {
    if (selectedCurrency.id == newCurrency.id) {
      print(
          "You've already set $newCurrency.showInfo() currency for this wallet.");
    } else {
      if (newCurrency.id != UAHCurrency().id) {
        amount = amount / newCurrency.rateToUAH;
      } else {
        amount = amount * selectedCurrency.rateToUAH;
      }

      selectedCurrency = newCurrency;
    }
  }

  @override
  showWalletInfo() {
    final currencySymbol = selectedCurrency.symbol;
    final currencyName = selectedCurrency.name.toUpperCase();
    print("\n $currencyName Wallet - $amount$currencySymbol");
  }
}
