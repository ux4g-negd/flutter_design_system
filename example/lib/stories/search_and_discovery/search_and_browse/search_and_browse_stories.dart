import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import '../../../widgets/component_docs.dart';

const Color _primaryColor = Ux4gColors.primary600;

final searchAndBrowseComponent = WidgetbookComponent(
  name: 'Search and Browse Services',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        return ComponentDocs(
          mobileMockup: true,
          name: 'Search and Browse Services',
          description:
              'A discovery pattern for finding government services. Includes '
              'search bar, category grid, featured scheme, popular services list, '
              'and an eligibility quiz CTA.',
          code: _searchAndBrowseCode,
          center: true,
          child: const _SearchAndBrowseMockup(),
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Source Code String
// ───────────────────────────────────────────────────────────────────────

const _searchAndBrowseCode = r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

class SearchAndBrowseScreen extends StatelessWidget {
  const SearchAndBrowseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final typography = Ux4gTheme.typography(context);
    return Scaffold(
      backgroundColor: isDark ? Ux4gColors.neutral950 : Ux4gColors.neutral50,
      body: SafeArea(
        child: Column(
          children: [
            // App Header
            Ux4gAppHeader(
              variant: Ux4gAppHeaderVariant.filled,
              title: 'National Services Portal',
              titleStyle: typography.tS_default.copyWith(color: Colors.white),
              showBackButton: true,
              onBackPressed: () => Navigator.pop(context),
            ),
            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title + subtitle
                    Text('Find any government service',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800,
                        color: isDark ? Ux4gColors.neutral50 : Ux4gColors.neutral900)),
                    const SizedBox(height: 4),
                    Text('Search 3,000+ services & schemes',
                      style: TextStyle(fontSize: 13,
                        color: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700)),
                    const SizedBox(height: 16),

                    // Search bar
                    Ux4gInputField(
                      value: '',
                      onValueChange: (_) {},
                      placeholder: 'Search services...',
                      leadingIcon: Icons.search,
                      trailingIcon: Icons.mic,
                    ),
                    const SizedBox(height: 24),

                    // Browse by category
                    Text('Browse by category',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700,
                        color: isDark ? Ux4gColors.neutral50 : Ux4gColors.neutral900)),
                    const SizedBox(height: 12),
                    // 2-column grid of category cards
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 1.4,
                      children: [
                        _CategoryCard(icon: Icons.health_and_safety, label: 'Health', count: '24 services'),
                        _CategoryCard(icon: Icons.agriculture, label: 'Agriculture', count: '18 services'),
                        _CategoryCard(icon: Icons.school, label: 'Education', count: '31 services'),
                        _CategoryCard(icon: Icons.landscape, label: 'Land Records', count: '12 services'),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Featured scheme
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isDark ? Ux4gColors.primary950 : Ux4gColors.primary50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: isDark ? Ux4gColors.primary800 : Ux4gColors.primary100),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('FEATURED SCHEME',
                            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600,
                              color: isDark ? Ux4gColors.primary300 : Ux4gColors.primary600)),
                          const SizedBox(height: 4),
                          Text('PM Awas Yojana (Urban)',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700,
                              color: isDark ? Ux4gColors.neutral50 : Ux4gColors.neutral900)),
                          const SizedBox(height: 4),
                          Text('Subsidised housing loans — interest subsidy up to ₹2.67 lakh.',
                            style: TextStyle(fontSize: 13,
                              color: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700)),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            child: Ux4gButton(
                              text: 'Check eligibility',
                              onPressed: () {},
                              variant: Ux4gButtonVariant.primary,
                              backgroundColor: isDark ? Ux4gColors.primary300 : Ux4gColors.primary600,
                              contentColor: isDark ? Ux4gColors.primary950 : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Popular services
                    Text('Popular services',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700,
                        color: isDark ? Ux4gColors.neutral50 : Ux4gColors.neutral900)),
                    const SizedBox(height: 12),
                    _ServiceCard(
                      title: 'Income Certificate',
                      dept: 'Revenue Department',
                      fee: 'Free',
                      time: '20 mins',
                    ),
                    const SizedBox(height: 12),
                    _ServiceCard(
                      title: 'Caste Certificate',
                      dept: 'Social Welfare Dept',
                      fee: 'Free',
                      time: '15 mins',
                    ),
                    const SizedBox(height: 12),
                    _ServiceCard(
                      title: 'Driving Licence',
                      dept: 'Transport Department',
                      fee: '₹200',
                      time: '30 days',
                    ),
                    const SizedBox(height: 24),

                    // Quiz CTA
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isDark ? Ux4gColors.primary950 : Ux4gColors.primary50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: isDark ? Ux4gColors.primary600 : Ux4gColors.primary300),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Not sure what you\'re eligible for?',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700,
                              color: isDark ? Ux4gColors.neutral50 : Ux4gColors.neutral900)),
                          const SizedBox(height: 4),
                          Text('Take a 2-minute quiz to find schemes you qualify for.',
                            style: TextStyle(fontSize: 13,
                              color: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700)),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            child: Ux4gButton(
                              text: 'Find my schemes',
                              onPressed: () {},
                              variant: Ux4gButtonVariant.secondary,
                              backgroundColor: isDark ? Ux4gColors.primary800 : Ux4gColors.primary100,
                              contentColor: isDark ? Ux4gColors.primary200 : Ux4gColors.primary700,
                            ),
                          ),
                        ],
                      ),
                    ),
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

