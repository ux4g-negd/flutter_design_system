import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import '../../../widgets/component_docs.dart';

const Color _primaryColor = Ux4gColors.primary600;

final selectAdvocateComponent = WidgetbookComponent(
  name: 'Select Advocate',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        return ComponentDocs(
          mobileMockup: true,
          name: 'Select Advocate',
          description:
              'Advocate selection pattern for consultation slot booking. '
              'Shows available advocates with specialization, experience, languages, and slot count.',
          code: _selectAdvocateCode,
          center: true,
          child: const _SelectAdvocateMockup(),
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Source Code String
// ───────────────────────────────────────────────────────────────────────

const _selectAdvocateCode = r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

class SelectAdvocateScreen extends StatelessWidget {
  const SelectAdvocateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: Column(
          children: [
            Ux4gAppHeader(
              variant: Ux4gAppHeaderVariant.filled,
              title: 'National Services Portal',
              showBackButton: true,
              onBackPressed: () => Navigator.pop(context),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Text('Select an advocate', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
                    const SizedBox(height: 4),
                    Text('District Legal Services Authority, Pune · 12 available',
                      style: TextStyle(fontSize: 13, color: Color(0xFF4B5563))),
                    const SizedBox(height: 20),
                    _AdvocateCard(name: 'Adv. M. Sharma', specialization: 'Family Law', experience: '12 yrs', languages: 'Hindi, Marathi, English', slots: 8),
                    const SizedBox(height: 16),
                    _AdvocateCard(name: 'Adv. M. Sharma', specialization: 'Family Law', experience: '12 yrs', languages: 'Hindi, Marathi, English', slots: 5),
                    const SizedBox(height: 16),
                    _AdvocateCard(name: 'Adv. M. Sharma', specialization: 'Family Law', experience: '12 yrs', languages: 'Hindi, Marathi, English', slots: 3),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AdvocateCard extends StatelessWidget {
  final String name;
  final String specialization;
  final String experience;
  final String languages;
  final int slots;
  const _AdvocateCard({required this.name, required this.specialization, required this.experience, required this.languages, required this.slots});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFF432CBB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Avatar
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xFFF2EFFF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(Icons.balance, size: 20, color: Color(0xFF432CBB)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                    Text('$specialization · $experience', style: TextStyle(fontSize: 12, color: Color(0xFF4B5563))),
                  ],
                ),
              ),
              Text('$slots slots', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF16A34A))),
            ],
          ),
          const SizedBox(height: 8),
          Text('Languages: $languages', style: TextStyle(fontSize: 12, color: Color(0xFF4B5563))),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: Ux4gButton(text: 'Select', onPressed: () {}, variant: Ux4gButtonVariant.primary, size: Ux4gButtonSize.medium),
          ),
        ],
      ),
    );
  }
}
""";

// ───────────────────────────────────────────────────────────────────────
// Mockup
// ───────────────────────────────────────────────────────────────────────

class _SelectAdvocateMockup extends StatelessWidget {
  const _SelectAdvocateMockup();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final typography = Ux4gTheme.typography(context);
    return Theme(
      data: Ux4gTheme.themeData(isDark: isDark),
      child: Scaffold(
        backgroundColor: isDark
            ? Ux4gColors.neutral950
            : Ux4gColors.neutral50,
        body: SafeArea(
          child: Column(
            children: [
              // App Header
              Container(
                width: double.infinity,
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                color: _primaryColor,
                child: Row(
                  children: [
                    const Icon(Icons.arrow_back, color: Colors.white, size: 20),
                    const SizedBox(width: 12),
                    Text(
                      'National Services Portal',
                      style: typography.tS_default.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              // Content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select an advocate',
                        style: typography.hS_strong.copyWith(
                          color: isDark
                              ? Ux4gColors.neutral50
                              : Ux4gColors.neutral900,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'District Legal Services Authority, Pune · 12 available',
                        style: typography.bS_default.copyWith(
                          color: isDark
                              ? Ux4gColors.neutral200
                              : Ux4gColors.neutral700,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildAdvocateCard(
                        'Adv. M. Sharma',
                        'Family Law',
                        '12 yrs',
                        'Hindi, Marathi, English',
                        8,
                        context,
                      ),
                      const SizedBox(height: 8),
                      _buildAdvocateCard(
                        'Adv. M. Sharma',
                        'Family Law',
                        '12 yrs',
                        'Hindi, Marathi, English',
                        5,
                        context,
                      ),
                      const SizedBox(height: 8),
                      _buildAdvocateCard(
                        'Adv. M. Sharma',
                        'Family Law',
                        '12 yrs',
                        'Hindi, Marathi, English',
                        3,
                        context,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAdvocateCard(
    String name,
    String specialization,
    String experience,
    String languages,
    int slots,
    BuildContext context,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final typography = Ux4gTheme.typography(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Ux4gColors.neutral900 : Ux4gColors.neutral100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Avatar icon
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: isDark
                      ? Ux4gColors.primary950
                      : Ux4gColors.primary50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.balance,
                  size: 20,
                  color: isDark
                      ? Ux4gColors.primary300
                      : Ux4gColors.primary600,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: typography.tS_strong.copyWith(
                        color: isDark
                            ? Ux4gColors.neutral50
                            : Ux4gColors.neutral900,
                      ),
                    ),
                    Text(
                      '$specialization · $experience',
                      style: typography.lM_default.copyWith(
                        color: isDark
                            ? Ux4gColors.neutral200
                            : Ux4gColors.neutral700,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: isDark ? Ux4gColors.green800 : Ux4gColors.green100,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '$slots slots',
                  style: typography.lM_strong.copyWith(
                    color: isDark ? Ux4gColors.green300 : Ux4gColors.green700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Languages: $languages',
            style: typography.lM_default.copyWith(
              color: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: Ux4gButton(
              text: 'Select',
              onPressed: () {},
              variant: Ux4gButtonVariant.primary,
              size: Ux4gButtonSize.medium,
              backgroundColor: isDark
                  ? Ux4gColors.primary300
                  : Ux4gColors.primary600,
              contentColor: isDark ? Ux4gColors.primary950 : Colors.white,
              textStyle: typography.lL_default,
            ),
          ),
        ],
      ),
    );
  }
}
