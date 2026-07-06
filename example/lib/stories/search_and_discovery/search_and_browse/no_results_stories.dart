import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import '../../../widgets/component_docs.dart';

final noResultsComponent = WidgetbookComponent(
  name: 'No Results',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        return ComponentDocs(
          mobileMockup: true,
          name: 'No Results',
          description:
              'Empty state pattern when search returns no results. Shows suggestions, '
              'a browse all link, and popular services to help users continue.',
          code: _noResultsCode,
          center: true,
          child: const _NoResultsMockup(),
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Source Code String
// ───────────────────────────────────────────────────────────────────────

const _noResultsCode = r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

class NoResultsScreen extends StatefulWidget {
  const NoResultsScreen({super.key});

  @override
  State<NoResultsScreen> createState() => _NoResultsScreenState();
}

class _NoResultsScreenState extends State<NoResultsScreen> {
  String _searchValue = 'xyz123';

  final List<String> _suggestions = [
    'Income Certificate',
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
            const SizedBox(height: 20),
            // Search bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: Colors.white,
              child: Ux4gSearchField(
                value: _searchValue,
                onValueChange: (v) => setState(() => _searchValue = v),
                variant: Ux4gSearchFieldVariant.searchWithSubmit,
                placeholder: 'Search services...',
                showVoiceIcon: true,
                showClearIcon: true,
                buttonStyle: Ux4gSearchFieldButtonStyle.filled,
              ),
            ),
            // No results content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const SizedBox(height: 32),
                    // Search icon
                    Icon(Icons.search, size: 48, color: Color(0xFF432CBB)),
                    const SizedBox(height: 16),
                    Text(
                      'No services found for "$_searchValue"',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Text('Did you mean:', style: TextStyle(fontSize: 13, color: Color(0xFF4B5563))),
                    const SizedBox(height: 4),
                    Wrap(
                      children: _suggestions.map((s) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(s, style: TextStyle(fontSize: 13, color: Color(0xFF432CBB))),
                      )).toList(),
                    ),
                    const SizedBox(height: 20),
                    Ux4gButton(
                      text: 'Browse all services',
                      onPressed: () {},
                      variant: Ux4gButtonVariant.outline,
                      size: Ux4gButtonSize.medium,
                    ),
                    const SizedBox(height: 32),
                    // Popular services
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Popular services', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                    ),
                    const SizedBox(height: 12),
                    _PopularCard(title: 'Income Certificate', dept: 'Revenue Department', fee: 'Free', time: '20 mins'),
                    const SizedBox(height: 12),
                    _PopularCard(title: 'Ration Card', dept: 'Food & Civil Supplies', fee: 'Free', time: '10 days'),
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

class _PopularCard extends StatelessWidget {
  final String title;
  final String dept;
  final String fee;
  final String time;
  const _PopularCard({required this.title, required this.dept, required this.fee, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          const SizedBox(height: 2),
          Text(dept, style: TextStyle(fontSize: 12, color: Color(0xFF4B5563))),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(fee, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF16A34A))),
              Text('  ·  $time', style: TextStyle(fontSize: 12, color: Color(0xFF4B5563))),
            ],
          ),
          const SizedBox(height: 10),
          Ux4gButton(text: 'Apply', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.small),
        ],
      ),
    );
  }
}
""";

// ───────────────────────────────────────────────────────────────────────
// Mockup
// ───────────────────────────────────────────────────────────────────────

class _NoResultsMockup extends StatefulWidget {
  const _NoResultsMockup();

  @override
  State<_NoResultsMockup> createState() => _NoResultsMockupState();
}

class _NoResultsMockupState extends State<_NoResultsMockup> {
  String _searchValue = 'xyz123';

  final List<String> _suggestions = [
    'Income Certificate',
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
                height: 70,
                padding: const EdgeInsets.only(left: 24, right: 16),
                color: Ux4gPalette.primary600,
                child: Row(
                  children: [
                    const Icon(Icons.arrow_back, color: Colors.white, size: 20),
                    const SizedBox(width: 16),
                    Text(
                      'National Services Portal',
                      style: typography.tS_default.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Search bar area
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                color: isDark ? Ux4gPalette.neutral950 : Ux4gPalette.neutral0,
                child: Ux4gSearchField(
                  value: _searchValue,
                  onValueChange: (v) => setState(() => _searchValue = v),
                  variant: Ux4gSearchFieldVariant.searchWithSubmit,
                  size: Ux4gSearchFieldSize.large,
                  placeholder: 'Search services...',
                  showVoiceIcon: true,
                  showClearIcon: true,
                  onSubmitClick: (_) {},
                  buttonStyle: Ux4gSearchFieldButtonStyle.filled,
                ),
              ),

              // No results content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      // Search icon
                      Icon(
                        Icons.search,
                        size: 52,
                        color: isDark
                            ? Ux4gPalette.primary300
                            : Ux4gPalette.primary600,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'No services found for "$_searchValue"',
                        style: typography.tM_strong.copyWith(
                          color: isDark
                              ? Ux4gPalette.neutral50
                              : Ux4gPalette.neutral900,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Did you mean:',
                        style: typography.bM_default.copyWith(
                          color: isDark
                              ? Ux4gPalette.neutral200
                              : Ux4gPalette.neutral700,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Wrap(
                        children: _suggestions.asMap().entries.map((entry) {
                          final isLast = entry.key == _suggestions.length - 1;
                          return Text(
                            isLast ? entry.value : '${entry.value},  ',
                            style: typography.lL_default.copyWith(
                              color: isDark
                                  ? Ux4gPalette.primary300
                                  : Ux4gPalette.primary600,
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 20),
                      Ux4gButton(
                        text: 'Browse all services',
                        onPressed: () {},
                        variant: Ux4gButtonVariant.secondary,
                        size: Ux4gButtonSize.medium,
                        width: 180,
                        height: 44,
                        backgroundColor: isDark
                            ? Ux4gPalette.primary800
                            : Ux4gPalette.primary100,
                        contentColor: isDark
                            ? Ux4gPalette.primary200
                            : Ux4gPalette.primary700,
                        borderWidth: 0,
                      ),
                      const SizedBox(height: 48),
                      // Popular services
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Popular services',
                          style: typography.hS_default.copyWith(
                            color: isDark
                                ? Ux4gPalette.neutral50
                                : Ux4gPalette.neutral900,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildPopularCard(
                        'Income Certificate',
                        'Revenue Department',
                        'Free',
                        '20 mins',
                      ),
                      const SizedBox(height: 12),
                      _buildPopularCard(
                        'Ration Card',
                        'Food & Civil Supplies',
                        'Free',
                        '10 days',
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

  Widget _buildPopularCard(String title, String dept, String fee, String time) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final typography = Ux4gTheme.typography(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
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
            style: typography.tM_strong.copyWith(
              color: isDark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            dept,
            style: typography.lL_default.copyWith(
              color: isDark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                fee,
                style: typography.lL_default.copyWith(
                  color: isDark ? Ux4gPalette.green300 : Ux4gPalette.green600,
                ),
              ),
              Text(
                '  ·  $time',
                style: typography.lL_default.copyWith(
                  color: isDark
                      ? Ux4gPalette.neutral200
                      : Ux4gPalette.neutral700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Ux4gButton(
            text: 'Apply',
            onPressed: () {},
            variant: Ux4gButtonVariant.outline,
            size: Ux4gButtonSize.small,
            width: 80,
            height: 38,
            borderColor: isDark
                ? Ux4gPalette.neutral600
                : Ux4gPalette.primary300,
            contentColor: isDark
                ? Ux4gPalette.neutral50
                : Ux4gPalette.primary600,
            textStyle: typography.lL_default,
          ),
        ],
      ),
    );
  }
}
