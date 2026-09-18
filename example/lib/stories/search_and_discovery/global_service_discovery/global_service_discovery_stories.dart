import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import '../../../widgets/component_docs.dart';

const Color _primaryColor = Ux4gColors.primary600;

final globalServiceDiscoveryComponent = WidgetbookComponent(
  name: 'Global Service Discovery',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        return ComponentDocs(
          mobileMockup: true,
          name: 'Global Service Discovery',
          description:
              'Full service discovery pattern with search, category grid, featured scheme, '
              'popular services, personalized recommendations, and eligibility quiz CTA.',
          code: _globalServiceDiscoveryCode,
          center: true,
          child: const _GlobalServiceDiscoveryMockup(),
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Source Code String
// ───────────────────────────────────────────────────────────────────────

const _globalServiceDiscoveryCode = r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

class GlobalServiceDiscoveryScreen extends StatefulWidget {
  const GlobalServiceDiscoveryScreen({super.key});

  @override
  State<GlobalServiceDiscoveryScreen> createState() => _GlobalServiceDiscoveryScreenState();
}

class _GlobalServiceDiscoveryScreenState extends State<GlobalServiceDiscoveryScreen> {
  String _searchValue = '';

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final typography = Ux4gTheme.typography(context);

    return Scaffold(
      backgroundColor: isDark ? Ux4gColors.neutral950 : Ux4gColors.neutral50,
      body: SafeArea(
        child: Column(
          children: [
            // Header - filled purple
            Container(
              width: double.infinity,
              height: 56,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: Ux4gColors.primary600,
              child: Row(
                children: [
                  const Icon(Icons.arrow_back, color: Colors.white, size: 20),
                  const SizedBox(width: 12),
                  Text(
                    'National Services Portal',
                    style: typography.tS_default.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),

            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Search area
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Find any government service',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: isDark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Search 3,000+ services & schemes',
                            style: TextStyle(
                              fontSize: 13,
                              color: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Ux4gSearchField(
                            value: _searchValue,
                            onValueChange: (v) => setState(() => _searchValue = v),
                            variant: Ux4gSearchFieldVariant.searchWithSubmit,
                            size: Ux4gSearchFieldSize.medium,
                            placeholder: 'Search for...',
                            showVoiceIcon: true,
                            showClearIcon: true,
                            onSubmitClick: (_) {},
                            buttonStyle: Ux4gSearchFieldButtonStyle.filled,
                          ),
                        ],
                      ),
                    ),

                    // Browse by category
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Browse by category',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: isDark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
                            ),
                          ),
                          const SizedBox(height: 12),
                          _buildCategoryGrid(isDark),
                        ],
                      ),
                    ),

                    // Featured Scheme
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: _buildFeaturedScheme(isDark),
                    ),

                    // Popular services
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Popular services',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: isDark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
                            ),
                          ),
                          const SizedBox(height: 12),
                          _buildServiceCard('Income Certificate', 'Revenue Department', 'Free', '20 mins', isDark, isFree: true),
                          const SizedBox(height: 12),
                          _buildServiceCard('Caste Certificate', 'Social Welfare Dept', 'Free', '15 mins', isDark, isFree: true),
                          const SizedBox(height: 12),
                          _buildServiceCard('Driving Licence', 'Transport Department', '₹200', '30 days', isDark, isFree: false),
                        ],
                      ),
                    ),

                    // Recommended for user
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Recommended for Ramesh Kumar',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: isDark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
                            ),
                          ),
                          const SizedBox(height: 12),
                          _buildServiceCard('PM Kisan Samman Nidhi', 'Agriculture Department', 'Free', '₹6,000/yr', isDark, isFree: true),
                          const SizedBox(height: 12),
                          _buildServiceCard('Ayushman Bharat (PM-JAY)', 'Health & Family Welfare', 'Free', '₹5L cover', isDark, isFree: true),
                          const SizedBox(height: 12),
                          _buildServiceCard('National Pension Scheme', 'Finance Ministry', 'Free', 'Tax benefit', isDark, isFree: true),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Eligibility quiz CTA
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: _buildEligibilityQuiz(isDark, typography),
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryGrid(bool isDark) {
    final categories = [
      (Icons.local_hospital_outlined, 'Health', '34 services'),
      (Icons.school_outlined, 'Education', '31 services'),
      (Icons.agriculture_outlined, 'Agriculture', '18 services'),
      (Icons.landscape_outlined, 'Land Records', '12 services'),
      (Icons.directions_bus_outlined, 'Transport', '15 services'),
      (Icons.people_outline, 'Social Welfare', '27 services'),
      (Icons.bolt_outlined, 'Utilities', '9 services'),
      (Icons.account_balance_outlined, 'Finance', '21 services'),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        mainAxisExtent: 112,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final (icon, label, count) = categories[index];
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isDark ? Ux4gColors.neutral900 : Ux4gColors.neutral0,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: isDark ? Ux4gColors.primary950 : Ux4gColors.primary50,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 20,
                  color: isDark ? Ux4gColors.primary300 : Ux4gColors.primary600,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                label,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                count,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 11,
                  color: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFeaturedScheme(bool isDark) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Ux4gColors.primary950 : Ux4gColors.primary50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? Ux4gColors.primary800 : Ux4gColors.primary100,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'FEATURED SCHEME',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: isDark ? Ux4gColors.primary300 : Ux4gColors.primary600,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'PM Awas Yojana (Urban)',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: isDark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Subsidised housing loans — Interest subsidy up to ₹2.67 lakh.',
            style: TextStyle(
              fontSize: 12,
              color: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: Ux4gButton(
              text: 'Check eligibility',
              onPressed: () {},
              variant: Ux4gButtonVariant.primary,
              size: Ux4gButtonSize.medium,
              backgroundColor: isDark ? Ux4gColors.primary300 : Ux4gColors.primary600,
              contentColor: isDark ? Ux4gColors.primary950 : Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(String title, String dept, String fee, String details, bool isDark, {required bool isFree}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark ? Ux4gColors.neutral900 : Ux4gColors.neutral0,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: isDark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            dept,
            style: TextStyle(
              fontSize: 12,
              color: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                fee,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: isFree
                      ? (isDark ? Ux4gColors.green300 : Ux4gColors.green600)
                      : (isDark ? Ux4gColors.neutral50 : Ux4gColors.neutral900),
                ),
              ),
              Text(
                '  ·  $details',
                style: TextStyle(
                  fontSize: 12,
                  color: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Ux4gButton(
            text: 'Apply',
            onPressed: () {},
            variant: Ux4gButtonVariant.outline,
            size: Ux4gButtonSize.small,
            borderColor: isDark ? Ux4gColors.neutral600 : Ux4gColors.primary300,
            contentColor: isDark ? Ux4gColors.neutral50 : Ux4gColors.primary600,
          ),
        ],
      ),
    );
  }

  Widget _buildEligibilityQuiz(bool isDark, Ux4gTypography typography) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Ux4gColors.primary950 : Ux4gColors.primary50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? Ux4gColors.primary600 : Ux4gColors.primary300,
        ),
      ),
      child: Column(
        children: [
          Text(
            "Not sure what you're eligible for?",
            style: typography.tS_strong.copyWith(
              color: isDark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Take a 2-minute quiz to find schemes you qualify for.',
            style: typography.lM_default.copyWith(
              color: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: Ux4gButton(
              text: 'Find my schemes',
              onPressed: () {},
              variant: Ux4gButtonVariant.secondary,
              size: Ux4gButtonSize.medium,
              backgroundColor: isDark ? Ux4gColors.primary800 : Ux4gColors.primary100,
              contentColor: isDark ? Ux4gColors.primary200 : Ux4gColors.primary700,
              borderWidth: 0,
            ),
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

class _GlobalServiceDiscoveryMockup extends StatefulWidget {
  const _GlobalServiceDiscoveryMockup();

  @override
  State<_GlobalServiceDiscoveryMockup> createState() =>
      _GlobalServiceDiscoveryMockupState();
}

class _GlobalServiceDiscoveryMockupState
    extends State<_GlobalServiceDiscoveryMockup> {
  String _searchValue = '';

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final typography = Ux4gTheme.typography(context);
    return Theme(
      data: Ux4gTheme.themeData(isDark: isDark),
      child: Scaffold(
        backgroundColor: isDark ? Ux4gColors.neutral950 : Ux4gColors.neutral50,
        body: SafeArea(
          child: Column(
            children: [
              // App Header - filled purple
              Container(
                width: double.infinity,
                height: 56,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Search area without solid white background container
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Find any government service',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: isDark
                                    ? Ux4gColors.neutral50
                                    : Ux4gColors.neutral900,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Search 3,000+ services & schemes',
                              style: TextStyle(
                                fontSize: 13,
                                color: isDark
                                    ? Ux4gColors.neutral200
                                    : Ux4gColors.neutral700,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Ux4gSearchField(
                              value: _searchValue,
                              onValueChange: (v) =>
                                  setState(() => _searchValue = v),
                              variant: Ux4gSearchFieldVariant.searchWithSubmit,
                              size: Ux4gSearchFieldSize.medium,
                              placeholder: 'Search for...',
                              showVoiceIcon: true,
                              showClearIcon: true,
                              onSubmitClick: (_) {},
                              buttonStyle: Ux4gSearchFieldButtonStyle.filled,
                            ),
                          ],
                        ),
                      ),

                      // Browse by category
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Browse by category',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: isDark
                                    ? Ux4gColors.neutral50
                                    : Ux4gColors.neutral900,
                              ),
                            ),
                            const SizedBox(height: 12),
                            _buildCategoryGrid(),
                          ],
                        ),
                      ),

                      // Featured Scheme
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: _buildFeaturedScheme(),
                      ),

                      // Popular services
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Popular services',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: isDark
                                    ? Ux4gColors.neutral50
                                    : Ux4gColors.neutral900,
                              ),
                            ),
                            const SizedBox(height: 12),
                            _buildServiceCard(
                              'Income Certificate',
                              'Revenue Department',
                              'Free',
                              '20 mins',
                              isFree: true,
                            ),
                            const SizedBox(height: 12),
                            _buildServiceCard(
                              'Caste Certificate',
                              'Social Welfare Dept',
                              'Free',
                              '15 mins',
                              isFree: true,
                            ),
                            const SizedBox(height: 12),
                            _buildServiceCard(
                              'Driving Licence',
                              'Transport Department',
                              '₹200',
                              '30 days',
                              isFree: false,
                            ),
                          ],
                        ),
                      ),

                      // Recommended for user
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Recommended for Ramesh Kumar',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: isDark
                                    ? Ux4gColors.neutral50
                                    : Ux4gColors.neutral900,
                              ),
                            ),
                            const SizedBox(height: 12),
                            _buildRecommendedCard(
                              'PM Kisan Samman Nidhi',
                              'Agriculture Department',
                              'Free',
                              '₹6,000/yr',
                            ),
                            const SizedBox(height: 12),
                            _buildRecommendedCard(
                              'Ayushman Bharat (PM-JAY)',
                              'Health & Family Welfare',
                              'Free',
                              '₹5L cover',
                            ),
                            const SizedBox(height: 12),
                            _buildRecommendedCard(
                              'National Pension Scheme',
                              'Finance Ministry',
                              'Free',
                              'Tax benefit',
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Eligibility quiz CTA
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: _buildEligibilityQuiz(),
                      ),

                      const SizedBox(height: 24),
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

  Widget _buildCategoryGrid() {
    final categories = [
      (Icons.local_hospital_outlined, 'Health', '34 services'),
      (Icons.school_outlined, 'Education', '31 services'),
      (Icons.agriculture_outlined, 'Agriculture', '18 services'),
      (Icons.landscape_outlined, 'Land Records', '12 services'),
      (Icons.directions_bus_outlined, 'Transport', '15 services'),
      (Icons.people_outline, 'Social Welfare', '27 services'),
      (Icons.bolt_outlined, 'Utilities', '9 services'),
      (Icons.account_balance_outlined, 'Finance', '21 services'),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        mainAxisExtent: 112,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final isDark = Theme.of(context).brightness == Brightness.dark;
        final (icon, label, count) = categories[index];
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isDark ? Ux4gColors.neutral900 : Ux4gColors.neutral0,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: isDark ? Ux4gColors.primary950 : Ux4gColors.primary50,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 20,
                  color: isDark ? Ux4gColors.primary300 : Ux4gColors.primary600,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                label,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                count,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 11,
                  color: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFeaturedScheme() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Ux4gColors.primary950 : Ux4gColors.primary50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? Ux4gColors.primary800 : Ux4gColors.primary100,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'FEATURED SCHEME',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: isDark ? Ux4gColors.primary300 : Ux4gColors.primary600,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'PM Awas Yojana (Urban)',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: isDark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Subsidised housing loans — Interest subsidy up to ₹2.67 lakh.',
            style: TextStyle(
              fontSize: 12,
              color: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: Ux4gButton(
              text: 'Check eligibility',
              onPressed: () {},
              variant: Ux4gButtonVariant.primary,
              size: Ux4gButtonSize.medium,
              backgroundColor: isDark
                  ? Ux4gColors.primary300
                  : Ux4gColors.primary600,
              contentColor: isDark ? Ux4gColors.primary950 : Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(
    String title,
    String dept,
    String fee,
    String time, {
    required bool isFree,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final typography = Ux4gTheme.typography(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark ? Ux4gColors.neutral900 : Ux4gColors.neutral0,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: typography.tS_strong.copyWith(
              color: isDark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            dept,
            style: typography.lM_default.copyWith(
              color: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                fee,
                style: typography.lM_default.copyWith(
                  fontWeight: FontWeight.w500,
                  color: isFree
                      ? (isDark ? Ux4gColors.green300 : Ux4gColors.green600)
                      : (isDark ? Ux4gColors.neutral50 : Ux4gColors.neutral900),
                ),
              ),
              Text(
                '  ·  $time',
                style: typography.lM_default.copyWith(
                  color: isDark
                      ? Ux4gColors.neutral200
                      : Ux4gColors.neutral700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Ux4gButton(
            text: 'Apply',
            onPressed: () {},
            variant: Ux4gButtonVariant.outline,
            size: Ux4gButtonSize.small,
            borderColor: isDark
                ? Ux4gColors.neutral600
                : Ux4gColors.primary300,
            contentColor: isDark
                ? Ux4gColors.neutral50
                : Ux4gColors.primary600,
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendedCard(
    String title,
    String dept,
    String fee,
    String benefit,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final typography = Ux4gTheme.typography(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark ? Ux4gColors.neutral900 : Ux4gColors.neutral0,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: typography.tS_strong.copyWith(
              color: isDark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            dept,
            style: typography.lM_default.copyWith(
              color: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                fee,
                style: typography.lM_default.copyWith(
                  color: isDark ? Ux4gColors.green300 : Ux4gColors.green600,
                ),
              ),
              Text(
                '  ·  $benefit',
                style: typography.lM_default.copyWith(
                  color: isDark
                      ? Ux4gColors.neutral200
                      : Ux4gColors.neutral700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Ux4gButton(
            text: 'Apply',
            onPressed: () {},
            variant: Ux4gButtonVariant.outline,
            size: Ux4gButtonSize.small,
            borderColor: isDark
                ? Ux4gColors.neutral600
                : Ux4gColors.primary300,
            contentColor: isDark
                ? Ux4gColors.neutral50
                : Ux4gColors.primary600,
          ),
        ],
      ),
    );
  }

  Widget _buildEligibilityQuiz() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final typography = Ux4gTheme.typography(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Ux4gColors.primary950 : Ux4gColors.primary50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? Ux4gColors.primary600 : Ux4gColors.primary300,
        ),
      ),
      child: Column(
        children: [
          Text(
            "Not sure what you're eligible for?",
            style: typography.tS_strong.copyWith(
              color: isDark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Take a 2-minute quiz to find schemes you qualify for.',
            style: typography.lM_default.copyWith(
              color: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: Ux4gButton(
              text: 'Find my schemes',
              onPressed: () {},
              variant: Ux4gButtonVariant.secondary,
              size: Ux4gButtonSize.medium,
              backgroundColor: isDark
                  ? Ux4gColors.primary800
                  : Ux4gColors.primary100,
              contentColor: isDark
                  ? Ux4gColors.primary200
                  : Ux4gColors.primary700,
              borderWidth: 0,
            ),
          ),
        ],
      ),
    );
  }
}
