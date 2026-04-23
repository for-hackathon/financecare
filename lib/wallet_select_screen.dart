import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bank_accounts_screen.dart';
import 'bank_state.dart';

class WalletSelectScreen extends StatelessWidget {
  final String bankName;
  final IconData icon;

  const WalletSelectScreen({
    super.key,
    required this.bankName,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final bankState = context.watch<BankState>();

    final accounts = [
      ...bankState.checkingAccounts,
      ...bankState.savingsAccounts,
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F7FB),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xFF18214D),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Выбор счета',
          style: TextStyle(
            color: Color(0xFF18214D),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: accounts
              .map(
                (account) => GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BankAccountsScreen(
                          bankName: bankName,
                          icon: icon,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 14),
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: const Color(0xFFF0F1F7)),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.credit_card_rounded,
                          color: Color(0xFF5C4FFF),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            account,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF18214D),
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}