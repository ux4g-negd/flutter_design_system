import 'dart:ui' show PointerDeviceKind;

import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import '../../../widgets/component_docs.dart';

final searchResultsListComponent = WidgetbookComponent(
  name: 'Search Results List',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        return ComponentDocs(
          mobileMockup: true,
          name: 'Search Results List',
          description:
              'Search results pattern with filter chips, result count, '
              'and paginated service cards with Apply actions.',
          code: _searchResultsListCode,
          center: true,
          child: const _SearchResultsListMockup(),
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Source Code String
// ───────────────────────────────────────────────────────────────────────

const _searchResultsListCode = r"""import 'dart:ui' show PointerDeviceKind;

import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

class SearchResultsListScreen extends StatefulWidget {
  const SearchResultsListScreen({super.key});

  @override
  State<SearchResultsListScreen> createState() => _SearchResultsListScreenState();
}

class _SearchResultsListScreenState extends State<SearchResultsListScreen> {
  String _searchValue = 'income';
  int _selectedChip = 1; // 0=All, 1=Certificates, 2=Schemes, 3=Services

  final List<String> _options = [
    'Income Certificate',
    'Income Tax Return Filing',
    'Low Income Group Certificate',
    'Income & Asset Certificate',
    'EWS Certificate',
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final typography = Ux4gTheme.typography(context);
    return Scaffold(
      backgroundColor: isDark ? Ux4gColors.neutral950 : Ux4gColors.neutral50,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Ux4gAppHeader(
              variant: Ux4gAppHeaderVariant.filled,
              title: 'National Services Portal',
              titleStyle: Ux4gTheme.typography(
                context,
              ).tS_default.copyWith(color: Colors.white),
              showBackButton: true,
              onBackPressed: () => Navigator.pop(context),
            ),
            const SizedBox(height: 20),
            // Search bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: isDark ? Ux4gColors.neutral950 : Ux4gColors.neutral0,
              child: Builder(
                builder: (context) {
                  final filtered = _options
                      .where((e) => e.toLowerCase().contains(_searchValue.toLowerCase()))
                      .toList();
                  return Ux4gSearchField(
                    value: _searchValue,
                    onValueChange: (v) => setState(() => _searchValue = v),
                    variant: Ux4gSearchFieldVariant.autocomplete,
                    size: Ux4gSearchFieldSize.large,
                    placeholder: 'Search services...',
                    showVoiceIcon: true,
                    showClearIcon: true,
                    options: filtered,
                    onOptionSelected: (s) => setState(() => _searchValue = s),
                    onSubmitClick: (_) {},
                    buttonStyle: Ux4gSearchFieldButtonStyle.filled,
                  );
                },
              ),
            ),
            // Results count + filter
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Text(
                    '48 results',
                    style: typography.tS_default.copyWith(
                      color: isDark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
                    ),
                  ),
                  const Spacer(),
                  Ux4gButton(
                    text: 'Filters',
                    onPressed: () {},
                    variant: Ux4gButtonVariant.outline,
                    size: Ux4gButtonSize.small,
                    leadingIcon: Icons.tune,
                    borderColor: Theme.of(context).brightness == Brightness.dark
                        ? Ux4gColors.neutral600
                        : Ux4gColors.neutral300,
                    contentColor:
                        Theme.of(context).brightness == Brightness.dark
                        ? Ux4gColors.neutral50
                        : Ux4gColors.neutral900,
                  ),
                ],
              ),
            ),
            // Filter chips
            ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: const {
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                  PointerDeviceKind.trackpad,
                  PointerDeviceKind.stylus,
                },
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                  Ux4gChoiceChip(text: 'All · 48', selected: _selectedChip == 0, onClick: () => setState(() => _selectedChip = 0)),
                  const SizedBox(width: 8),
                  Ux4gChoiceChip(text: 'Certificates · 22', selected: _selectedChip == 1, onClick: () => setState(() => _selectedChip = 1)),
                  const SizedBox(width: 8),
                  Ux4gChoiceChip(text: 'Schemes · 14', selected: _selectedChip == 2, onClick: () => setState(() => _selectedChip = 2)),
                  const SizedBox(width: 8),
                  Ux4gChoiceChip(text: 'Services · 12', selected: _selectedChip == 3, onClick: () => setState(() => _selectedChip = 3)),
                  const SizedBox(width: 8),
                  Ux4gChoiceChip(text: 'Documents · 8', selected: false, onClick: () {}),
                  const SizedBox(width: 8),
                  Ux4gChoiceChip(text: 'Applications · 5', selected: false, onClick: () {}),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Results list
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _ResultCard(title: 'Income Certificate', fee: 'Free', time: '20 mins'),
                  _ResultCard(title: 'Income Tax Return (ITR) Filing', fee: 'Free', time: '30 mins'),
                  _ResultCard(title: 'Low Income Group (LIG) Certificate', fee: 'Free', time: '7 days'),
                  _ResultCard(title: 'Income & Asset Certificate', fee: '₹50+', time: '15 days', isPaid: true),
                  _ResultCard(title: 'EWS Certificate', fee: 'Free', time: '10 days'),
                ],
              ),
            ),
            // Pagination
            Padding(
              padding: const EdgeInsets.all(16),
              child: Ux4gPagination(totalPages: 8, currentPage: 1, onPageChanged: (_) {}),
            ),
          ],
        ),
      ),
    );
  }
}

class _ResultCard extends StatelessWidget {
  final String title;
  final String fee;
  final String time;
  final bool isPaid;
  const _ResultCard({required this.title, required this.fee, required this.time, this.isPaid = false});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final typography = Ux4gTheme.typography(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark ? Ux4gColors.neutral900 : Ux4gColors.neutral0,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: typography.tS_default.copyWith(
                    color: isDark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        isPaid ? 'Paid' : 'Free',
                        style: typography.lM_default.copyWith(
                          color: isDark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
                        ),
                      ),
                    ),
                    if (isPaid) ...[
                      const SizedBox(width: 4),
                      Text(
                        fee,
                        style: typography.lS_default.copyWith(
                          color: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700,
                        ),
                      ),
                    ],
                    const SizedBox(width: 6),
                    Icon(
                      Icons.access_time,
                      size: 12,
                      color: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      time,
                      style: typography.lS_default.copyWith(
                        color: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Ux4gButton(
            text: 'Apply',
            onPressed: () {},
            variant: Ux4gButtonVariant.outline,
            size: Ux4gButtonSize.small,
            borderColor: isDark ? Ux4gColors.neutral600 : Ux4gColors.neutral300,
            contentColor: isDark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
            textStyle: typography.lL_default,
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

class _SearchResultsListMockup extends StatefulWidget {
  const _SearchResultsListMockup();

  @override
  State<_SearchResultsListMockup> createState() =>
      _SearchResultsListMockupState();
}

class _SearchResultsListMockupState extends State<_SearchResultsListMockup> {
  int _selectedChip = 1;
  String _searchValue = 'income';

  final List<String> _options = [
    'Income Certificate',
    'Income Tax Return Filing',
    'Low Income Group Certificate',
    'Income & Asset Certificate',
    'EWS Certificate',
  ];

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
                height: 70,
                padding: const EdgeInsets.only(left: 24, right: 16),
                color: Ux4gColors.primary600,
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
                color: isDark ? Ux4gColors.neutral950 : Ux4gColors.neutral0,
                child: Builder(
                  builder: (context) {
                    final filtered = _options
                        .where(
                          (e) => e.toLowerCase().contains(
                            _searchValue.toLowerCase(),
                          ),
                        )
                        .toList();
                    return Ux4gSearchField(
                      value: _searchValue,
                      onValueChange: (v) => setState(() => _searchValue = v),
                      variant: Ux4gSearchFieldVariant.autocomplete,
                      size: Ux4gSearchFieldSize.large,
                      placeholder: 'Search services...',
                      showVoiceIcon: true,
                      showClearIcon: true,
                      options: filtered,
                      onOptionSelected: (s) => setState(() => _searchValue = s),
                      onSubmitClick: (_) {},
                      buttonStyle: Ux4gSearchFieldButtonStyle.filled,
                    );
                  },
                ),
              ),

              // Results count + Filters
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                child: Row(
                  children: [
                    Text(
                      '48 results',
                      style: typography.tS_default.copyWith(
                        color: isDark
                            ? Ux4gColors.neutral50
                            : Ux4gColors.neutral900,
                      ),
                    ),
                    const Spacer(),
                    Ux4gButton(
                      text: 'Filters',
                      onPressed: () {},
                      variant: Ux4gButtonVariant.outline,
                      size: Ux4gButtonSize.small,
                      leadingIcon: Icons.tune,
                      borderColor: isDark
                          ? Ux4gColors.neutral600
                          : Ux4gColors.neutral300,
                      contentColor: isDark
                          ? Ux4gColors.neutral50
                          : Ux4gColors.neutral900,
                      width: 100,
                      height: 38,
                    ),
                  ],
                ),
              ),

              // Filter chips
              const SizedBox(height: 10),
              ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: const {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                    PointerDeviceKind.trackpad,
                    PointerDeviceKind.stylus,
                  },
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Ux4gChoiceChip(
                        text: 'All · 48',
                        selected: _selectedChip == 0,
                        onClick: () => setState(() => _selectedChip = 0),
                      ),
                      const SizedBox(width: 8),
                      Ux4gChoiceChip(
                        text: 'Certificates · 22',
                        selected: _selectedChip == 1,
                        onClick: () => setState(() => _selectedChip = 1),
                      ),
                      const SizedBox(width: 8),
                      Ux4gChoiceChip(
                        text: 'Schemes · 14',
                        selected: _selectedChip == 2,
                        onClick: () => setState(() => _selectedChip = 2),
                      ),
                      const SizedBox(width: 8),
                      Ux4gChoiceChip(
                        text: 'Services · 12',
                        selected: _selectedChip == 3,
                        onClick: () => setState(() => _selectedChip = 3),
                      ),
                      const SizedBox(width: 8),
                      Ux4gChoiceChip(
                        text: 'Documents · 8',
                        selected: false,
                        onClick: () {},
                      ),
                      const SizedBox(width: 8),
                      Ux4gChoiceChip(
                        text: 'Applications · 5',
                        selected: false,
                        onClick: () {},
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Results list
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    _buildResultCard(
                      'Income Certificate',
                      'Free',
                      '20 mins',
                      false,
                    ),
                    _buildResultCard(
                      'Income Tax Return (ITR) Filing',
                      'Free',
                      '30 mins',
                      false,
                    ),
                    _buildResultCard(
                      'Low Income Group (LIG)\nCertificate',
                      'Free',
                      '7 days',
                      false,
                    ),
                    _buildResultCard(
                      'Income & Asset Certificate',
                      '₹ 50+',
                      '15 days',
                      true,
                    ),
                    _buildResultCard(
                      'EWS Certificate',
                      'Free',
                      '10 days',
                      false,
                    ),
                  ],
                ),
              ),

              // Pagination dots
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: isDark
                            ? Ux4gColors.primary800
                            : Ux4gColors.primary100,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.chevron_left,
                        size: 19,
                        color: isDark
                            ? Ux4gColors.primary200
                            : Ux4gColors.primary600,
                      ),
                    ),
                    const SizedBox(width: 11),
                    Container(
                      width: 31,
                      height: 10,
                      decoration: BoxDecoration(
                        color: isDark
                            ? Ux4gColors.primary300
                            : Ux4gColors.primary600,
                        borderRadius: BorderRadius.circular(99),
                      ),
                    ),
                    const SizedBox(width: 7),
                    ...List.generate(
                      7,
                      (i) => Container(
                        width: 9,
                        height: 9,
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isDark
                              ? Ux4gColors.primary800
                              : Ux4gColors.primary100,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: isDark
                            ? Ux4gColors.primary800
                            : Ux4gColors.primary100,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.chevron_right,
                        size: 19,
                        color: isDark
                            ? Ux4gColors.primary200
                            : Ux4gColors.primary600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResultCard(String title, String fee, String time, bool isPaid) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final typography = Ux4gTheme.typography(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
      decoration: BoxDecoration(
        color: isDark ? Ux4gColors.neutral900 : Ux4gColors.neutral0,
        border: Border(
          bottom: BorderSide(
            color: isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: typography.tS_default.copyWith(
                    color: isDark
                        ? Ux4gColors.neutral50
                        : Ux4gColors.neutral900,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: isDark
                            ? Ux4gColors.neutral800
                            : Ux4gColors.neutral200,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        isPaid ? 'Paid' : 'Free',
                        style: typography.lM_default.copyWith(
                          color: isDark
                              ? Ux4gColors.neutral50
                              : Ux4gColors.neutral900,
                        ),
                      ),
                    ),
                    if (isPaid) ...[
                      const SizedBox(width: 4),
                      Text(
                        fee,
                        style: typography.lS_default.copyWith(
                          color: isDark
                              ? Ux4gColors.neutral200
                              : Ux4gColors.neutral700,
                        ),
                      ),
                    ],
                    const SizedBox(width: 6),
                    Icon(
                      Icons.access_time,
                      size: 12,
                      color: isDark
                          ? Ux4gColors.neutral200
                          : Ux4gColors.neutral700,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      time,
                      style: typography.lS_default.copyWith(
                        color: isDark
                            ? Ux4gColors.neutral200
                            : Ux4gColors.neutral700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Ux4gButton(
            text: 'Apply',
            onPressed: () {},
            variant: Ux4gButtonVariant.outline,
            size: Ux4gButtonSize.small,
            borderColor: isDark
                ? Ux4gColors.neutral600
                : Ux4gColors.neutral300,
            contentColor: isDark
                ? Ux4gColors.neutral50
                : Ux4gColors.neutral900,
            textStyle: typography.lL_default,
          ),
          const SizedBox(width: 4),
          Icon(
            Icons.keyboard_arrow_down,
            size: 20,
            color: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700,
          ),
        ],
      ),
    );
  }
}
