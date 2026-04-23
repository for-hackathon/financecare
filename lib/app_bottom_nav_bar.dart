import 'package:flutter/material.dart';
import 'main.dart';
import 'finance_details_screen.dart';
import 'ai_analysis_screen.dart';

enum AppTab {
  home,
  finance,
  ai,
  profile,
}

class AppBottomNavBar extends StatelessWidget {
  final AppTab currentTab;

  const AppBottomNavBar({
    super.key,
    required this.currentTab,
  });

  void _openTab(BuildContext context, AppTab tab) {
    if (tab == currentTab) return;

    Widget page;

    switch (tab) {
      case AppTab.home:
        page = const HomeScreen();
        break;
      case AppTab.finance:
        page = const FinanceDetailsScreen();
        break;
      case AppTab.ai:
        page = const AiAnalysisScreen();
        break;
      case AppTab.profile:
        page = const ProfileScreen();
        break;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
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
            _NavItem(
              icon: Icons.home_rounded,
              label: 'Главная',
              active: currentTab == AppTab.home,
              onTap: () => _openTab(context, AppTab.home),
            ),
            _NavItem(
              icon: Icons.pie_chart_outline_rounded,
              label: 'Финансы',
              active: currentTab == AppTab.finance,
              onTap: () => _openTab(context, AppTab.finance),
            ),
            _NavItem(
              icon: Icons.smart_toy_outlined,
              label: 'ИИ',
              active: currentTab == AppTab.ai,
              onTap: () => _openTab(context, AppTab.ai),
            ),
            _NavItem(
              icon: Icons.person_outline_rounded,
              label: 'Профиль',
              active: currentTab == AppTab.profile,
              onTap: () => _openTab(context, AppTab.profile),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = active ? const Color(0xFF5C4FFF) : const Color(0xFF979DB7);

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 64,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 6),
            Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: active ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}