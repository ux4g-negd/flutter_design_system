import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';
import '../../../widgets/component_docs.dart';

const Color _primaryColor = Ux4gPalette.primary600;

final serviceDetailComponent = WidgetbookComponent(
  name: 'Service Detail',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        return ComponentDocs(
          mobileMockup: true,
          name: 'Service Detail',
          description:
              'Service detail page with breadcrumb, service card, tabs (Overview, Eligibility, '
              'Documents, Process), info sections with left border, and related services.',
          code: _serviceDetailCode,
          center: true,
          child: const _ServiceDetailMockup(),
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Source Code String
// ───────────────────────────────────────────────────────────────────────

const _serviceDetailCode = r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';

class ServiceDetailScreen extends StatefulWidget {
  const ServiceDetailScreen({super.key});

  @override
  State<ServiceDetailScreen> createState() => _ServiceDetailScreenState();
}

class _ServiceDetailScreenState extends State<ServiceDetailScreen> {
  int _selectedTab = 0;

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Breadcrumb
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Icon(Icons.home_outlined, size: 14, color: Color(0xFF4B5563)),
                          SizedBox(width: 4),
                          Text('Home', style: TextStyle(fontSize: 12, color: Color(0xFF4B5563))),
                          Text('  ›  ', style: TextStyle(fontSize: 12, color: Color(0xFF4B5563))),
                          Text('Certificates', style: TextStyle(fontSize: 12, color: Color(0xFF4B5563))),
                          Text('  ›  ', style: TextStyle(fontSize: 12, color: Color(0xFF4B5563))),
                          Text('Birth Certificate', style: TextStyle(fontSize: 12, color: Color(0xFF432CBB), fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    // Service card
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF2EFFF),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFF4A2BC2)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Birth Certificate', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                            const SizedBox(height: 4),
                            Text('Municipal Corporation · Registration of Births & Deaths',
                              style: TextStyle(fontSize: 12, color: Color(0xFF4B5563))),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Text('Free', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF00522C))),
                                Text('  ·  20 mins online', style: TextStyle(fontSize: 12, color: Color(0xFF4B5563))),
                                const Spacer(),
                                Text('Government\nverified',
                                  style: TextStyle(fontSize: 10, color: Color(0xFF00522C), fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center),
                              ],
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              child: Ux4gButton(
                                text: 'Apply now',
                                onPressed: () {},
                                variant: Ux4gButtonVariant.primary,
                                size: Ux4gButtonSize.medium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Tabs
                    Container(
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Color(0xFFE5E7EB))),
                      ),
                      child: Row(
                        children: [
                          _buildTab('Overview', 0),
                          _buildTab('Eligibility', 1),
                          _buildTab('Documents', 2),
                          _buildTab('Process', 3),
                        ],
                      ),
                    ),
                    // Tab content
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('About this service', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                          const SizedBox(height: 8),
                          Text(
                            'A Birth Certificate is the official record of a child\'s birth, issued by the local municipal body. It is required for school admission, passport, Aadhaar enrolment and accessing welfare schemes. Apply online with hospital records, or visit your nearest municipal office.',
                            style: TextStyle(fontSize: 13, color: Color(0xFF4B5563), height: 1.5),
                          ),
                          const SizedBox(height: 20),
                          _buildInfoSection('Eligibility', 'Child born within municipal limits. Apply within 21 days of birth; late registration allowed with an affidavit.'),
                          const SizedBox(height: 16),
                          _buildInfoSection('Required documents', 'Hospital discharge summary, both parents\' Aadhaar, and proof of address.'),
                          const SizedBox(height: 16),
                          _buildInfoSection('Fee', 'Free within 21 days of birth. ₹20 late fee applies thereafter.'),
                          const SizedBox(height: 16),
                          _buildInfoSection('Processing time', '20 minutes online · up to 7 working days if applied offline.'),
                          const SizedBox(height: 24),
                          Text('Related services', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                          const SizedBox(height: 12),
                          _buildRelatedCard('Death Certificate', 'Municipal Corporation', 'Free', '20 mins'),
                          const SizedBox(height: 12),
                          _buildRelatedCard('Marriage Certificate', 'Registrar of Marriages', '₹100', '15 days'),
                          const SizedBox(height: 12),
                          _buildRelatedCard('Aadhaar Enrolment', 'UIDAI', 'Free', '90 days'),
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

  Widget _buildTab(String text, int index) {
    final isSelected = _selectedTab == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedTab = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: isSelected ? Color(0xFF432CBB) : Colors.transparent, width: 2)),
        ),
        child: Text(text, style: TextStyle(fontSize: 13, fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400, color: isSelected ? Color(0xFF432CBB) : Color(0xFF4B5563))),
      ),
    );
  }

  Widget _buildInfoSection(String title, String description) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F3FF),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFA391FF), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF432CBB))),
          const SizedBox(height: 4),
          Text(description, style: TextStyle(fontSize: 13, color: Color(0xFF111827), height: 1.4)),
        ],
      ),
    );
  }

  Widget _buildRelatedCard(String title, String dept, String fee, String time) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final typography = Ux4gTheme.typography(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
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

class _ServiceDetailMockup extends StatefulWidget {
  const _ServiceDetailMockup();

  @override
  State<_ServiceDetailMockup> createState() => _ServiceDetailMockupState();
}

class _ServiceDetailMockupState extends State<_ServiceDetailMockup> {
  int _selectedTab = 0;

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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Breadcrumb
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        color: isDark
                            ? Ux4gPalette.neutral900
                            : Ux4gPalette.neutral0,
                        child: Row(
                          children: [
                            Icon(
                              Icons.home_outlined,
                              size: 14,
                              color: isDark
                                  ? Ux4gPalette.neutral200
                                  : Ux4gPalette.neutral700,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Home',
                              style: typography.lM_default.copyWith(
                                color: isDark
                                    ? Ux4gPalette.neutral200
                                    : Ux4gPalette.neutral700,
                              ),
                            ),
                            Text(
                              '  ›  ',
                              style: typography.lM_default.copyWith(
                                color: isDark
                                    ? Ux4gPalette.neutral400
                                    : Ux4gPalette.neutral600,
                              ),
                            ),
                            Text(
                              'Certificates',
                              style: typography.lM_default.copyWith(
                                color: isDark
                                    ? Ux4gPalette.neutral200
                                    : Ux4gPalette.neutral700,
                              ),
                            ),
                            Text(
                              '  ›  ',
                              style: typography.lM_default.copyWith(
                                color: isDark
                                    ? Ux4gPalette.neutral400
                                    : Ux4gPalette.neutral600,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                'Birth Certificate',
                                style: typography.lM_strong.copyWith(
                                  color: isDark
                                      ? Ux4gPalette.primary300
                                      : Ux4gPalette.primary600,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Service card
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: isDark
                                ? Ux4gPalette.primary950
                                : Ux4gPalette.primary50,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isDark
                                  ? Ux4gPalette.primary600
                                  : Ux4gPalette.primary500,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Birth Certificate',
                                style: typography.hXS_strong.copyWith(
                                  color: isDark
                                      ? Ux4gPalette.neutral50
                                      : Ux4gPalette.neutral900,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Municipal Corporation · Registration of Births & Deaths',
                                style: typography.lM_default.copyWith(
                                  color: isDark
                                      ? Ux4gPalette.neutral200
                                      : Ux4gPalette.neutral700,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Text(
                                    'Free',
                                    style: typography.lM_strong.copyWith(
                                      color: isDark
                                          ? Ux4gPalette.green300
                                          : Ux4gPalette.green700,
                                    ),
                                  ),
                                  Text(
                                    '  ·  20 mins online',
                                    style: typography.lM_default.copyWith(
                                      color: isDark
                                          ? Ux4gPalette.neutral200
                                          : Ux4gPalette.neutral700,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    'Government\nverified',
                                    style: typography.lS_default.copyWith(
                                      color: isDark
                                          ? Ux4gPalette.green300
                                          : Ux4gPalette.green700,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              SizedBox(
                                width: double.infinity,
                                child: Ux4gButton(
                                  text: 'Apply now',
                                  onPressed: () {},
                                  variant: Ux4gButtonVariant.primary,
                                  size: Ux4gButtonSize.medium,
                                  backgroundColor: isDark
                                      ? Ux4gPalette.primary300
                                      : Ux4gPalette.primary600,
                                  contentColor: isDark
                                      ? Ux4gPalette.primary950
                                      : Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Tabs
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: isDark
                                  ? Ux4gPalette.neutral800
                                  : Ux4gPalette.neutral200,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            _buildTab('Overview', 0),
                            _buildTab('Eligibility', 1),
                            _buildTab('Documents', 2),
                            _buildTab('Process', 3),
                          ],
                        ),
                      ),

                      // Tab content - Overview
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'About this service',
                              style: typography.hXS_default.copyWith(
                                color: isDark
                                    ? Ux4gPalette.neutral50
                                    : Ux4gPalette.neutral900,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'A Birth Certificate is the official record of a child\'s birth, issued by the local municipal body. It is required for school admission, passport, Aadhaar enrolment and accessing welfare schemes. Apply online with hospital records, or visit your nearest municipal office.',
                              style: typography.bS_default.copyWith(
                                color: isDark
                                    ? Ux4gPalette.neutral200
                                    : Ux4gPalette.neutral700,
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Info sections with left border
                            _buildInfoSection(
                              'Eligibility',
                              'Child born within municipal limits. Apply within 21 days of birth; late registration allowed with an affidavit.',
                            ),
                            const SizedBox(height: 16),
                            _buildInfoSection(
                              'Required documents',
                              'Hospital discharge summary, both parents\' Aadhaar, and proof of address.',
                            ),
                            const SizedBox(height: 16),
                            _buildInfoSection(
                              'Fee',
                              'Free within 21 days of birth. ₹20 late fee applies thereafter.',
                            ),
                            const SizedBox(height: 16),
                            _buildInfoSection(
                              'Processing time',
                              '20 minutes online · up to 7 working days if applied offline.',
                            ),

                            const SizedBox(height: 24),

                            // Related services
                            Text(
                              'Related services',
                              style: typography.hXS_default.copyWith(
                                color: isDark
                                    ? Ux4gPalette.neutral50
                                    : Ux4gPalette.neutral900,
                              ),
                            ),
                            const SizedBox(height: 12),
                            _buildRelatedCard(
                              'Death Certificate',
                              'Municipal Corporation',
                              'Free',
                              '20 mins',
                            ),
                            const SizedBox(height: 12),
                            _buildRelatedCard(
                              'Marriage Certificate',
                              'Registrar of Marriages',
                              '₹100',
                              '15 days',
                            ),
                            const SizedBox(height: 12),
                            _buildRelatedCard(
                              'Aadhaar Enrolment',
                              'UIDAI',
                              'Free',
                              '90 days',
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

  Widget _buildTab(String text, int index) {
    final isSelected = _selectedTab == index;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final typography = Ux4gTheme.typography(context);
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedTab = index),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected
                    ? (isDark ? Ux4gPalette.primary300 : Ux4gPalette.primary600)
                    : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: typography.lM_default.copyWith(
              color: isSelected
                  ? (isDark ? Ux4gPalette.primary300 : Ux4gPalette.primary600)
                  : (isDark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoSection(String title, String description) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final typography = Ux4gTheme.typography(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: isDark ? Ux4gPalette.primary950 : Ux4gPalette.primary50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isDark ? Ux4gPalette.primary600 : Ux4gPalette.primary300,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: typography.lM_strong.copyWith(
              color: isDark ? Ux4gPalette.primary300 : Ux4gPalette.primary600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: typography.bS_default.copyWith(
              color: isDark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRelatedCard(String title, String dept, String fee, String time) {
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
            style: typography.tS_strong.copyWith(
              color: isDark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            dept,
            style: typography.lM_default.copyWith(
              color: isDark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                fee,
                style: typography.lM_default.copyWith(
                  color: isDark ? Ux4gPalette.green300 : Ux4gPalette.green600,
                ),
              ),
              Text(
                '  ·  $time',
                style: typography.lM_default.copyWith(
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
