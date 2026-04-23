import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'edit_profile_screen.dart';
import 'app_language.dart';
import 'app_texts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = 'Zhyldyz';
  String email = 'example@gmail.com';
  String phone = '+996 500 00 00 00';

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
                    Text(
                      AppTexts.get(lang, 'profile'),
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF18214D),
                      ),
                    ),
                    const SizedBox(height: 20),

                    Container(
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
                        children: [
                          const CircleAvatar(
                            radius: 38,
                            backgroundColor: Colors.white24,
                            child: Icon(
                              Icons.person_rounded,
                              size: 42,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 14),
                          Text(
                            name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            AppTexts.get(lang, 'profile_subtitle'),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 18),

                    ProfileSectionTitle(
                      title: AppTexts.get(lang, 'personal_info'),
                    ),
                    const SizedBox(height: 12),

                    ProfileCard(
                      children: [
                        ProfileRow(
                          icon: Icons.person_outline_rounded,
                          title: AppTexts.get(lang, 'name'),
                          value: name,
                        ),
                        const Divider(height: 24, color: Color(0xFFF0F1F7)),
                        ProfileRow(
                          icon: Icons.email_outlined,
                          title: AppTexts.get(lang, 'email'),
                          value: email,
                        ),
                        const Divider(height: 24, color: Color(0xFFF0F1F7)),
                        ProfileRow(
                          icon: Icons.phone_outlined,
                          title: AppTexts.get(lang, 'phone'),
                          value: phone,
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    ProfileSectionTitle(
                      title: AppTexts.get(lang, 'my_finances'),
                    ),
                    const SizedBox(height: 12),

                    ProfileCard(
                      children: [
                        ProfileRow(
                          icon: Icons.account_balance_wallet_outlined,
                          title: AppTexts.get(lang, 'current_goal'),
                          value: '100 000 сом',
                        ),
                        const Divider(height: 24, color: Color(0xFFF0F1F7)),
                        ProfileRow(
                          icon: Icons.savings_outlined,
                          title: AppTexts.get(lang, 'saved_amount'),
                          value: '50 000 сом',
                        ),
                        const Divider(height: 24, color: Color(0xFFF0F1F7)),
                        ProfileRow(
                          icon: Icons.trending_up_rounded,
                          title: AppTexts.get(lang, 'score'),
                          value: '7.8 / 10',
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    ProfileSectionTitle(
                      title: AppTexts.get(lang, 'settings'),
                    ),
                    const SizedBox(height: 12),

                    ProfileCard(
                      children: [
                        ProfileRow(
                          icon: Icons.notifications_none_rounded,
                          title: AppTexts.get(lang, 'notifications'),
                          value: AppTexts.get(lang, 'enabled'),
                        ),
                        const Divider(height: 24, color: Color(0xFFF0F1F7)),
                        ProfileRow(
                          icon: Icons.lock_outline_rounded,
                          title: AppTexts.get(lang, 'security'),
                          value: AppTexts.get(lang, 'pin_code'),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    ProfileSectionTitle(
                      title: AppTexts.get(lang, 'language'),
                    ),
                    const SizedBox(height: 12),

                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              context.read<AppLanguage>().changeLang('ru');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: lang == 'ru'
                                  ? const Color(0xFF5C4FFF)
                                  : Colors.white,
                              foregroundColor: lang == 'ru'
                                  ? Colors.white
                                  : const Color(0xFF18214D),
                              elevation: 0,
                              side: const BorderSide(color: Color(0xFFF0F1F7)),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            child: Text(
                              AppTexts.get(lang, 'ru'),
                              style: const TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              context.read<AppLanguage>().changeLang('kg');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: lang == 'kg'
                                  ? const Color(0xFF5C4FFF)
                                  : Colors.white,
                              foregroundColor: lang == 'kg'
                                  ? Colors.white
                                  : const Color(0xFF18214D),
                              elevation: 0,
                              side: const BorderSide(color: Color(0xFFF0F1F7)),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            child: Text(
                              AppTexts.get(lang, 'kg'),
                              style: const TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditProfileScreen(
                                name: name,
                                email: email,
                                phone: phone,
                              ),
                            ),
                          );

                          if (result != null && result is Map<String, String>) {
                            setState(() {
                              name = result['name'] ?? name;
                              email = result['email'] ?? email;
                              phone = result['phone'] ?? phone;
                            });
                          }
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
                          AppTexts.get(lang, 'edit_profile'),
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
            SharedBottomNav(current: SharedTab.profile),
          ],
        ),
      ),
    );
  }
}

class ProfileSectionTitle extends StatelessWidget {
  final String title;

  const ProfileSectionTitle({
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

class ProfileCard extends StatelessWidget {
  final List<Widget> children;

  const ProfileCard({
    super.key,
    required this.children,
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
      child: Column(children: children),
    );
  }
}

class ProfileRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const ProfileRow({
    super.key,
    required this.icon,
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
            color: const Color(0xFFF4F6FB),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(icon, color: const Color(0xFF5C4FFF), size: 24),
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