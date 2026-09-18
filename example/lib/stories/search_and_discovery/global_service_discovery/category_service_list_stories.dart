import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import '../../../widgets/component_docs.dart';

const Color _primaryColor = Ux4gColors.primary600;

final categoryServiceListComponent = WidgetbookComponent(
  name: 'Category Service List',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        return ComponentDocs(
          mobileMockup: true,
          name: 'Category Service List',
          description:
              'Category-specific service listing with breadcrumb, filter chips, '
              'and paginated service cards with details and Apply actions.',
          code: _categoryServiceListCode,
          center: true,
          child: const _CategoryServiceListMockup(),
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Source Code String
// ───────────────────────────────────────────────────────────────────────

const _categoryServiceListCode = r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

class CategoryServiceListScreen extends StatefulWidget {
  const CategoryServiceListScreen({super.key});

  @override
  State<CategoryServiceListScreen> createState() => _CategoryServiceListScreenState();
}

class _CategoryServiceListScreenState extends State<CategoryServiceListScreen> {
  int? _selectedChip;
  int get selectedChip => _selectedChip ?? 0;

  Set<int>? _expandedCards;
  Set<int> get expandedCards => _expandedCards ??= {0};

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? Ux4gColors.neutral950 : Ux4gColors.neutral50,
      body: SafeArea(
        child: Column(
          children: [
            // Header
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
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            // Scrollable Content
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // Breadcrumb
                  Row(
                    children: [
                      Icon(Icons.home_outlined, size: 14, color: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700),
                      const SizedBox(width: 4),
                      Text('Home', style: TextStyle(fontSize: 12, color: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700)),
                      Text('  ›  ', style: TextStyle(fontSize: 12, color: isDark ? Ux4gColors.neutral400 : Ux4gColors.neutral600)),
                      Text('Services', style: TextStyle(fontSize: 12, color: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700)),
                      Text('  ›  ', style: TextStyle(fontSize: 12, color: isDark ? Ux4gColors.neutral400 : Ux4gColors.neutral600)),
                      Text(
                        'Health',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: isDark ? Ux4gColors.primary300 : Ux4gColors.primary600,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Title + Subtitle
                  Text(
                    'Health services',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: isDark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Hospitals, certificates, insurance and disability',
                    style: TextStyle(
                      fontSize: 13,
                      color: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Results count + Filters button
                  Row(
                    children: [
                      Text(
                        '48 services',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
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
                        borderColor: isDark ? Ux4gColors.neutral600 : Ux4gColors.neutral300,
                        contentColor: isDark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Filter chips
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildChip('Hospitals · 12', 0, isDark),
                        const SizedBox(width: 8),
                        _buildChip('Certificates · 18', 1, isDark),
                        const SizedBox(width: 8),
                        _buildChip('Insurance · 9', 2, isDark),
                        const SizedBox(width: 8),
                        _buildChip('Disability · 9', 3, isDark),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Service cards
                  _buildServiceCard(
                    index: 0,
                    title: 'Ayushman Bharat Health Card',
                    badge: 'Paid',
                    time: '7 days',
                    isDark: isDark,
                    isExpanded: expandedCards.contains(0),
                    onToggleExpand: () => _toggleExpand(0),
                    details: [
                      ('Eligibility', 'SECC 2011 families', 'Coverage', '₹5,00,000 per year'),
                      ('Department', 'Health & Family Welfare', 'Apply at', 'Empanelled hospitals'),
                      ('Documents', 'Aadhaar, ration card', 'Card type', 'Digital, downloadable'),
                    ],
                  ),
                  const SizedBox(height: 12),

                  _buildServiceCard(
                    index: 1,
                    title: 'Hospital Empanelment',
                    badge: 'Paid',
                    time: '30 days',
                    isDark: isDark,
                    isExpanded: expandedCards.contains(1),
                    onToggleExpand: () => _toggleExpand(1),
                  ),
                  const SizedBox(height: 12),

                  _buildServiceCard(
                    index: 2,
                    title: 'Birth Certificate',
                    badge: 'Paid',
                    time: '20 mins',
                    isDark: isDark,
                    isExpanded: expandedCards.contains(2),
                    onToggleExpand: () => _toggleExpand(2),
                  ),
                  const SizedBox(height: 12),

                  _buildServiceCard(
                    index: 3,
                    title: 'Disability Certificate (UDID)',
                    badge: 'Paid',
                    time: '15 days',
                    isDark: isDark,
                    isExpanded: expandedCards.contains(3),
                    onToggleExpand: () => _toggleExpand(3),
                  ),
                  const SizedBox(height: 12),

                  _buildServiceCard(
                    index: 4,
                    title: 'Health Insurance Claim',
                    badge: 'Paid',
                    time: '10 days',
                    isDark: isDark,
                    isExpanded: expandedCards.contains(4),
                    onToggleExpand: () => _toggleExpand(4),
                  ),
                  const SizedBox(height: 12),

                  _buildServiceCard(
                    index: 5,
                    title: 'Vaccination Certificate',
                    badge: 'Paid',
                    time: 'Instant',
                    isDark: isDark,
                    isExpanded: expandedCards.contains(5),
                    onToggleExpand: () => _toggleExpand(5),
                  ),
                  const SizedBox(height: 12),

                  _buildServiceCard(
                    index: 6,
                    title: 'Medical Reimbursement',
                    badge: 'Paid',
                    extraFee: '₹ 50/-',
                    time: '21 days',
                    isDark: isDark,
                    isExpanded: expandedCards.contains(6),
                    onToggleExpand: () => _toggleExpand(6),
                  ),
                  const SizedBox(height: 12),

                  _buildServiceCard(
                    index: 7,
                    title: 'Janani Suraksha Yojana',
                    badge: 'Paid',
                    time: 'On delivery',
                    isDark: isDark,
                    isExpanded: expandedCards.contains(7),
                    onToggleExpand: () => _toggleExpand(7),
                  ),

                  const SizedBox(height: 16),

                  // Pagination
                  _buildPagination(isDark),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _toggleExpand(int index) {
    setState(() {
      if (expandedCards.contains(index)) {
        expandedCards.remove(index);
      } else {
        expandedCards.add(index);
      }
    });
  }

  Widget _buildChip(String label, int index, bool isDark) {
    final isSelected = selectedChip == index;
    return InkWell(
      onTap: () => setState(() => _selectedChip = index),
      borderRadius: BorderRadius.circular(6),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected
              ? (isDark ? Ux4gColors.primary800 : Ux4gColors.primary100)
              : (isDark ? Ux4gColors.neutral900 : Ux4gColors.neutral0),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: isSelected
                ? (isDark ? Ux4gColors.primary600 : Ux4gColors.primary400)
                : (isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral300),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            color: isSelected
                ? (isDark ? Ux4gColors.primary200 : Ux4gColors.primary700)
                : (isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700),
          ),
        ),
      ),
    );
  }

  Widget _buildServiceCard({
    required int index,
    required String title,
    required String badge,
    required String time,
    required bool isDark,
    required bool isExpanded,
    required VoidCallback onToggleExpand,
    String? extraFee,
    List<(String, String, String, String)>? details,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark ? Ux4gColors.neutral900 : Ux4gColors.neutral0,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
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
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral100,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            badge,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700,
                            ),
                          ),
                        ),
                        if (extraFee != null) ...[
                          const SizedBox(width: 6),
                          Text(
                            extraFee,
                            style: TextStyle(
                              fontSize: 11,
                              color: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700,
                            ),
                          ),
                        ],
                        const SizedBox(width: 8),
                        Icon(
                          Icons.access_time,
                          size: 13,
                          color: isDark ? Ux4gColors.neutral400 : Ux4gColors.neutral500,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          time,
                          style: TextStyle(
                            fontSize: 11,
                            color: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700,
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
                borderColor: isDark ? Ux4gColors.neutral600 : Ux4gColors.neutral300,
                contentColor: isDark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
              ),
              const SizedBox(width: 4),
              InkWell(
                onTap: onToggleExpand,
                child: Icon(
                  isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  size: 20,
                  color: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700,
                ),
              ),
            ],
          ),
          if (isExpanded && details != null) ...[
            const SizedBox(height: 12),
            Divider(height: 1, color: isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
            const SizedBox(height: 12),
            ...details.map(
              (d) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildDetailItem(d.$1, d.$2, isDark)),
                    const SizedBox(width: 12),
                    Expanded(child: _buildDetailItem(d.$3, d.$4, isDark)),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDetailItem(String label, String value, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: isDark ? Ux4gColors.neutral300 : Ux4gColors.neutral600,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: isDark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
          ),
        ),
      ],
    );
  }

  Widget _buildPagination(bool isDark) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: isDark ? Ux4gColors.primary800 : Ux4gColors.primary100,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.chevron_left,
            size: 18,
            color: isDark ? Ux4gColors.primary200 : Ux4gColors.primary600,
          ),
        ),
        const SizedBox(width: 10),
        Container(
          width: 30,
          height: 10,
          decoration: BoxDecoration(
            color: isDark ? Ux4gColors.primary300 : Ux4gColors.primary600,
            borderRadius: BorderRadius.circular(99),
          ),
        ),
        const SizedBox(width: 6),
        ...List.generate(
          6,
          (i) => Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.symmetric(horizontal: 3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isDark ? Ux4gColors.primary800 : Ux4gColors.primary100,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: isDark ? Ux4gColors.primary800 : Ux4gColors.primary100,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.chevron_right,
            size: 18,
            color: isDark ? Ux4gColors.primary200 : Ux4gColors.primary600,
          ),
        ),
      ],
    );
  }
}
""";

// ───────────────────────────────────────────────────────────────────────
// Mockup Widget
// ───────────────────────────────────────────────────────────────────────

class _CategoryServiceListMockup extends StatefulWidget {
  const _CategoryServiceListMockup();

  @override
  State<_CategoryServiceListMockup> createState() =>
      _CategoryServiceListMockupState();
}

class _CategoryServiceListMockupState
    extends State<_CategoryServiceListMockup> {
  int? _selectedChip;
  int get selectedChip => _selectedChip ?? 0;

  Set<int>? _expandedCards;
  Set<int> get expandedCards => _expandedCards ??= {0};

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
              // Header
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
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    // Breadcrumb
                    Row(
                      children: [
                        Icon(
                          Icons.home_outlined,
                          size: 14,
                          color: isDark
                              ? Ux4gColors.neutral200
                              : Ux4gColors.neutral700,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Home',
                          style: typography.lM_default.copyWith(
                            color: isDark
                                ? Ux4gColors.neutral200
                                : Ux4gColors.neutral700,
                          ),
                        ),
                        Text(
                          '  ›  ',
                          style: typography.lM_default.copyWith(
                            color: isDark
                                ? Ux4gColors.neutral400
                                : Ux4gColors.neutral600,
                          ),
                        ),
                        Text(
                          'Services',
                          style: typography.lM_default.copyWith(
                            color: isDark
                                ? Ux4gColors.neutral200
                                : Ux4gColors.neutral700,
                          ),
                        ),
                        Text(
                          '  ›  ',
                          style: typography.lM_default.copyWith(
                            color: isDark
                                ? Ux4gColors.neutral400
                                : Ux4gColors.neutral600,
                          ),
                        ),
                        Text(
                          'Health',
                          style: typography.lM_strong.copyWith(
                            color: isDark
                                ? Ux4gColors.primary300
                                : Ux4gColors.primary600,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // Title section
                    Text(
                      'Health services',
                      style: typography.hXS_strong.copyWith(
                        color: isDark
                            ? Ux4gColors.neutral50
                            : Ux4gColors.neutral900,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Hospitals, certificates, insurance and disability',
                      style: typography.bS_default.copyWith(
                        color: isDark
                            ? Ux4gColors.neutral200
                            : Ux4gColors.neutral700,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Results count + Filters button
                    Row(
                      children: [
                        Text(
                          '48 services',
                          style: typography.tS_strong.copyWith(
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
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // Filter chips
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildChip('Hospitals · 12', 0, isDark),
                          const SizedBox(width: 8),
                          _buildChip('Certificates · 18', 1, isDark),
                          const SizedBox(width: 8),
                          _buildChip('Insurance · 9', 2, isDark),
                          const SizedBox(width: 8),
                          _buildChip('Disability · 9', 3, isDark),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Service cards
                    _buildServiceCard(
                      index: 0,
                      title: 'Ayushman Bharat Health Card',
                      badge: 'Paid',
                      time: '7 days',
                      isDark: isDark,
                      isExpanded: expandedCards.contains(0),
                      onToggleExpand: () => _toggleExpand(0),
                      details: const [
                        (
                          'Eligibility',
                          'SECC 2011 families',
                          'Coverage',
                          '₹5,00,000 per year',
                        ),
                        (
                          'Department',
                          'Health & Family Welfare',
                          'Apply at',
                          'Empanelled hospitals',
                        ),
                        (
                          'Documents',
                          'Aadhaar, ration card',
                          'Card type',
                          'Digital, downloadable',
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    _buildServiceCard(
                      index: 1,
                      title: 'Hospital Empanelment',
                      badge: 'Paid',
                      time: '30 days',
                      isDark: isDark,
                      isExpanded: expandedCards.contains(1),
                      onToggleExpand: () => _toggleExpand(1),
                    ),
                    const SizedBox(height: 12),

                    _buildServiceCard(
                      index: 2,
                      title: 'Birth Certificate',
                      badge: 'Paid',
                      time: '20 mins',
                      isDark: isDark,
                      isExpanded: expandedCards.contains(2),
                      onToggleExpand: () => _toggleExpand(2),
                    ),
                    const SizedBox(height: 12),

                    _buildServiceCard(
                      index: 3,
                      title: 'Disability Certificate (UDID)',
                      badge: 'Paid',
                      time: '15 days',
                      isDark: isDark,
                      isExpanded: expandedCards.contains(3),
                      onToggleExpand: () => _toggleExpand(3),
                    ),
                    const SizedBox(height: 12),

                    _buildServiceCard(
                      index: 4,
                      title: 'Health Insurance Claim',
                      badge: 'Paid',
                      time: '10 days',
                      isDark: isDark,
                      isExpanded: expandedCards.contains(4),
                      onToggleExpand: () => _toggleExpand(4),
                    ),
                    const SizedBox(height: 12),

                    _buildServiceCard(
                      index: 5,
                      title: 'Vaccination Certificate',
                      badge: 'Paid',
                      time: 'Instant',
                      isDark: isDark,
                      isExpanded: expandedCards.contains(5),
                      onToggleExpand: () => _toggleExpand(5),
                    ),
                    const SizedBox(height: 12),

                    _buildServiceCard(
                      index: 6,
                      title: 'Medical Reimbursement',
                      badge: 'Paid',
                      extraFee: '₹ 50/-',
                      time: '21 days',
                      isDark: isDark,
                      isExpanded: expandedCards.contains(6),
                      onToggleExpand: () => _toggleExpand(6),
                    ),
                    const SizedBox(height: 12),

                    _buildServiceCard(
                      index: 7,
                      title: 'Janani Suraksha Yojana',
                      badge: 'Paid',
                      time: 'On delivery',
                      isDark: isDark,
                      isExpanded: expandedCards.contains(7),
                      onToggleExpand: () => _toggleExpand(7),
                    ),

                    const SizedBox(height: 16),

                    // Pagination dots
                    _buildPagination(isDark),

                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _toggleExpand(int index) {
    setState(() {
      if (expandedCards.contains(index)) {
        expandedCards.remove(index);
      } else {
        expandedCards.add(index);
      }
    });
  }

  Widget _buildChip(String label, int index, bool isDark) {
    final isSelected = selectedChip == index;
    return InkWell(
      onTap: () => setState(() => _selectedChip = index),
      borderRadius: BorderRadius.circular(6),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected
              ? (isDark ? Ux4gColors.primary800 : Ux4gColors.primary100)
              : (isDark ? Ux4gColors.neutral900 : Ux4gColors.neutral0),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: isSelected
                ? (isDark ? Ux4gColors.primary600 : Ux4gColors.primary400)
                : (isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral300),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            color: isSelected
                ? (isDark ? Ux4gColors.primary200 : Ux4gColors.primary700)
                : (isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700),
          ),
        ),
      ),
    );
  }

  Widget _buildServiceCard({
    required int index,
    required String title,
    required String badge,
    required String time,
    required bool isDark,
    required bool isExpanded,
    required VoidCallback onToggleExpand,
    String? extraFee,
    List<(String, String, String, String)>? details,
  }) {
    final typography = Ux4gTheme.typography(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark ? Ux4gColors.neutral900 : Ux4gColors.neutral0,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: typography.tS_strong.copyWith(
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
                                : Ux4gColors.neutral100,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            badge,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: isDark
                                  ? Ux4gColors.neutral200
                                  : Ux4gColors.neutral700,
                            ),
                          ),
                        ),
                        if (extraFee != null) ...[
                          const SizedBox(width: 6),
                          Text(
                            extraFee,
                            style: TextStyle(
                              fontSize: 11,
                              color: isDark
                                  ? Ux4gColors.neutral200
                                  : Ux4gColors.neutral700,
                            ),
                          ),
                        ],
                        const SizedBox(width: 8),
                        Icon(
                          Icons.access_time,
                          size: 13,
                          color: isDark
                              ? Ux4gColors.neutral400
                              : Ux4gColors.neutral500,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          time,
                          style: TextStyle(
                            fontSize: 11,
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
              ),
              const SizedBox(width: 4),
              InkWell(
                onTap: onToggleExpand,
                child: Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  size: 20,
                  color: isDark
                      ? Ux4gColors.neutral200
                      : Ux4gColors.neutral700,
                ),
              ),
            ],
          ),
          if (isExpanded && details != null) ...[
            const SizedBox(height: 12),
            Divider(
              height: 1,
              color: isDark
                  ? Ux4gColors.neutral800
                  : Ux4gColors.neutral200,
            ),
            const SizedBox(height: 12),
            ...details.map(
              (d) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildDetailItem(d.$1, d.$2, isDark)),
                    const SizedBox(width: 12),
                    Expanded(child: _buildDetailItem(d.$3, d.$4, isDark)),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDetailItem(String label, String value, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: isDark ? Ux4gColors.neutral300 : Ux4gColors.neutral600,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: isDark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
          ),
        ),
      ],
    );
  }

  Widget _buildPagination(bool isDark) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: isDark ? Ux4gColors.primary800 : Ux4gColors.primary100,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.chevron_left,
            size: 18,
            color: isDark ? Ux4gColors.primary200 : Ux4gColors.primary600,
          ),
        ),
        const SizedBox(width: 10),
        Container(
          width: 30,
          height: 10,
          decoration: BoxDecoration(
            color: isDark ? Ux4gColors.primary300 : Ux4gColors.primary600,
            borderRadius: BorderRadius.circular(99),
          ),
        ),
        const SizedBox(width: 6),
        ...List.generate(
          6,
          (i) => Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.symmetric(horizontal: 3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isDark ? Ux4gColors.primary800 : Ux4gColors.primary100,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: isDark ? Ux4gColors.primary800 : Ux4gColors.primary100,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.chevron_right,
            size: 18,
            color: isDark ? Ux4gColors.primary200 : Ux4gColors.primary600,
          ),
        ),
      ],
    );
  }
}
