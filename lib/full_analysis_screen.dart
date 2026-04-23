import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'app_language.dart';
import 'app_texts.dart';

class FullAnalysisScreen extends StatelessWidget {
  const FullAnalysisScreen({super.key});

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
                                AppTexts.get(lang, 'analysis'),
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF18214D),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                AppTexts.get(lang, 'analysis_subtitle'),
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

                    AnalysisHeaderCard(lang: lang),
                    const SizedBox(height: 18),

                    AnalysisSectionTitle(
                      title: AppTexts.get(lang, 'where_money_went'),
                    ),
                    const SizedBox(height: 12),
                    CategoryCard(
                      items: [
                        CategoryItemData(
                          title: AppTexts.get(lang, 'products'),
                          amount: '12 000 сом',
                          percent: '32%',
                          icon: Icons.shopping_bag_outlined,
                          iconBg: const Color(0xFFFFF4E8),
                          iconColor: const Color(0xFFFF9F43),
                        ),
                        CategoryItemData(
                          title: AppTexts.get(lang, 'cafes'),
                          amount: '4 500 сом',
                          percent: '12%',
                          icon: Icons.local_cafe_outlined,
                          iconBg: const Color(0xFFFFEEF1),
                          iconColor: const Color(0xFFFF4D6D),
                        ),
                        CategoryItemData(
                          title: AppTexts.get(lang, 'transport'),
                          amount: '3 200 сом',
                          percent: '8%',
                          icon: Icons.directions_car_outlined,
                          iconBg: const Color(0xFFEAF1FF),
                          iconColor: const Color(0xFF4F8CFF),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    AnalysisSectionTitle(
                      title: AppTexts.get(lang, 'budget_drains'),
                    ),
                    const SizedBox(height: 12),
                    InsightBlock(
                      icon: Icons.warning_amber_rounded,
                      iconBg: const Color(0xFFFFF4E8),
                      iconColor: const Color(0xFFFF9F43),
                      title: AppTexts.get(lang, 'problem_category'),
                      text: AppTexts.get(lang, 'problem_category_text'),
                    ),

                    const SizedBox(height: 14),

                    InsightBlock(
                      icon: Icons.repeat_rounded,
                      iconBg: const Color(0xFFEEF2FF),
                      iconColor: const Color(0xFF3D63F5),
                      title: AppTexts.get(lang, 'repeating_expenses'),
                      text: AppTexts.get(lang, 'repeating_expenses_text'),
                    ),

                    const SizedBox(height: 18),

                    AnalysisSectionTitle(
                      title: AppTexts.get(lang, 'ai_advice'),
                    ),
                    const SizedBox(height: 12),
                    AdviceCard(lang: lang),

                    const SizedBox(height: 18),

                    AnalysisSectionTitle(
                      title: AppTexts.get(lang, 'forecast'),
                    ),
                    const SizedBox(height: 12),
                    ForecastCard(lang: lang),

                    const SizedBox(height: 18),

                    AnalysisSectionTitle(
                      title: AppTexts.get(lang, 'score'),
                    ),
                    const SizedBox(height: 12),
                    ScoreCard(lang: lang),

                    const SizedBox(height: 18),

                    AnalysisSectionTitle(
                      title: AppTexts.get(lang, 'improvement_plan'),
                    ),
                    const SizedBox(height: 12),
                    ImprovementPlanCard(lang: lang),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
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
                          AppTexts.get(lang, 'create_financial_plan'),
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

class AnalysisHeaderCard extends StatelessWidget {
  final String lang;

  const AnalysisHeaderCard({
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
            AppTexts.get(lang, 'month_result'),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            '14 600 сом',
            style: TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            AppTexts.get(lang, 'month_result_desc'),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: MiniSummaryCard(
                  title: AppTexts.get(lang, 'income'),
                  value: '52 000',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: MiniSummaryCard(
                  title: AppTexts.get(lang, 'expense'),
                  value: '37 400',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: MiniSummaryCard(
                  title: AppTexts.get(lang, 'saved_short'),
                  value: '14 600',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MiniSummaryCard extends StatelessWidget {
  final String title;
  final String value;

  const MiniSummaryCard({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.14),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '$value сом',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class AnalysisSectionTitle extends StatelessWidget {
  final String title;

  const AnalysisSectionTitle({
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

class CategoryCard extends StatelessWidget {
  final List<CategoryItemData> items;

  const CategoryCard({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
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
                        color: item.iconBg,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(item.icon, color: item.iconColor, size: 26),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF18214D),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          item.amount,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF18214D),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item.percent,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF8A90A8),
                          ),
                        ),
                      ],
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

class InsightBlock extends StatelessWidget {
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String title;
  final String text;

  const InsightBlock({
    super.key,
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFF0F1F7)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF18214D),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF6E7591),
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AdviceCard extends StatelessWidget {
  final String lang;

  const AdviceCard({
    super.key,
    required this.lang,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF3B2B95), Color(0xFF432FA1)],
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.auto_awesome_rounded,
            color: Colors.white,
            size: 28,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              AppTexts.get(lang, 'advice_text'),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                height: 1.5,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ForecastCard extends StatelessWidget {
  final String lang;

  const ForecastCard({
    super.key,
    required this.lang,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFF0F1F7)),
      ),
      child: Column(
        children: [
          ForecastRow(
            period: AppTexts.get(lang, 'after_1_month'),
            value: '17 000 сом',
          ),
          const SizedBox(height: 14),
          const Divider(color: Color(0xFFF0F1F7), height: 1),
          const SizedBox(height: 14),
          ForecastRow(
            period: AppTexts.get(lang, 'after_3_months'),
            value: '43 000 сом',
          ),
          const SizedBox(height: 14),
          const Divider(color: Color(0xFFF0F1F7), height: 1),
          const SizedBox(height: 14),
          ForecastRow(
            period: AppTexts.get(lang, 'after_6_months'),
            value: '86 000 сом',
          ),
        ],
      ),
    );
  }
}

class ForecastRow extends StatelessWidget {
  final String period;
  final String value;

  const ForecastRow({
    super.key,
    required this.period,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.trending_up_rounded,
          color: Color(0xFF20B26B),
          size: 24,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            period,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xFF18214D),
            ),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Color(0xFF20B26B),
          ),
        ),
      ],
    );
  }
}

class ScoreCard extends StatelessWidget {
  final String lang;

  const ScoreCard({
    super.key,
    required this.lang,
  });

  @override
  Widget build(BuildContext context) {
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
          const CircleAvatar(
            radius: 28,
            backgroundColor: Color(0xFFEEF2FF),
            child: Text(
              '7.8',
              style: TextStyle(
                color: Color(0xFF3D63F5),
                fontWeight: FontWeight.w800,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppTexts.get(lang, 'financial_discipline'),
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF18214D),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  AppTexts.get(lang, 'financial_discipline_text'),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF6E7591),
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ImprovementPlanCard extends StatelessWidget {
  final String lang;

  const ImprovementPlanCard({
    super.key,
    required this.lang,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFF0F1F7)),
      ),
      child: Column(
        children: [
          PlanRow(text: AppTexts.get(lang, 'plan_item_1')),
          const SizedBox(height: 12),
          PlanRow(text: AppTexts.get(lang, 'plan_item_2')),
          const SizedBox(height: 12),
          PlanRow(text: AppTexts.get(lang, 'plan_item_3')),
        ],
      ),
    );
  }
}

class PlanRow extends StatelessWidget {
  final String text;

  const PlanRow({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 5),
          width: 8,
          height: 8,
          decoration: const BoxDecoration(
            color: Color(0xFF7457F6),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFF44506A),
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryItemData {
  final String title;
  final String amount;
  final String percent;
  final IconData icon;
  final Color iconBg;
  final Color iconColor;

  const CategoryItemData({
    required this.title,
    required this.amount,
    required this.percent,
    required this.icon,
    required this.iconBg,
    required this.iconColor,
  });
}