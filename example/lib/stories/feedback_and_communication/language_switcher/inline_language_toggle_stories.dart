import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import '../../../widgets/component_docs.dart';

// ── Design tokens ────────────────────────────────────────────────────────

// ignore: unused_element
bool _isDark(BuildContext context) => Theme.of(context).brightness == Brightness.dark;

// ignore: unused_element
Color _getTitleColor(BuildContext context) => _isDark(context) ? Colors.white : const Color(0xFF111827);

// ignore: unused_element
Color _getSubtleText(BuildContext context) => _isDark(context) ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563);

// ignore: unused_element
Color _getBorderColor(BuildContext context) => _isDark(context) ? Ux4gColors.neutral700 : const Color(0xFFE5E7EB);

// ignore: unused_element
Color _getScaffoldBg(BuildContext context) => _isDark(context) ? Ux4gColors.neutral950 : Colors.white;

// ignore: unused_element
Color _getCardBg(BuildContext context) => _isDark(context) ? Ux4gColors.neutral800 : Colors.white;

// ignore: unused_element
Color _getMutedText(BuildContext context) => _isDark(context) ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280);

// ── Component ────────────────────────────────────────────────────────────

final inlineLanguageToggleComponent = WidgetbookComponent(
  name: 'Inline Language Toggle',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        final variant = context.knobs.list(
          label: 'Variant',
          options: const ['Default', 'Card Style'],
          initialOption: 'Default',
          description:
              'Switch between the standard layout and the card-style layout '
              'with a light purple background.',
        );

        final isCard = variant == 'Card Style';

        return ComponentDocs(
          mobileMockup: true,
          name: 'Inline Language Toggle ($variant)',
          description: isCard
              ? 'Inline language toggle with chip group inside a '
                    'card container with light purple background.'
              : 'Inline language toggle with chip group and editable form fields on white background.',
          code: isCard
              ? _inlineLanguageToggleCardCode
              : _inlineLanguageToggleDefaultCode,
          center: true,
          child: _InlineLanguageToggleMockup(isCard: isCard),
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Source Code String — Default
// ───────────────────────────────────────────────────────────────────────

const _inlineLanguageToggleDefaultCode = r"""import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

class LanguageData {
  final String name;
  final String applicantLabel;
  final String fatherLabel;
  final String incomeLabel;

  const LanguageData({
    required this.name,
    required this.applicantLabel,
    required this.fatherLabel,
    required this.incomeLabel,
  });
}

class InlineLanguageToggleScreen extends StatefulWidget {
  const InlineLanguageToggleScreen({super.key});

  @override
  State<InlineLanguageToggleScreen> createState() => _InlineLanguageToggleScreenState();
}

class _InlineLanguageToggleScreenState extends State<InlineLanguageToggleScreen> {
  int _selectedIndex = 0;

  static const List<LanguageData> _languages = [
    LanguageData(
      name: 'English',
      applicantLabel: 'Applicant name',
      fatherLabel: "Father's / husband's name",
      incomeLabel: 'Annual family income (₹)',
    ),
    LanguageData(
      name: 'हिन्दी',
      applicantLabel: 'आवेदक का नाम',
      fatherLabel: 'पिता / पति का नाम',
      incomeLabel: 'वार्षिक पारिवारिक आय (₹)',
    ),
    LanguageData(
      name: 'தமிழ்',
      applicantLabel: 'விண்ணப்பதாரர் பெயர்',
      fatherLabel: 'தந்தை / கணவர் பெயர்',
      incomeLabel: 'ஆண்டு குடும்ப வருமானம் (₹)',
    ),
    LanguageData(
      name: 'తెలుగు',
      applicantLabel: 'దరఖాస్తుదారు పేరు',
      fatherLabel: 'తండ్రి / భర్త పేరు',
      incomeLabel: 'వార్షిక కుటుంబ ఆదాయం (₹)',
    ),
    LanguageData(
      name: 'मराठी',
      applicantLabel: 'अर्जदाराचे नाव',
      fatherLabel: 'वडिलांचे / पतीचे नाव',
      incomeLabel: 'वार्षिक कौटुंबिक उत्पन्न (₹)',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final safeIndex = (_selectedIndex >= 0 && _selectedIndex < _languages.length) ? _selectedIndex : 0;
    final current = _languages[safeIndex];

    return Scaffold(
      backgroundColor: isDark ? Ux4gColors.neutral900 : Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // App Header
            Ux4gAppHeader(
              elevation: 2,
              verticalPadding: 16,
              leadingSpacing: 8,
              variant: Ux4gAppHeaderVariant.light,
              title: '',
              leadingWidgets: [
                SvgPicture.asset(
                  Ux4gIcons.nationalEmblem,
                  height: 40,
                  colorFilter: isDark
                      ? const ColorFilter.mode(Ux4gColors.neutral50, BlendMode.srcIn)
                      : null,
                ),
                const SizedBox(width: 8),
                SizedBox(
                  height: 32,
                  child: Ux4gDivider(
                    orientation: Ux4gDividerOrientation.vertical,
                    color: const Color(0xFFD1D5DB),
                  ),
                ),
                const SizedBox(width: 8),
                SvgPicture.asset(
                  Ux4gIcons.union,
                  height: 32,
                  colorFilter: ColorFilter.mode(
                    isDark ? Ux4gColors.primary300 : Ux4gColors.primary600,
                    BlendMode.srcIn,
                  ),
                ),
              ],
              actions: [
                Ux4gAppHeaderAction(
                  customWidget: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        color: isDark ? Ux4gColors.neutral900 : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: isDark
                              ? Ux4gColors.primary600
                              : const Color(0xFFC7D2FE),
                          width: 1.5,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 16,
                              height: 2.2,
                              decoration: BoxDecoration(
                                color: isDark
                                    ? Ux4gColors.primary300
                                    : const Color(0xFF432CBB),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            const SizedBox(height: 3),
                            Container(
                              width: 16,
                              height: 2.2,
                              decoration: BoxDecoration(
                                color: isDark
                                    ? Ux4gColors.primary300
                                    : const Color(0xFF432CBB),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            const SizedBox(height: 3),
                            Container(
                              width: 16,
                              height: 2.2,
                              decoration: BoxDecoration(
                                color: isDark
                                    ? Ux4gColors.primary300
                                    : const Color(0xFF432CBB),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Apply for Income Certificate',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: isDark ? Colors.white : const Color(0xFF111827),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Use the language switcher to change the form language. Your entered details will stay saved.',
                      style: TextStyle(
                        fontSize: 14,
                        color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Language ChipGroup (Horizontally scrollable with touch & mouse drag support)
                    Ux4gChipGroup(
                      arrangement: Ux4gChipGroupArrangement.horizontal,
                      spacing: 8,
                      chips: [
                        for (int i = 0; i < _languages.length; i++)
                          Ux4gChoiceChip(
                            text: _languages[i].name,
                            selected: safeIndex == i,
                            onClick: () => setState(() => _selectedIndex = i),
                            borderRadius: 8,
                            selectedBackgroundColor: isDark ? Ux4gColors.primary300 : const Color(0xFF432CBB),
                            unselectedBackgroundColor: isDark ? Ux4gColors.neutral800 : Colors.white,
                            selectedTextColor: isDark ? Colors.black : Colors.white,
                            unselectedTextColor: isDark ? Ux4gColors.neutral200 : const Color(0xFF374151),
                            selectedBorderColor: Colors.transparent,
                            unselectedBorderColor: isDark ? Ux4gColors.neutral700 : const Color(0xFFE5E7EB),
                          ),
                        Ux4gChoiceChip(
                          text: '+3 more',
                          selected: false,
                          onClick: () {},
                          borderRadius: 8,
                          unselectedBackgroundColor: isDark ? Ux4gColors.neutral800 : Colors.white,
                          unselectedTextColor: isDark ? Ux4gColors.neutral400 : const Color(0xFF6B7280),
                          unselectedBorderColor: isDark ? Ux4gColors.neutral700 : const Color(0xFFE5E7EB),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Form fields
                    _buildFormField(
                      context,
                      label: current.applicantLabel,
                      value: 'Ramesh Kumar',
                      isDark: isDark,
                    ),
                    const SizedBox(height: 16),
                    _buildFormField(
                      context,
                      label: current.fatherLabel,
                      value: 'Suresh Kumar',
                      isDark: isDark,
                    ),
                    const SizedBox(height: 16),
                    _buildFormField(
                      context,
                      label: current.incomeLabel,
                      value: '2,40,000',
                      isDark: isDark,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            // Powered by Digital India
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Powered by -', style: TextStyle(fontSize: 11, color: Color(0xFF6B7280))),
                  const SizedBox(width: 4),
                  Image.asset(Ux4gIcons.digitalIndiaLogoPng, height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormField(
    BuildContext context, {
    required String label,
    required String value,
    required bool isDark,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: isDark ? Ux4gColors.neutral200 : const Color(0xFF374151),
          ),
        ),
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: isDark ? Ux4gColors.neutral900 : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isDark ? Ux4gColors.neutral700 : const Color(0xFFE5E7EB),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isDark ? Colors.white : const Color(0xFF111827),
                  ),
                ),
              ),
              Icon(
                Icons.edit_outlined,
                size: 18,
                color: isDark ? Ux4gColors.neutral400 : const Color(0xFF6B7280),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
""";

// ───────────────────────────────────────────────────────────────────────
// Source Code String — Card Style
// ───────────────────────────────────────────────────────────────────────

const _inlineLanguageToggleCardCode = r"""import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

class LanguageData {
  final String name;
  final String applicantLabel;
  final String fatherLabel;
  final String incomeLabel;

  const LanguageData({
    required this.name,
    required this.applicantLabel,
    required this.fatherLabel,
    required this.incomeLabel,
  });
}

/// Card Style variant — inline language toggle inside a white card on purple background.
class InlineLanguageToggleCardScreen extends StatefulWidget {
  const InlineLanguageToggleCardScreen({super.key});

  @override
  State<InlineLanguageToggleCardScreen> createState() => _InlineLanguageToggleCardScreenState();
}

class _InlineLanguageToggleCardScreenState extends State<InlineLanguageToggleCardScreen> {
  int _selectedIndex = 0;

  static const List<LanguageData> _languages = [
    LanguageData(
      name: 'English',
      applicantLabel: 'Applicant name',
      fatherLabel: "Father's / husband's name",
      incomeLabel: 'Annual family income (₹)',
    ),
    LanguageData(
      name: 'हिन्दी',
      applicantLabel: 'आवेदक का नाम',
      fatherLabel: 'पिता / पति का नाम',
      incomeLabel: 'वार्षिक पारिवारिक आय (₹)',
    ),
    LanguageData(
      name: 'தமிழ்',
      applicantLabel: 'விண்ணப்பதாரர் பெயர்',
      fatherLabel: 'தந்தை / கணவர் பெயர்',
      incomeLabel: 'ஆண்டு குடும்ப வருமானம் (₹)',
    ),
    LanguageData(
      name: 'తెలుగు',
      applicantLabel: 'దరఖాస్తుదారు పేరు',
      fatherLabel: 'తండ్రి / భర్త పేరు',
      incomeLabel: 'వార్షిక కుటుంబ ఆదాయం (₹)',
    ),
    LanguageData(
      name: 'मराठी',
      applicantLabel: 'अर्जदाराचे नाव',
      fatherLabel: 'वडिलांचे / पतीचे नाव',
      incomeLabel: 'वार्षिक कौटुंबिक उत्पन्न (₹)',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final safeIndex = (_selectedIndex >= 0 && _selectedIndex < _languages.length) ? _selectedIndex : 0;
    final current = _languages[safeIndex];

    return Scaffold(
      backgroundColor: isDark ? Ux4gColors.primary800 : const Color(0xFFE2DCFF),
      body: SafeArea(
        child: Column(
          children: [
            // App Header
            Ux4gAppHeader(
              elevation: 2,
              verticalPadding: 16,
              leadingSpacing: 8,
              variant: Ux4gAppHeaderVariant.light,
              title: '',
              leadingWidgets: [
                SvgPicture.asset(
                  Ux4gIcons.nationalEmblem,
                  height: 40,
                  colorFilter: isDark
                      ? const ColorFilter.mode(Ux4gColors.neutral50, BlendMode.srcIn)
                      : null,
                ),
                const SizedBox(width: 8),
                SizedBox(
                  height: 32,
                  child: Ux4gDivider(
                    orientation: Ux4gDividerOrientation.vertical,
                    color: const Color(0xFFD1D5DB),
                  ),
                ),
                const SizedBox(width: 8),
                SvgPicture.asset(
                  Ux4gIcons.union,
                  height: 32,
                  colorFilter: ColorFilter.mode(
                    isDark ? Ux4gColors.primary300 : Ux4gColors.primary600,
                    BlendMode.srcIn,
                  ),
                ),
              ],
              actions: [
                Ux4gAppHeaderAction(
                  customWidget: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        color: isDark ? Ux4gColors.neutral900 : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: isDark
                              ? Ux4gColors.primary600
                              : const Color(0xFFC7D2FE),
                          width: 1.5,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 16,
                              height: 2.2,
                              decoration: BoxDecoration(
                                color: isDark
                                    ? Ux4gColors.primary300
                                    : const Color(0xFF432CBB),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            const SizedBox(height: 3),
                            Container(
                              width: 16,
                              height: 2.2,
                              decoration: BoxDecoration(
                                color: isDark
                                    ? Ux4gColors.primary300
                                    : const Color(0xFF432CBB),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            const SizedBox(height: 3),
                            Container(
                              width: 16,
                              height: 2.2,
                              decoration: BoxDecoration(
                                color: isDark
                                    ? Ux4gColors.primary300
                                    : const Color(0xFF432CBB),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // White card content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Ux4gCard(
                  backgroundColor: isDark ? Ux4gColors.neutral800 : Colors.white,
                  cornerRadius: 16,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Apply for Income Certificate',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: isDark ? Colors.white : const Color(0xFF111827),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Use the language switcher to change the form language. Your entered details will stay saved.',
                          style: TextStyle(
                            fontSize: 14,
                            color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Language ChipGroup (Horizontally scrollable with touch & mouse drag support)
                        Ux4gChipGroup(
                          arrangement: Ux4gChipGroupArrangement.horizontal,
                          spacing: 8,
                          chips: [
                            for (int i = 0; i < _languages.length; i++)
                              Ux4gChoiceChip(
                                text: _languages[i].name,
                                selected: safeIndex == i,
                                onClick: () => setState(() => _selectedIndex = i),
                                borderRadius: 8,
                                selectedBackgroundColor: isDark ? Ux4gColors.primary300 : const Color(0xFF432CBB),
                                unselectedBackgroundColor: isDark ? Ux4gColors.neutral900 : Colors.white,
                                selectedTextColor: isDark ? Colors.black : Colors.white,
                                unselectedTextColor: isDark ? Ux4gColors.neutral200 : const Color(0xFF374151),
                                selectedBorderColor: Colors.transparent,
                                unselectedBorderColor: isDark ? Ux4gColors.neutral700 : const Color(0xFFE5E7EB),
                              ),
                            Ux4gChoiceChip(
                              text: '+3 more',
                              selected: false,
                              onClick: () {},
                              borderRadius: 8,
                              unselectedBackgroundColor: isDark ? Ux4gColors.neutral900 : Colors.white,
                              unselectedTextColor: isDark ? Ux4gColors.neutral400 : const Color(0xFF6B7280),
                              unselectedBorderColor: isDark ? Ux4gColors.neutral700 : const Color(0xFFE5E7EB),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        // Form fields
                        _buildFormField(
                          context,
                          label: current.applicantLabel,
                          value: 'Ramesh Kumar',
                          isDark: isDark,
                        ),
                        const SizedBox(height: 16),
                        _buildFormField(
                          context,
                          label: current.fatherLabel,
                          value: 'Suresh Kumar',
                          isDark: isDark,
                        ),
                        const SizedBox(height: 16),
                        _buildFormField(
                          context,
                          label: current.incomeLabel,
                          value: '2,40,000',
                          isDark: isDark,
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Powered by Digital India
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Powered by -', style: TextStyle(fontSize: 11, color: Color(0xFF6B7280))),
                  const SizedBox(width: 4),
                  Image.asset(Ux4gIcons.digitalIndiaLogoPng, height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormField(
    BuildContext context, {
    required String label,
    required String value,
    required bool isDark,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: isDark ? Ux4gColors.neutral200 : const Color(0xFF374151),
          ),
        ),
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: isDark ? Ux4gColors.neutral900 : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isDark ? Ux4gColors.neutral700 : const Color(0xFFE5E7EB),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isDark ? Colors.white : const Color(0xFF111827),
                  ),
                ),
              ),
              Icon(
                Icons.edit_outlined,
                size: 18,
                color: isDark ? Ux4gColors.neutral400 : const Color(0xFF6B7280),
              ),
            ],
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

class _LanguageData {
  final String name;
  final String applicantLabel;
  final String fatherLabel;
  final String incomeLabel;

  const _LanguageData({
    required this.name,
    required this.applicantLabel,
    required this.fatherLabel,
    required this.incomeLabel,
  });
}

class _InlineLanguageToggleMockup extends StatefulWidget {
  final bool isCard;

  const _InlineLanguageToggleMockup({this.isCard = false});

  @override
  State<_InlineLanguageToggleMockup> createState() =>
      _InlineLanguageToggleMockupState();
}

class _InlineLanguageToggleMockupState
    extends State<_InlineLanguageToggleMockup> {
  int _selectedIndex = 0;

  static const List<_LanguageData> _languages = [
    _LanguageData(
      name: 'English',
      applicantLabel: 'Applicant name',
      fatherLabel: "Father's / husband's name",
      incomeLabel: 'Annual family income (₹)',
    ),
    _LanguageData(
      name: 'हिन्दी',
      applicantLabel: 'आवेदक का नाम',
      fatherLabel: 'पिता / पति का नाम',
      incomeLabel: 'वार्षिक पारिवारिक आय (₹)',
    ),
    _LanguageData(
      name: 'தமிழ்',
      applicantLabel: 'விண்ணப்பதாரர் பெயர்',
      fatherLabel: 'தந்தை / கணவர் பெயர்',
      incomeLabel: 'ஆண்டு குடும்ப வருமானம் (₹)',
    ),
    _LanguageData(
      name: 'తెలుగు',
      applicantLabel: 'దరఖాస్తుదారు పేరు',
      fatherLabel: 'తండ్రి / భర్త పేరు',
      incomeLabel: 'వార్షిక కుటుంబ ఆదాయం (₹)',
    ),
    _LanguageData(
      name: 'मराठी',
      applicantLabel: 'अर्जदाराचे नाव',
      fatherLabel: 'वडिलांचे / पतीचे नाव',
      incomeLabel: 'वार्षिक कौटुंबिक उत्पन्न (₹)',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = _isDark(context);

    return Theme(
      data: Ux4gTheme.themeData(isDark: isDark),
      child: Scaffold(
        backgroundColor: widget.isCard
            ? (isDark ? Ux4gColors.primary800 : const Color(0xFFE2DCFF))
            : _getScaffoldBg(context),
        body: SafeArea(
          child: Column(
            children: [
              // App Header
              Ux4gAppHeader(
                elevation: 2,
                verticalPadding: 16,
                variant: Ux4gAppHeaderVariant.light,
                title: '',
                leadingSpacing: 8,
                leadingWidgets: [
                  SvgPicture.asset(
                    Ux4gIcons.nationalEmblem,
                    height: 40,
                    colorFilter: isDark ? const ColorFilter.mode(Colors.white, BlendMode.srcIn) : null,
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    height: 32,
                    child: Ux4gDivider(
                      orientation: Ux4gDividerOrientation.vertical,
                      color: const Color(0xFFD1D5DB),
                    ),
                  ),
                  const SizedBox(width: 8),
                  SvgPicture.asset(
                    Ux4gIcons.union,
                    height: 32,
                    colorFilter: ColorFilter.mode(
                      isDark ? Ux4gColors.primary300 : Ux4gColors.primary600,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
                actions: [
                  Ux4gAppHeaderAction(
                    customWidget: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          color: isDark ? Ux4gColors.neutral900 : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: isDark
                                ? Ux4gColors.primary600
                                : const Color(0xFFC7D2FE),
                            width: 1.5,
                          ),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 16,
                                height: 2.2,
                                decoration: BoxDecoration(
                                  color: isDark
                                      ? Ux4gColors.primary300
                                      : const Color(0xFF432CBB),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                              const SizedBox(height: 3),
                              Container(
                                width: 16,
                                height: 2.2,
                                decoration: BoxDecoration(
                                  color: isDark
                                      ? Ux4gColors.primary300
                                      : const Color(0xFF432CBB),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                              const SizedBox(height: 3),
                              Container(
                                width: 16,
                                height: 2.2,
                                decoration: BoxDecoration(
                                  color: isDark
                                      ? Ux4gColors.primary300
                                      : const Color(0xFF432CBB),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: widget.isCard
                      ? Ux4gCard(
                          backgroundColor: _getCardBg(context),
                          cornerRadius: 16,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: _buildContent(context, isDark),
                          ),
                        )
                      : _buildContent(context, isDark),
                ),
              ),

              // Powered by
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Powered by -',
                      style: TextStyle(fontSize: 11, color: Color(0xFF6B7280)),
                    ),
                    const SizedBox(width: 4),
                    Image.asset(
                      Ux4gIcons.digitalIndiaLogoPng,
                      height: 20,
                      errorBuilder: (context, error, stackTrace) => Text(
                        'Digital India',
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xFF432CBB),
                        ),
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

  Widget _buildContent(BuildContext context, bool isDark) {
    final safeIndex = (_selectedIndex >= 0 && _selectedIndex < _languages.length) ? _selectedIndex : 0;
    final current = _languages[safeIndex];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Apply for Income Certificate',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: _getTitleColor(context),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Use the language switcher to change the form language. Your entered details will stay saved.',
          style: TextStyle(
            fontSize: 14,
            color: _getSubtleText(context),
          ),
        ),
        const SizedBox(height: 20),

        // Language ChipGroup (Horizontally scrollable with touch & mouse drag support)
        Ux4gChipGroup(
          arrangement: Ux4gChipGroupArrangement.horizontal,
          spacing: 8,
          chips: [
            for (int i = 0; i < _languages.length; i++)
              Ux4gChoiceChip(
                text: _languages[i].name,
                selected: safeIndex == i,
                onClick: () => setState(() => _selectedIndex = i),
                borderRadius: 8,
                selectedBackgroundColor: isDark ? Ux4gColors.primary300 : const Color(0xFF432CBB),
                unselectedBackgroundColor: isDark ? (widget.isCard ? Ux4gColors.neutral900 : Ux4gColors.neutral800) : Colors.white,
                selectedTextColor: isDark ? Colors.black : Colors.white,
                unselectedTextColor: isDark ? Ux4gColors.neutral200 : const Color(0xFF374151),
                selectedBorderColor: Colors.transparent,
                unselectedBorderColor: isDark ? Ux4gColors.neutral700 : const Color(0xFFE5E7EB),
              ),
            Ux4gChoiceChip(
              text: '+3 more',
              selected: false,
              onClick: () {},
              borderRadius: 8,
              unselectedBackgroundColor: isDark ? (widget.isCard ? Ux4gColors.neutral900 : Ux4gColors.neutral800) : Colors.white,
              unselectedTextColor: isDark ? Ux4gColors.neutral400 : const Color(0xFF6B7280),
              unselectedBorderColor: isDark ? Ux4gColors.neutral700 : const Color(0xFFE5E7EB),
            ),
          ],
        ),
        const SizedBox(height: 24),

        // Form fields
        _buildFormField(
          context,
          label: current.applicantLabel,
          value: 'Ramesh Kumar',
          isDark: isDark,
        ),
        const SizedBox(height: 16),
        _buildFormField(
          context,
          label: current.fatherLabel,
          value: 'Suresh Kumar',
          isDark: isDark,
        ),
        const SizedBox(height: 16),
        _buildFormField(
          context,
          label: current.incomeLabel,
          value: '2,40,000',
          isDark: isDark,
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildFormField(
    BuildContext context, {
    required String label,
    required String value,
    required bool isDark,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: isDark ? Ux4gColors.neutral200 : const Color(0xFF374151),
          ),
        ),
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: isDark ? Ux4gColors.neutral900 : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isDark ? Ux4gColors.neutral700 : const Color(0xFFE5E7EB),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isDark ? Colors.white : const Color(0xFF111827),
                  ),
                ),
              ),
              Icon(
                Icons.edit_outlined,
                size: 18,
                color: isDark ? Ux4gColors.neutral400 : const Color(0xFF6B7280),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