class _CategoryCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String count;
  const _CategoryCard({required this.icon, required this.label, required this.count});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDark ? Ux4gColors.neutral900 : Ux4gColors.neutral0,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24,
            color: isDark ? Ux4gColors.primary300 : Ux4gColors.primary600),
          const SizedBox(height: 8),
          Text(label, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600,
            color: isDark ? Ux4gColors.neutral50 : Ux4gColors.neutral900)),
          Text(count, style: TextStyle(fontSize: 11,
            color: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700)),
        ],
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final String title;
  final String dept;
  final String fee;
  final String time;
  const _ServiceCard({required this.title, required this.dept, required this.fee, required this.time});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(14),
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
          Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600,
            color: isDark ? Ux4gColors.neutral50 : Ux4gColors.neutral900)),
          Text(dept, style: TextStyle(fontSize: 12,
            color: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700)),
          const SizedBox(height: 6),
          Row(
            children: [
              Text(fee, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600,
                color: isDark ? Ux4gColors.green300 : Ux4gColors.green600)),
              Text('  ·  $time', style: TextStyle(fontSize: 12,
                color: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700)),
            ],
          ),
          const SizedBox(height: 8),
          Ux4gButton(
            text: 'Apply', onPressed: () {},
            variant: Ux4gButtonVariant.outline,
            size: Ux4gButtonSize.small,
            borderColor: isDark ? Ux4gColors.neutral600 : Ux4gColors.primary300,
            contentColor: isDark ? Ux4gColors.neutral50 : Ux4gColors.primary600,
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

class _SearchAndBrowseMockup extends StatelessWidget {
  const _SearchAndBrowseMockup();

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
              // App Header - filled purple
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Search area with purple bg
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        color: isDark
                            ? Ux4gColors.primary950
                            : Ux4gColors.primary50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Title
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
                            const SizedBox(height: 16),

                            // Search bar
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 44,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      color: isDark
                                          ? Ux4gColors.neutral900
                                          : Colors.white,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        bottomLeft: Radius.circular(8),
                                      ),
                                      border: Border.all(
                                        color: isDark
                                            ? Ux4gColors.neutral800
                                            : Ux4gColors.neutral200,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.search,
                                          size: 20,
                                          color: isDark
                                              ? Ux4gColors.neutral200
                                              : Ux4gColors.neutral700,
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Text(
                                            'Search services...',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: isDark
                                                  ? Ux4gColors.neutral400
                                                  : Ux4gColors.neutral700,
                                            ),
                                          ),
                                        ),
                                        Icon(
                                          Icons.mic,
                                          size: 20,
                                          color: isDark
                                              ? Ux4gColors.neutral200
                                              : Ux4gColors.neutral700,
                                        ),
                                        const SizedBox(width: 8),
                                        Icon(
                                          Icons.close,
                                          size: 18,
                                          color: isDark
                                              ? Ux4gColors.neutral200
                                              : Ux4gColors.neutral700,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 44,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    color: isDark
                                        ? Ux4gColors.primary300
                                        : Ux4gColors.primary600,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(8),
                                      bottomRight: Radius.circular(8),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.search,
                                    color: isDark
                                        ? Ux4gColors.primary950
                                        : Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Rest of content
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Browse by category
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

                            // Category grid
                            _buildCategoryGrid(),
                            const SizedBox(height: 24),

                            // Featured scheme
                            _buildFeaturedScheme(context),
                            const SizedBox(height: 24),

                            // Popular services
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
                              context,
                            ),
                            const SizedBox(height: 12),
                            _buildServiceCard(
                              'Caste Certificate',
                              'Social Welfare Dept',
                              'Free',
                              '15 mins',
                              context,
                            ),
                            const SizedBox(height: 12),
                            _buildServiceCard(
                              'Driving Licence',
                              'Transport Department',
                              '₹200',
                              '30 days',
                              context,
                            ),
                            const SizedBox(height: 24),

                            // Quiz CTA
                            _buildQuizCta(context),
                          ],
                        ),
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

  static Widget _buildCategoryGrid() {
    final categories = [
      (Icons.health_and_safety_outlined, 'Health', '24 services'),
      (Icons.agriculture_outlined, 'Agriculture', '18 services'),
      (Icons.school_outlined, 'Education', '31 services'),
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
            color: isDark ? Ux4gColors.neutral900 : Colors.white,
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
                  color: isDark
                      ? Ux4gColors.primary950
                      : Ux4gColors.primary50,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 20,
                  color: isDark
                      ? Ux4gColors.primary300
                      : Ux4gColors.primary600,
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
                  color: isDark
                      ? Ux4gColors.neutral50
                      : Ux4gColors.neutral900,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                count,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 11,
                  color: isDark
                      ? Ux4gColors.neutral200
                      : Ux4gColors.neutral700,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static Widget _buildFeaturedScheme(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Ux4gColors.primary950 : Ux4gColors.primary50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'FEATURED SCHEME',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: isDark ? Ux4gColors.primary300 : Ux4gColors.primary600,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 6),
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
            'Subsidised housing loans — interest subsidy up to\n₹2.67 lakh.',
            style: TextStyle(
              fontSize: 13,
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
              backgroundColor: isDark
                  ? Ux4gColors.primary300
                  : Ux4gColors.primary600,
              contentColor: isDark ? Ux4gColors.primary950 : Colors.white,
              height: 44,
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildServiceCard(
    String title,
    String dept,
    String fee,
    String time,
    BuildContext context,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
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
                  fontWeight: FontWeight.w600,
                  color: isDark ? Ux4gColors.green300 : Ux4gColors.green600,
                ),
              ),
              Text(
                '  ·  $time',
                style: TextStyle(
                  fontSize: 12,
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

  static Widget _buildQuizCta(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Not sure what you\'re eligible for?',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: isDark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Take a 2-minute quiz to find schemes you qualify for.',
            style: TextStyle(
              fontSize: 13,
              color: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: Ux4gButton(
              text: 'Find my schemes',
              onPressed: () {},
              variant: Ux4gButtonVariant.secondary,
              backgroundColor: isDark
                  ? Ux4gColors.primary800
                  : Ux4gColors.primary100,
              contentColor: isDark
                  ? Ux4gColors.primary200
                  : Ux4gColors.primary700,
              height: 44,
            ),
          ),
        ],
      ),
    );
  }
}
