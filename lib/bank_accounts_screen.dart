import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bank_state.dart';
import 'main.dart';

class BankAccountsScreen extends StatelessWidget {
  final String bankName;
  final IconData icon;

  const BankAccountsScreen({
    super.key,
    required this.bankName,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final bankState = context.watch<BankState>();

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            width: 46,
                            height: 46,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: const Color(0xFFF0F1F7)),
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 20,
                              color: Color(0xFF18214D),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEEF2FF),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(icon, color: const Color(0xFF5C4FFF), size: 18),
                              const SizedBox(width: 8),
                              Text(
                                bankName,
                                style: const TextStyle(
                                  color: Color(0xFF18214D),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    _sectionTitle('Расч. счет'),
                    const SizedBox(height: 12),
                    _accountGroup(bankState.checkingAccounts),

                    const SizedBox(height: 22),

                    _sectionTitle('Сбер. счет'),
                    const SizedBox(height: 12),
                    _accountGroup(bankState.savingsAccounts),

                    const SizedBox(height: 22),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: const Color(0xFFF0F1F7)),
                      ),
                      child: const Text(
                        'Здесь можно будет добавить подробности по счетам, балансам и операциям.',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF6E7591),
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SharedBottomNav(current: SharedTab.finance),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: Color(0xFF18214D),
      ),
    );
  }

  Widget _accountGroup(List<String> accounts) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFF0F1F7)),
      ),
      child: Column(
        children: accounts
            .map(
              (account) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F8FC),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.credit_card_rounded,
                        color: Color(0xFF5C4FFF),
                      ),
                      const SizedBox(width: 10),
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
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}