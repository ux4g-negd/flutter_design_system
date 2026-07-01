import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';
import '../../../widgets/component_docs.dart';

const Color _primaryColor = Ux4gPalette.primary600;

final searchWithResultsComponent = WidgetbookComponent(
  name: 'Search with Results',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        return ComponentDocs(
          mobileMockup: true,
          name: 'Search with Results',
          description:
              'Search pattern with autocomplete suggestions showing matching '
              'services as the user types. Uses Ux4gSearchField with autocomplete variant.',
          code: _searchWithResultsCode,
          center: true,
          child: const _SearchWithResultsMockup(),
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Source Code String
// ───────────────────────────────────────────────────────────────────────

const _searchWithResultsCode = r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';

class SearchWithResultsScreen extends StatefulWidget {
  const SearchWithResultsScreen({super.key});

  @override
  State<SearchWithResultsScreen> createState() => _SearchWithResultsScreenState();
}

class _SearchWithResultsScreenState extends State<SearchWithResultsScreen> {
  String _searchValue = 'income';

  final List<String> _allServices = [
    'Income Certificate',
    'Income Tax Return Filing',
    'Low Income Group Certificate',
    'Income & Asset Certificate',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Ux4gAppHeader(
              variant: Ux4gAppHeaderVariant.filled,
              title: 'National Services Portal',
              showBackButton: true,
              onBackPressed: () => Navigator.pop(context),
            ),
            // Search area
            Container(
              padding: const EdgeInsets.all(16),
              color: const Color(0xFFF2EFFF),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Find any government service',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                  const SizedBox(height: 4),
                  const Text('Search 3,000+ services & schemes',
                    style: TextStyle(fontSize: 13, color: Color(0xFF4B5563))),
                  const SizedBox(height: 16),
                  Ux4gSearchField(
                    value: _searchValue,
                    onValueChange: (v) => setState(() => _searchValue = v),
                    variant: Ux4gSearchFieldVariant.autocomplete,
                    placeholder: 'Search services...',
                    showVoiceIcon: true,
                    showClearIcon: true,
                    options: _allServices,
                    onOptionSelected: (option) {
                      setState(() => _searchValue = option);
                    },
                  ),
                ],
              ),
            ),
            // Rest of content (browse by category, popular services)
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Browse by category grid...
                    // Popular services list...
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
""";

// ───────────────────────────────────────────────────────────────────────
// Mockup
// ───────────────────────────────────────────────────────────────────────

class _SearchWithResultsMockup extends StatefulWidget {
  const _SearchWithResultsMockup();

  @override
  State<_SearchWithResultsMockup> createState() =>
      _SearchWithResultsMockupState();
}

class _SearchWithResultsMockupState extends State<_SearchWithResultsMockup> {
  String _searchValue = 'income';

  final List<String> _options = [
    'Income Certificate',
    'Income Tax Return Filing',
    'Low Income Group Certificate',
    'Income & Asset Certificate',
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final typography = Ux4gTheme.typography(context);
    return Theme(
      data: Ux4gTheme.themeData(isDark: isDark),
      child: Scaffold(
        backgroundColor: isDark
            ? Ux4gPalette.neutral950
            : Ux4gPalette.neutral50,
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
                            ? Ux4gPalette.primary950
                            : Ux4gPalette.primary50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Find any government service',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: isDark
                                    ? Ux4gPalette.neutral50
                                    : Ux4gPalette.neutral900,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Search 3,000+ services & schemes',
                              style: TextStyle(
                                fontSize: 13,
                                color: isDark
                                    ? Ux4gPalette.neutral200
                                    : Ux4gPalette.neutral700,
                              ),
                            ),
                            const SizedBox(height: 16),

                            // Search field with autocomplete
                            Builder(
                              builder: (context) {
                                return Ux4gSearchField(
                                  value: _searchValue,
                                  onValueChange: (v) =>
                                      setState(() => _searchValue = v),
                                  variant:
                                      Ux4gSearchFieldVariant.searchWithSubmit,
                                  size: Ux4gSearchFieldSize.medium,
                                  placeholder: 'Search services...',
                                  showVoiceIcon: true,
                                  showClearIcon: true,
                                  onSubmitClick: (_) {},
                                  buttonStyle:
                                      Ux4gSearchFieldButtonStyle.filled,
                                );
                              },
                            ),
                            const SizedBox(height: 4),
                            _buildSuggestionPanel(isDark),
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
                                    ? Ux4gPalette.neutral50
                                    : Ux4gPalette.neutral900,
                              ),
                            ),
                            const SizedBox(height: 12),
                            _buildCategoryGrid(),
                            const SizedBox(height: 24),

                            // Popular services
                            Text(
                              'Popular services',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: isDark
                                    ? Ux4gPalette.neutral50
                                    : Ux4gPalette.neutral900,
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

  Widget _buildSuggestionPanel(bool isDark) {
    const departments = {
      'Income Certificate': 'Revenue Dept',
      'Income Tax Return Filing': 'Income Tax Dept',
      'Low Income Group Certificate': 'Social Welfare',
      'Income & Asset Certificate': 'Revenue Dept',
    };
    final matches = _options
        .where(
          (service) =>
              service.toLowerCase().contains(_searchValue.trim().toLowerCase()),
        )
        .toList();
    final typography = Ux4gTheme.typography(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 8),
      decoration: BoxDecoration(
        color: isDark ? Ux4gPalette.neutral900 : Ux4gPalette.neutral0,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: isDark ? Ux4gPalette.neutral800 : Ux4gPalette.neutral200,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.24 : 0.08),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              text: 'Searching for ',
              children: [
                TextSpan(
                  text: '\'$_searchValue\'',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            style: typography.lS_default.copyWith(
              color: isDark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700,
            ),
          ),
          const SizedBox(height: 6),
          for (final service in matches)
            InkWell(
              onTap: () => setState(() => _searchValue = service),
              borderRadius: BorderRadius.circular(4),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  children: [
                    Icon(
                      Icons.manage_search,
                      size: 16,
                      color: isDark
                          ? Ux4gPalette.neutral200
                          : Ux4gPalette.neutral700,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        service,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: typography.lM_default.copyWith(
                          color: isDark
                              ? Ux4gPalette.neutral50
                              : Ux4gPalette.neutral900,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      departments[service] ?? '',
                      style: typography.lS_default.copyWith(
                        color: isDark
                            ? Ux4gPalette.neutral400
                            : Ux4gPalette.neutral600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
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
            color: isDark ? Ux4gPalette.neutral900 : Ux4gPalette.neutral0,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isDark ? Ux4gPalette.neutral800 : Ux4gPalette.neutral200,
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
                      ? Ux4gPalette.primary950
                      : Ux4gPalette.primary50,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 20,
                  color: isDark
                      ? Ux4gPalette.primary300
                      : Ux4gPalette.primary600,
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
                      ? Ux4gPalette.neutral50
                      : Ux4gPalette.neutral900,
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
                      ? Ux4gPalette.neutral200
                      : Ux4gPalette.neutral700,
                ),
              ),
            ],
          ),
        );
      },
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
        color: isDark ? Ux4gPalette.neutral900 : Ux4gPalette.neutral100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? Ux4gPalette.neutral800 : Ux4gPalette.neutral200,
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
              color: isDark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            dept,
            style: TextStyle(
              fontSize: 12,
              color: isDark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700,
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
                  color: isDark ? Ux4gPalette.green300 : Ux4gPalette.green600,
                ),
              ),
              Text(
                '  ·  $time',
                style: TextStyle(
                  fontSize: 12,
                  color: isDark
                      ? Ux4gPalette.neutral200
                      : Ux4gPalette.neutral700,
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
                ? Ux4gPalette.neutral600
                : Ux4gPalette.primary300,
            contentColor: isDark
                ? Ux4gPalette.neutral50
                : Ux4gPalette.primary600,
          ),
        ],
      ),
    );
  }
}
