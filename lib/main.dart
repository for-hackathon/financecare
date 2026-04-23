import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ai_analysis_screen.dart';
import 'finance_details_screen.dart';
import 'profile_screen.dart';
import 'app_language.dart';
import 'app_texts.dart';
import 'bank_state.dart';
import 'bank_select_screen.dart';
import 'goal_state.dart';
import 'goal_setup_screen.dart';
import 'history_screen.dart';




void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppLanguage()),
        ChangeNotifierProvider(create: (_) => BankState()),
        ChangeNotifierProvider(create: (_) => GoalState()),
      ],
      child: const FinanceCareApp(),
    ),
  );
}

class FinanceCareApp extends StatelessWidget {
  const FinanceCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FinanceCare',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF6F7FB),
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}

enum SharedTab { home, finance, ai, history, profile }

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double progress = 0.5;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 90),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TopHeader(),
                    const SizedBox(height: 20),
                    const GoalCard(progress: progress),
                    const SizedBox(height: 18),
                    const StatsSection(),
                    const SizedBox(height: 18),
                    const AiBanner(),
                    const SizedBox(height: 18),
                    const OperationsCard(),
                  ],
                ),
              ),
            ),
            SharedBottomNav(current: SharedTab.home),
          ],
        ),
      ),
    );
  }
}

