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

final allScheduledLanguagesComponent = WidgetbookComponent(
  name: 'All Scheduled Languages',
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
          name: 'All Scheduled Languages ($variant)',
          description: isCard
              ? 'Full language list with dropdown inside a '
                    'card container with light purple background.'
              : 'Full language list with dropdown interface on white background.',
          code: isCard
              ? _allScheduledLanguagesCardCode
              : _allScheduledLanguagesDefaultCode,
          center: true,
          child: _AllScheduledLanguagesMockup(isCard: isCard),
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Source Code String — Default
// ───────────────────────────────────────────────────────────────────────

const _allScheduledLanguagesDefaultCode = r"""import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

class ScheduledLanguage {
  final String name;
  final String sub;

  const ScheduledLanguage({required this.name, required this.sub});
}

class AllScheduledLanguagesScreen extends StatefulWidget {
  const AllScheduledLanguagesScreen({super.key});

  @override
  State<AllScheduledLanguagesScreen> createState() => _AllScheduledLanguagesScreenState();
}

class _AllScheduledLanguagesScreenState extends State<AllScheduledLanguagesScreen> {
  int _selectedIndex = 0;
  bool _isDropdownOpen = true;

  static const List<ScheduledLanguage> _languages = [
    ScheduledLanguage(name: 'English', sub: 'United States'),
    ScheduledLanguage(name: 'हिंदी', sub: 'Hindi'),
    ScheduledLanguage(name: 'मराठी', sub: 'Marathi'),
    ScheduledLanguage(name: 'தமிழ்', sub: 'Tamil'),
    ScheduledLanguage(name: 'తెలుగు', sub: 'Telugu'),
    ScheduledLanguage(name: 'বাংলা', sub: 'Bengali'),
    ScheduledLanguage(name: 'ગુજરાતી', sub: 'Gujarati'),
    ScheduledLanguage(name: 'ಕನ್ನಡ', sub: 'Kannada'),
    ScheduledLanguage(name: 'മലയാളം', sub: 'Malayalam'),
    ScheduledLanguage(name: 'ଓଡ଼ିଆ', sub: 'Odia'),
    ScheduledLanguage(name: 'ਪੰਜਾਬੀ', sub: 'Punjabi'),
    ScheduledLanguage(name: 'অসমীয়া', sub: 'Assamese'),
    ScheduledLanguage(name: 'संस्कृतम्', sub: 'Sanskrit'),
    ScheduledLanguage(name: 'اردو', sub: 'Urdu'),
    ScheduledLanguage(name: 'नेपाली', sub: 'Nepali'),
    ScheduledLanguage(name: 'मैथिली', sub: 'Maithili'),
    ScheduledLanguage(name: 'संथाली', sub: 'Santali'),
    ScheduledLanguage(name: 'डोगरी', sub: 'Dogri'),
    ScheduledLanguage(name: 'कोंकणी', sub: 'Konkani'),
    ScheduledLanguage(name: 'बोडो', sub: 'Bodo'),
    ScheduledLanguage(name: 'सिन्धी', sub: 'Sindhi'),
    ScheduledLanguage(name: 'कश्मीरी', sub: 'Kashmiri'),
    ScheduledLanguage(name: 'मणिपुरी', sub: 'Manipuri'),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final safeIndex = (_selectedIndex >= 0 && _selectedIndex < _languages.length) ? _selectedIndex : 0;
    final selectedLang = _languages[safeIndex];

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
                      'All scheduled languages',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: isDark ? Colors.white : const Color(0xFF111827),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "India's 22 scheduled languages plus English.\nTap any tile to switch.",
                      style: TextStyle(
                        fontSize: 14,
                        color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Interface Language',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: isDark ? Ux4gColors.neutral200 : const Color(0xFF374151),
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Dropdown Trigger Field
                    InkWell(
                      onTap: () => setState(() => _isDropdownOpen = !_isDropdownOpen),
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                        decoration: BoxDecoration(
                          color: isDark ? Ux4gColors.neutral900 : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: const Color(0xFF432CBB),
                            width: 1.8,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.language,
                              size: 20,
                              color: isDark ? Ux4gColors.neutral300 : const Color(0xFF111827),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                selectedLang.name,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: isDark ? Colors.white : const Color(0xFF111827),
                                ),
                              ),
                            ),
                            Icon(
                              _isDropdownOpen
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              size: 20,
                              color: isDark ? Ux4gColors.neutral400 : const Color(0xFF4B5563),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Dropdown List Container
                    if (_isDropdownOpen)
                      Container(
                        constraints: const BoxConstraints(maxHeight: 320),
                        decoration: BoxDecoration(
                          color: isDark ? Ux4gColors.neutral900 : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: isDark ? Ux4gColors.neutral700 : const Color(0xFFE5E7EB),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.04),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Scrollbar(
                            thumbVisibility: true,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: _languages.length,
                              itemBuilder: (context, i) {
                                final lang = _languages[i];
                                final isSelected = safeIndex == i;

                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      _selectedIndex = i;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? (isDark
                                              ? Ux4gColors.primary800.withValues(alpha: 0.4)
                                              : const Color(0xFFF3F0FF))
                                          : Colors.transparent,
                                      border: i < _languages.length - 1
                                          ? Border(
                                              bottom: BorderSide(
                                                color: isDark
                                                    ? Ux4gColors.neutral800
                                                    : const Color(0xFFF3F4F6),
                                                width: 0.8,
                                              ),
                                            )
                                          : null,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          lang.name,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: isSelected
                                                ? (isDark ? Ux4gColors.primary300 : const Color(0xFF432CBB))
                                                : (isDark ? Colors.white : const Color(0xFF111827)),
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          lang.sub,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: isSelected
                                                ? (isDark ? Ux4gColors.primary200 : const Color(0xFF6352D0))
                                                : (isDark ? Ux4gColors.neutral400 : const Color(0xFF6B7280)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
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
}
""";

// ───────────────────────────────────────────────────────────────────────
// Source Code String — Card Style
// ───────────────────────────────────────────────────────────────────────

const _allScheduledLanguagesCardCode = r"""import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

class ScheduledLanguage {
  final String name;
  final String sub;

  const ScheduledLanguage({required this.name, required this.sub});
}

/// Card Style variant — all scheduled languages inside a white card on purple background.
class AllScheduledLanguagesCardScreen extends StatefulWidget {
  const AllScheduledLanguagesCardScreen({super.key});

  @override
  State<AllScheduledLanguagesCardScreen> createState() => _AllScheduledLanguagesCardScreenState();
}

class _AllScheduledLanguagesCardScreenState extends State<AllScheduledLanguagesCardScreen> {
  int _selectedIndex = 0;
  bool _isDropdownOpen = true;

  static const List<ScheduledLanguage> _languages = [
    ScheduledLanguage(name: 'English', sub: 'United States'),
    ScheduledLanguage(name: 'हिंदी', sub: 'Hindi'),
    ScheduledLanguage(name: 'मराठी', sub: 'Marathi'),
    ScheduledLanguage(name: 'தமிழ்', sub: 'Tamil'),
    ScheduledLanguage(name: 'తెలుగు', sub: 'Telugu'),
    ScheduledLanguage(name: 'বাংলা', sub: 'Bengali'),
    ScheduledLanguage(name: 'ગુજરાતી', sub: 'Gujarati'),
    ScheduledLanguage(name: 'ಕನ್ನಡ', sub: 'Kannada'),
    ScheduledLanguage(name: 'മലയാളം', sub: 'Malayalam'),
    ScheduledLanguage(name: 'ଓଡ଼ିଆ', sub: 'Odia'),
    ScheduledLanguage(name: 'ਪੰਜਾਬੀ', sub: 'Punjabi'),
    ScheduledLanguage(name: 'অসমীয়া', sub: 'Assamese'),
    ScheduledLanguage(name: 'संस्कृतम्', sub: 'Sanskrit'),
    ScheduledLanguage(name: 'اردو', sub: 'Urdu'),
    ScheduledLanguage(name: 'नेपाली', sub: 'Nepali'),
    ScheduledLanguage(name: 'मैथिली', sub: 'Maithili'),
    ScheduledLanguage(name: 'संथाली', sub: 'Santali'),
    ScheduledLanguage(name: 'डोगरी', sub: 'Dogri'),
    ScheduledLanguage(name: 'कोंकणी', sub: 'Konkani'),
    ScheduledLanguage(name: 'बोडो', sub: 'Bodo'),
    ScheduledLanguage(name: 'सिन्धी', sub: 'Sindhi'),
    ScheduledLanguage(name: 'कश्मीरी', sub: 'Kashmiri'),
    ScheduledLanguage(name: 'मणिपुरी', sub: 'Manipuri'),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final safeIndex = (_selectedIndex >= 0 && _selectedIndex < _languages.length) ? _selectedIndex : 0;
    final selectedLang = _languages[safeIndex];

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
                          'All scheduled languages',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: isDark ? Colors.white : const Color(0xFF111827),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "India's 22 scheduled languages plus English.\nTap any tile to switch.",
                          style: TextStyle(
                            fontSize: 14,
                            color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Interface Language',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: isDark ? Ux4gColors.neutral200 : const Color(0xFF374151),
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Dropdown Trigger Field
                        InkWell(
                          onTap: () => setState(() => _isDropdownOpen = !_isDropdownOpen),
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                            decoration: BoxDecoration(
                              color: isDark ? Ux4gColors.neutral900 : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color(0xFF432CBB),
                                width: 1.8,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.language,
                                  size: 20,
                                  color: isDark ? Ux4gColors.neutral300 : const Color(0xFF111827),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    selectedLang.name,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: isDark ? Colors.white : const Color(0xFF111827),
                                    ),
                                  ),
                                ),
                                Icon(
                                  _isDropdownOpen
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  size: 20,
                                  color: isDark ? Ux4gColors.neutral400 : const Color(0xFF4B5563),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        // Dropdown List Container
                        if (_isDropdownOpen)
                          Container(
                            constraints: const BoxConstraints(maxHeight: 320),
                            decoration: BoxDecoration(
                              color: isDark ? Ux4gColors.neutral900 : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: isDark ? Ux4gColors.neutral700 : const Color(0xFFE5E7EB),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.04),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Scrollbar(
                                thumbVisibility: true,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: _languages.length,
                                  itemBuilder: (context, i) {
                                    final lang = _languages[i];
                                    final isSelected = safeIndex == i;

                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          _selectedIndex = i;
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? (isDark
                                                  ? Ux4gColors.primary800.withValues(alpha: 0.4)
                                                  : const Color(0xFFF3F0FF))
                                              : Colors.transparent,
                                          border: i < _languages.length - 1
                                              ? Border(
                                                  bottom: BorderSide(
                                                    color: isDark
                                                        ? Ux4gColors.neutral800
                                                        : const Color(0xFFF3F4F6),
                                                    width: 0.8,
                                                  ),
                                                )
                                              : null,
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              lang.name,
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: isSelected
                                                    ? (isDark ? Ux4gColors.primary300 : const Color(0xFF432CBB))
                                                    : (isDark ? Colors.white : const Color(0xFF111827)),
                                              ),
                                            ),
                                            const SizedBox(height: 2),
                                            Text(
                                              lang.sub,
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: isSelected
                                                    ? (isDark ? Ux4gColors.primary200 : const Color(0xFF6352D0))
                                                    : (isDark ? Ux4gColors.neutral400 : const Color(0xFF6B7280)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
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
}
""";

// ───────────────────────────────────────────────────────────────────────
// Mockup Widget
// ───────────────────────────────────────────────────────────────────────

class _ScheduledLanguage {
  final String name;
  final String sub;

  const _ScheduledLanguage({required this.name, required this.sub});
}

class _AllScheduledLanguagesMockup extends StatefulWidget {
  final bool isCard;

  const _AllScheduledLanguagesMockup({this.isCard = false});

  @override
  State<_AllScheduledLanguagesMockup> createState() =>
      _AllScheduledLanguagesMockupState();
}

class _AllScheduledLanguagesMockupState
    extends State<_AllScheduledLanguagesMockup> {
  int _selectedIndex = 0;
  bool _isDropdownOpen = true;

  static const List<_ScheduledLanguage> _languages = [
    _ScheduledLanguage(name: 'English', sub: 'United States'),
    _ScheduledLanguage(name: 'हिंदी', sub: 'Hindi'),
    _ScheduledLanguage(name: 'मराठी', sub: 'Marathi'),
    _ScheduledLanguage(name: 'தமிழ்', sub: 'Tamil'),
    _ScheduledLanguage(name: 'తెలుగు', sub: 'Telugu'),
    _ScheduledLanguage(name: 'বাংলা', sub: 'Bengali'),
    _ScheduledLanguage(name: 'ગુજરાતી', sub: 'Gujarati'),
    _ScheduledLanguage(name: 'ಕನ್ನಡ', sub: 'Kannada'),
    _ScheduledLanguage(name: 'മലയാളം', sub: 'Malayalam'),
    _ScheduledLanguage(name: 'ଓଡ଼ିଆ', sub: 'Odia'),
    _ScheduledLanguage(name: 'ਪੰਜਾਬੀ', sub: 'Punjabi'),
    _ScheduledLanguage(name: 'অসমীয়া', sub: 'Assamese'),
    _ScheduledLanguage(name: 'संस्कृतम्', sub: 'Sanskrit'),
    _ScheduledLanguage(name: 'اردو', sub: 'Urdu'),
    _ScheduledLanguage(name: 'नेपाली', sub: 'Nepali'),
    _ScheduledLanguage(name: 'मैथिली', sub: 'Maithili'),
    _ScheduledLanguage(name: 'संथाली', sub: 'Santali'),
    _ScheduledLanguage(name: 'डोगरी', sub: 'Dogri'),
    _ScheduledLanguage(name: 'कोंकणी', sub: 'Konkani'),
    _ScheduledLanguage(name: 'बोडो', sub: 'Bodo'),
    _ScheduledLanguage(name: 'सिन्धी', sub: 'Sindhi'),
    _ScheduledLanguage(name: 'कश्मीरी', sub: 'Kashmiri'),
    _ScheduledLanguage(name: 'मणिपुरी', sub: 'Manipuri'),
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
    final selectedLang = _languages[safeIndex];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'All scheduled languages',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: _getTitleColor(context),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "India's 22 scheduled languages plus English.\nTap any tile to switch.",
          style: TextStyle(
            fontSize: 14,
            color: _getSubtleText(context),
          ),
        ),
        const SizedBox(height: 20),

        Text(
          'Interface Language',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: isDark ? Ux4gColors.neutral200 : const Color(0xFF374151),
          ),
        ),
        const SizedBox(height: 8),

        // Dropdown Trigger Field
        InkWell(
          onTap: () => setState(() => _isDropdownOpen = !_isDropdownOpen),
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: isDark ? Ux4gColors.neutral900 : Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color(0xFF432CBB),
                width: 1.8,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.language,
                  size: 20,
                  color: isDark ? Ux4gColors.neutral300 : const Color(0xFF111827),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    selectedLang.name,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: isDark ? Colors.white : const Color(0xFF111827),
                    ),
                  ),
                ),
                Icon(
                  _isDropdownOpen
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  size: 20,
                  color: isDark ? Ux4gColors.neutral400 : const Color(0xFF4B5563),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),

        // Dropdown List Container
        if (_isDropdownOpen)
          Container(
            constraints: const BoxConstraints(maxHeight: 320),
            decoration: BoxDecoration(
              color: isDark ? Ux4gColors.neutral900 : Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isDark ? Ux4gColors.neutral700 : const Color(0xFFE5E7EB),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Scrollbar(
                thumbVisibility: true,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _languages.length,
                  itemBuilder: (context, i) {
                    final lang = _languages[i];
                    final isSelected = safeIndex == i;

                    return InkWell(
                      onTap: () {
                        setState(() {
                          _selectedIndex = i;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? (isDark
                                  ? Ux4gColors.primary800.withValues(alpha: 0.4)
                                  : const Color(0xFFF3F0FF))
                              : Colors.transparent,
                          border: i < _languages.length - 1
                              ? Border(
                                  bottom: BorderSide(
                                    color: isDark
                                        ? Ux4gColors.neutral800
                                        : const Color(0xFFF3F4F6),
                                    width: 0.8,
                                  ),
                                )
                              : null,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              lang.name,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: isSelected
                                    ? (isDark ? Ux4gColors.primary300 : const Color(0xFF432CBB))
                                    : (isDark ? Colors.white : const Color(0xFF111827)),
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              lang.sub,
                              style: TextStyle(
                                fontSize: 12,
                                color: isSelected
                                    ? (isDark ? Ux4gColors.primary200 : const Color(0xFF6352D0))
                                    : (isDark ? Ux4gColors.neutral400 : const Color(0xFF6B7280)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
      ],
    );
  }
}
