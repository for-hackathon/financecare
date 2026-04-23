import 'package:flutter/material.dart';
import 'bank_verification_screen.dart';

class BankSelectScreen extends StatelessWidget {
  const BankSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F7FB),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xFF18214D),
          ),
        ),
        title: const Text(
          'Выбор банка',
          style: TextStyle(
            color: Color(0xFF18214D),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _bankItem(
              context,
              bankName: 'MBank',
              icon: Icons.account_balance_wallet_rounded,
            ),
            const SizedBox(height: 14),
            _bankItem(
              context,
              bankName: 'Optima',
              icon: Icons.credit_card_rounded,
            ),
            const SizedBox(height: 14),
            _bankItem(
              context,
              bankName: 'Demir',
              icon: Icons.account_balance_rounded,
            ),
          ],
        ),
      ),
    );
  }

  Widget _bankItem(
    BuildContext context, {
    required String bankName,
    required IconData icon,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BankVerificationScreen(
              bankName: bankName,
              icon: icon,
            ),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: const Color(0xFFF0F1F7)),
        ),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: const Color(0xFFEEF2FF),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(icon, color: const Color(0xFF5C4FFF), size: 28),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                bankName,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF18214D),
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
              color: Color(0xFF98A0BA),
            ),
          ],
        ),
      ),
    );
  }
}