class TopHeader extends StatelessWidget {
  const TopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = context.watch<AppLanguage>().lang;
    final bankState = context.watch<BankState>();

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text(
                    'Finance',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF18214D),
                    ),
                  ),
                  Text(
                    'Care',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF5C6CFF),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      AppTexts.get(lang, 'subtitle'),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF6E7591),
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Icon(
                    Icons.favorite_border_rounded,
                    size: 20,
                    color: Color(0xFF6A64FF),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 58,
              height: 58,
              decoration: const BoxDecoration(
                color: Color(0xFFF0ECFF),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.person_rounded,
                color: Color(0xFFC3B4FF),
                size: 34,
              ),
            ),
            Positioned(
              right: 2,
              bottom: 2,
              child: Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: const Color(0xFF37D661),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class GoalCard extends StatelessWidget {
  final double progress;

  const GoalCard({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    final lang = context.watch<AppLanguage>().lang;
    final goalState = context.watch<GoalState>();
    final currentProgress = goalState.progress;

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
          Row(
            children: [
              const Icon(Icons.track_changes_rounded, color: Colors.white, size: 22),
              const SizedBox(width: 8),
              Text(
                AppTexts.get(lang, 'goal'),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const GoalSetupScreen(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.edit_rounded, color: Colors.white, size: 18),
                      const SizedBox(width: 8),
                      Text(
                        AppTexts.get(lang, 'edit'),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            '${goalState.targetAmount.toStringAsFixed(0)} сом',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 34,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            goalState.category,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Срок: ${goalState.deadlineText}',
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 28),
          Row(
            children: [
              Text(
                AppTexts.get(lang, 'progress'),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              Text(
                '${(currentProgress * 100).round()}%',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Container(
            height: 18,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.16),
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                color: Colors.white.withOpacity(0.15),
              ),
            ),
            child: Stack(
              children: [
                FractionallySizedBox(
                  widthFactor: currentProgress,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF61F0AF),
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Text(
            goalState.progressText,
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

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = context.watch<AppLanguage>().lang;
     final bankState = context.watch<BankState>();

    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount;
        double childAspectRatio;

        if (constraints.maxWidth < 700) {
          crossAxisCount = 1;
          childAspectRatio = 1.55;
        } else if (constraints.maxWidth < 1100) {
          crossAxisCount = 2;
          childAspectRatio = 1.05;
        } else {
          crossAxisCount = 3;
          childAspectRatio = 0.95;
        }

        return GridView.count(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: childAspectRatio,
          children: [
            StatCard(
              icon: Icons.arrow_upward_rounded,
              iconBg: const Color(0xFFE8F7EE),
              iconColor: const Color(0xFF20B26B),
              title: AppTexts.get(lang, 'income'),
              amount: '50 000',
              amountColor: const Color(0xFF20B26B),
              badgeText: '+12% с прошлого месяца',
              badgeBg: const Color(0xFFE8F7EE),
              badgeColor: const Color(0xFF20B26B),
            ),
            StatCard(
              icon: Icons.arrow_downward_rounded,
              iconBg: const Color(0xFFFFEEF1),
              iconColor: const Color(0xFFFF4D6D),
              title: AppTexts.get(lang, 'expense'),
              amount: '30 000',
              amountColor: const Color(0xFFFF4D6D),
              badgeText: '+8% с прошлого месяца',
              badgeBg: const Color(0xFFFFEEF1),
              badgeColor: const Color(0xFFFF4D6D),
            ),
            StatCard(
              icon: Icons.account_balance_wallet_outlined,
              iconBg: const Color(0xFFEEF2FF),
              iconColor: const Color(0xFF3D63F5),
              title: AppTexts.get(lang, 'saved'),
              amount: '20 000',
              amountColor: const Color(0xFF3D63F5),
              badgeText: 'Отличная работа!',
              badgeBg: const Color(0xFFEEF2FF),
              badgeColor: const Color(0xFF3D63F5),
            ),
          ],
        );
      },
    );
  }
}

class StatCard extends StatelessWidget {
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String title;
  final String amount;
  final Color amountColor;
  final String badgeText;
  final Color badgeBg;
  final Color badgeColor;

  const StatCard({
    super.key,
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.title,
    required this.amount,
    required this.amountColor,
    required this.badgeText,
    required this.badgeBg,
    required this.badgeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFF0F1F7)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: iconBg,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Icon(icon, color: iconColor, size: 26),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color(0xFF1D244D),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.info_outline_rounded,
                    size: 18,
                    color: Color(0xFFC2C7D9),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                amount,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: amountColor,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                'сом',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF1D244D),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Wrap(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                decoration: BoxDecoration(
                  color: badgeBg,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  badgeText,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: badgeColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AiBanner extends StatelessWidget {
  const AiBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = context.watch<AppLanguage>().lang;
     final bankState = context.watch<BankState>();

    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxWidth < 850;

        final actionButton = GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AiAnalysisScreen(),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppTexts.get(lang, 'ai_button'),
                  style: const TextStyle(
                    color: Color(0xFF5547F5),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(width: 6),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 14,
                  color: Color(0xFF5547F5),
                ),
              ],
            ),
          ),
        );

        return Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: const LinearGradient(
              colors: [Color(0xFF3B2B95), Color(0xFF432FA1)],
            ),
          ),
          child: compact
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 68,
                          height: 68,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.08),
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Text(
                              '🤖',
                              style: TextStyle(fontSize: 36),
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppTexts.get(lang, 'ai_title'),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                AppTexts.get(lang, 'ai_desc'),
                                style: const TextStyle(
                                  color: Color(0xFFE3DEFF),
                                  fontSize: 14,
                                  height: 1.35,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    actionButton,
                  ],
                )
              : Row(
                  children: [
                    Container(
                      width: 68,
                      height: 68,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.08),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          '🤖',
                          style: TextStyle(fontSize: 36),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppTexts.get(lang, 'ai_title'),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            AppTexts.get(lang, 'ai_desc'),
                            style: const TextStyle(
                              color: Color(0xFFE3DEFF),
                              fontSize: 14,
                              height: 1.35,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    actionButton,
                  ],
                ),
        );
      },
    );
  }
}

class OperationsCard extends StatelessWidget {
  const OperationsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = context.watch<AppLanguage>().lang;

    return Container(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: const Color(0xFFF0F1F7)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  AppTexts.get(lang, 'last_operations'),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF18214D),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const HistoryScreen(),
                    ),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppTexts.get(lang, 'all_operations'),
                      style: const TextStyle(
                        color: Color(0xFF5C6CFF),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 14,
                      color: Color(0xFF5C6CFF),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),

          OperationItem(
            icon: Icons.savings_outlined,
            iconBg: const Color(0xFFE8F7EE),
            iconColor: const Color(0xFF20B26B),
            title: 'Пополнение накоплений',
            subtitle: 'Перевод на цель',
            amount: '+5 000 сом',
            amountColor: const Color(0xFF20B26B),
            date: AppTexts.get(lang, 'today'),
          ),
          const Divider(height: 22, color: Color(0xFFF0F1F7)),

          OperationItem(
            icon: Icons.shopping_bag_outlined,
            iconBg: const Color(0xFFFFEEF1),
            iconColor: const Color(0xFFFF4D6D),
            title: 'Покупка',
            subtitle: AppTexts.get(lang, 'supermarket'),
            amount: '-2 450 сом',
            amountColor: const Color(0xFF18214D),
            date: AppTexts.get(lang, 'yesterday'),
          ),
          const Divider(height: 22, color: Color(0xFFF0F1F7)),

          OperationItem(
            icon: Icons.account_balance_wallet_outlined,
            iconBg: const Color(0xFFE8F7EE),
            iconColor: const Color(0xFF20B26B),
            title: AppTexts.get(lang, 'salary'),
            subtitle: AppTexts.get(lang, 'income_arrival'),
            amount: '+50 000 сом',
            amountColor: const Color(0xFF20B26B),
            date: '12 апр',
          ),
          const Divider(height: 22, color: Color(0xFFF0F1F7)),

          OperationItem(
            icon: Icons.local_cafe_outlined,
            iconBg: const Color(0xFFFFEEF1),
            iconColor: const Color(0xFFFF4D6D),
            title: AppTexts.get(lang, 'coffee_shop'),
            subtitle: AppTexts.get(lang, 'cafes_restaurants'),
            amount: '-350 сом',
            amountColor: const Color(0xFF18214D),
            date: '11 апр',
          ),

          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _dot(true),
              _dot(false),
              _dot(false),
              _dot(false),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _dot(bool active) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: active ? 22 : 12,
      height: 6,
      decoration: BoxDecoration(
        color: active ? const Color(0xFF8B84FF) : const Color(0xFFE3E5F3),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

class OperationItem extends StatelessWidget {
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String amount;
  final Color amountColor;
  final String date;

  const OperationItem({
    super.key,
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.amountColor,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: iconBg,
            shape: BoxShape.circle,
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
                  fontWeight: FontWeight.w600,
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
    );
  }
}

class SharedBottomNav extends StatelessWidget {
  final SharedTab current;

  const SharedBottomNav({super.key, required this.current});

  @override
  Widget build(BuildContext context) {
    final lang = context.watch<AppLanguage>().lang;
    final bankState = context.watch<BankState>();

    return SafeArea(
      top: false,
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 18,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _sharedItem(
              context,
              icon: Icons.home_rounded,
              label: AppTexts.get(lang, 'home_title'),
              active: current == SharedTab.home,
              page: const HomeScreen(),
            ),
            _sharedItem(
              context,
              icon: Icons.pie_chart_outline_rounded,
              label: AppTexts.get(lang, 'finance'),
              active: current == SharedTab.finance,
              page: const FinanceDetailsScreen(),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const BankSelectScreen(),
                  ),
                );
              },
              child: Container(
                width: 58,
                height: 58,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF4F8CFF), Color(0xFF7457F6)],
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x334F8CFF),
                      blurRadius: 16,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: Icon(
                  bankState.bankIcon,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
            _sharedItem(
              context,
              icon: Icons.history_rounded,
              label: AppTexts.get(lang, 'history'),
              active: current == SharedTab.history,
              page: const HistoryScreen(),
            ),
            _sharedItem(
              context,
              icon: Icons.person_outline_rounded,
              label: AppTexts.get(lang, 'profile'),
              active: current == SharedTab.profile,
              page: const ProfileScreen(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sharedItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required bool active,
    required Widget page,
  }) {
    final color = active ? const Color(0xFF5C4FFF) : const Color(0xFF979DB7);

    return GestureDetector(
      onTap: () {
        if (!active) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        }
      },
      child: SizedBox(
        width: 58,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 26),
            const SizedBox(height: 6),
            Text(
              label,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color,
                fontSize: 11,
                fontWeight: active ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}