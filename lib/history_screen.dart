import 'package:flutter/material.dart';
import 'main.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Полная история',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF18214D),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Все операции по счетам и накоплениям',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF6E7591),
                      ),
                    ),
                    const SizedBox(height: 20),

                    _historyCard(
                      title: 'Пополнение накоплений',
                      subtitle: 'Перевод на цель',
                      amount: '+5 000 сом',
                      amountColor: const Color(0xFF20B26B),
                      date: 'Сегодня',
                      icon: Icons.savings_outlined,
                      iconBg: const Color(0xFFE8F7EE),
                      iconColor: const Color(0xFF20B26B),
                    ),
                    const SizedBox(height: 12),
                    _historyCard(
                      title: 'Покупка',
                      subtitle: 'Супермаркет',
                      amount: '-2 450 сом',
                      amountColor: const Color(0xFFFF4D6D),
                      date: 'Вчера',
                      icon: Icons.shopping_bag_outlined,
                      iconBg: const Color(0xFFFFEEF1),
                      iconColor: const Color(0xFFFF4D6D),
                    ),
                    const SizedBox(height: 12),
                    _historyCard(
                      title: 'Зарплата',
                      subtitle: 'Поступление',
                      amount: '+50 000 сом',
                      amountColor: const Color(0xFF20B26B),
                      date: '12 апр',
                      icon: Icons.account_balance_wallet_outlined,
                      iconBg: const Color(0xFFE8F7EE),
                      iconColor: const Color(0xFF20B26B),
                    ),
                    const SizedBox(height: 12),
                    _historyCard(
                      title: 'Кофейня',
                      subtitle: 'Кафе и рестораны',
                      amount: '-350 сом',
                      amountColor: const Color(0xFFFF4D6D),
                      date: '11 апр',
                      icon: Icons.local_cafe_outlined,
                      iconBg: const Color(0xFFFFEEF1),
                      iconColor: const Color(0xFFFF4D6D),
                    ),
                  ],
                ),
              ),
            ),
            const SharedBottomNav(current: SharedTab.history),
          ],
        ),
      ),
    );
  }

  Widget _historyCard({
    required String title,
    required String subtitle,
    required String amount,
    required Color amountColor,
    required String date,
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
  }) {
    return Container(
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
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: iconColor, size: 26),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF18214D),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF8A90A8),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: amountColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                date,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF8A90A8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}