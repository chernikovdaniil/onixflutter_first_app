import 'dart:core';
import 'Entities/currency.dart';
import 'Entities/wallet.dart';

void main(List<String> arguments) {
  final euroWallet = Wallet(500.0, EURCurrency());
  final usdWallet = Wallet(300.0, USDCurrency());
  final uahWallet = Wallet(0.50, UAHCurrency());

  void showWalletsInfo() {
    for (final wallet in [euroWallet, usdWallet, uahWallet]) {
      wallet.showWalletInfo();
    }
  }

  showWalletsInfo();

  euroWallet.transferAmountTo(uahWallet, 900);
  euroWallet.transferAmountTo(uahWallet, 150);
  usdWallet.transferAllAmountTo(uahWallet);

  showWalletsInfo();

  for (final wallet in [euroWallet, usdWallet]) {
    wallet.changeWalletCurrency(UAHCurrency());
  }

  print("\n");

  showWalletsInfo();
}
