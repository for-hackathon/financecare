import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'full_analysis_screen.dart';
import 'app_language.dart';
import 'app_texts.dart';
import 'bank_state.dart';
import 'bank_select_screen.dart';

class FinanceDetailsScreen extends StatelessWidget {
  const FinanceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = context.watch<AppLanguage>().lang;

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
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppTexts.get(lang, 'finance'),
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF18214D),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                AppTexts.get(lang, 'finance_details_subtitle'),
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF6E7591),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),

                    SummaryHeaderCard(lang: lang),
                    const SizedBox(height: 18),

                    SectionTitle(title: AppTexts.get(lang, 'incomes')),
                    const SizedBox(height: 12),
                    IncomeExpenseCard(
                      isIncome: true,
                      items: [
                        FinanceItemData(
                          title: AppTexts.get(lang, 'salary'),
                          subtitle: AppTexts.get(lang, 'main_income'),
                          amount: '+2 000 сом',
                        ),
                        FinanceItemData(
                          title: AppTexts.get(lang, 'side_job'),
                          subtitle: AppTexts.get(lang, 'additional_income'),
                          amount: '+4 000 сом',
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    SectionTitle(title: AppTexts.get(lang, 'expenses')),
                    const SizedBox(height: 12),
                    IncomeExpenseCard(
                      isIncome: false,
                      items: [
                        FinanceItemData(
                          title: AppTexts.get(lang, 'products'),
                          subtitle: AppTexts.get(lang, 'supermarket'),
                          amount: '-300 сом',
                        ),
                        FinanceItemData(
                          title: AppTexts.get(lang, 'transport'),
                          subtitle: AppTexts.get(lang, 'road_and_trips'),
                          amount: '-600 сом',
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    SectionTitle(title: AppTexts.get(lang, 'results_and_tips')),
                    const SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: const Color(0xFFF0F1F7)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InfoRow(
                            icon: Icons.savings_outlined,
                            iconColor: const Color(0xFF3D63F5),
                            iconBg: const Color(0xFFEEF2FF),
                            title: AppTexts.get(lang, 'saved'),
                            value: '5 100 сом',
                          ),
                          const SizedBox(height: 14),
                          const Divider(color: Color(0xFFF0F1F7), height: 1),
                          const SizedBox(height: 14),
                          InfoRow(
                            icon: Icons.lightbulb_outline_rounded,
                            iconColor: const Color(0xFFFF9F43),
                            iconBg: const Color(0xFFFFF4E8),
                            title: AppTexts.get(lang, 'advice'),
                            value: AppTexts.get(lang, 'daily_expenses_tip'),
                          ),
                          const SizedBox(height: 14),
                          const Divider(color: Color(0xFFF0F1F7), height: 1),
                          const SizedBox(height: 14),
                          InfoRow(
                            icon: Icons.track_changes_outlined,
                            iconColor: const Color(0xFF20B26B),
                            iconBg: const Color(0xFFE8F7EE),
                            title: AppTexts.get(lang, 'goal'),
                            value: AppTexts.get(lang, 'goal_left_text'),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FullAnalysisScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF18214D),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          AppTexts.get(lang, 'view_full_analysis'),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SharedBottomNav(current: SharedTab.finance),
          ],
        ),
      ),
    );
  }
}

class SummaryHeaderCard extends StatelessWidget {
  final String lang;

  const SummaryHeaderCard({
    super.key,
    required this.lang,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF4F8CFF), Color(0xFF7457F6)],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: const [
          BoxShadow(
            color: Color(0x224F8CFF),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTexts.get(lang, 'total_balance'),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '5 100 сом',
            style: TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            AppTexts.get(lang, 'income_more_than_expense'),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w800,
        color: Color(0xFF18214D),
      ),
    );
  }
}

class IncomeExpenseCard extends StatelessWidget {
  final bool isIncome;
  final List<FinanceItemData> items;

  const IncomeExpenseCard({
    super.key,
    required this.isIncome,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final iconBg = isIncome ? const Color(0xFFE8F7EE) : const Color(0xFFFFEEF1);
    final iconColor = isIncome ? const Color(0xFF20B26B) : const Color(0xFFFF4D6D);
    final icon = isIncome ? Icons.arrow_upward_rounded : Icons.arrow_downward_rounded;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFF0F1F7)),
      ),
      child: Column(
        children: List.generate(items.length, (index) {
          final item = items[index];

          return Padding(
            padding: EdgeInsets.only(bottom: index == items.length - 1 ? 0 : 14),
            child: Column(
              children: [
                Row(
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
                            item.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF18214D),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item.subtitle,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF8A90A8),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      item.amount,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: iconColor,
                      ),
                    ),
                  ],
                ),
                if (index != items.length - 1) ...[
                  const SizedBox(height: 14),
                  const Divider(color: Color(0xFFF0F1F7), height: 1),
                ]
              ],
            ),
          );
        }),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final String title;
  final String value;

  const InfoRow({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: iconBg,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(icon, color: iconColor, size: 24),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF18214D),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF6E7591),
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}

class FinanceItemData {
  final String title;
  final String subtitle;
  final String amount;

  const FinanceItemData({
    required this.title,
    required this.subtitle,
    required this.amount,
  });
}