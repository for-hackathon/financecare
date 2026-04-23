import 'package:flutter/material.dart';

class BankState extends ChangeNotifier {
  String? selectedBank;

  void selectBank(String bank) {
    selectedBank = bank;
    notifyListeners();
  }

  void clearBank() {
    selectedBank = null;
    notifyListeners();
  }

  IconData get bankIcon {
    switch (selectedBank) {
      case 'MBank':
        return Icons.account_balance_wallet_rounded;
      case 'Optima':
        return Icons.credit_card_rounded;
      case 'Demir':
        return Icons.account_balance_rounded;
      default:
        return Icons.add_rounded;
    }
  }

  String get bankTitle => selectedBank ?? 'Bank';

  List<String> get checkingAccounts {
    switch (selectedBank) {
      case 'MBank':
        return ['Visa •• 417', 'Mastercard •• 721'];
      case 'Optima':
        return ['Visa •• 884', 'Mastercard •• 319'];
      case 'Demir':
        return ['Visa •• 502', 'Mastercard •• 117'];
      default:
        return [];
    }
  }

  List<String> get savingsAccounts {
    switch (selectedBank) {
      case 'MBank':
        return ['Visa •• 701'];
      case 'Optima':
        return ['Visa •• 412'];
      case 'Demir':
        return ['Visa •• 288'];
      default:
        return [];
    }
  }
}