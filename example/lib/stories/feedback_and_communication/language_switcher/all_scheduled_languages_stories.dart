import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import '../../../widgets/component_docs.dart';

// ── Design tokens ────────────────────────────────────────────────────────
bool _isDark(BuildContext context) => Theme.of(context).brightness == Brightness.dark;
Color _getTitleColor(BuildContext context) => _isDark(context) ? Ux4gPalette.neutral50 : const Color(0xFF111827);
Color _getSubtleText(BuildContext context) => _isDark(context) ? Ux4gPalette.neutral400 : const Color(0xFF4B5563);
Color _getMutedText(BuildContext context) => _isDark(context) ? Ux4gPalette.neutral500 : const Color(0xFF6B7280);
Color _getPrimaryColor(BuildContext context) => _isDark(context) ? Ux4gPalette.primary300 : const Color(0xFF432CBB);

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
              ? 'Full language list with search and selected state inside a '
                    'card container with light purple background.'
              : 'Full language list with search and selected state on white background.',
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

const _allScheduledLanguagesDefaultCode =
    r"""import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

class AllScheduledLanguagesScreen extends StatefulWidget {
  const AllScheduledLanguagesScreen({super.key});

  @override
  State<AllScheduledLanguagesScreen> createState() => _AllScheduledLanguagesScreenState();
}

class _AllScheduledLanguagesScreenState extends State<AllScheduledLanguagesScreen> {
  int _selectedIndex = -1;
  String _searchValue = '';
  bool _isDropdownOpen = false;

  final _languages = [
    {'name': 'English', 'sub': 'United States'},
    {'name': 'हिंदी', 'sub': 'Hindi'},
    {'name': 'मराठी', 'sub': 'Marathi'},
    {'name': 'தமிழ்', 'sub': 'Tamil'},
    {'name': 'తెలుగు', 'sub': 'Telegu'},
    {'name': 'বাংলা', 'sub': 'Bengali'},
  ];

  @override
  Widget build(BuildContext context) {
    // Filter languages
    final query = _searchValue.toLowerCase();
    final isExactSelection = _languages.any((l) => l['name']!.toLowerCase() == query);
    final filteredLanguages = (isExactSelection || query.isEmpty)
        ? _languages
        : _languages.where((l) =>
            l['name']!.toLowerCase().contains(query) ||
            l['sub']!.toLowerCase().contains(query)).toList();

    return GestureDetector(
      onTap: () {
        if (_isDropdownOpen) {
          setState(() {
            _isDropdownOpen = false;
            if (_selectedIndex >= 0) _searchValue = _languages[_selectedIndex]['name']!;
          });
        }
      },
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              // App Header
              Ux4gAppHeader(
                variant: Ux4gAppHeaderVariant.light,
                elevation: 4,
                title: '',
                leadingSpacing: 8,
                leadingWidgets: [
                  SvgPicture.asset(Ux4gIcons.nationalEmblem,  height: 40),
                  SizedBox(
                    height: 32,
                    child: Ux4gDivider(
                      orientation: Ux4gDividerOrientation.vertical,
                      color: _isDark(context) ? Ux4gPalette.neutral700 : Color(0xFFD1D5DB),
                    ),
                  ),
                  SvgPicture.asset(Ux4gIcons.union, height: 32, colorFilter: ColorFilter.mode(_isDark(context) ? Ux4gPalette.primary300 : Ux4gPalette.primary600, BlendMode.srcIn)),
                ],
              ),
              // Content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('All scheduled languages',
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
                      const SizedBox(height: 8),
                      Text('India\'s 22 scheduled languages plus English. Tap any tile to switch — "Coming soon" tiles mean translation is in progress.',
                          style: TextStyle(fontSize: 14, color: _getSubtleText(context))),
                      const SizedBox(height: 20),
                      // Search field
                      Ux4gSearchField(
                        value: _searchValue,
                        onValueChange: (v) {
                          setState(() { _searchValue = v; _isDropdownOpen = true; });
                        },
                        variant: Ux4gSearchFieldVariant.searchWithSubmit,
                        size: Ux4gSearchFieldSize.medium,
                        placeholder: 'Search for Language',
                        showVoiceIcon: true,
                        showClearIcon: false,
                        onClearClick: () {
                          setState(() { _searchValue = ''; _selectedIndex = -1; _isDropdownOpen = false; });
                        },
                        onSubmitClick: (_) {},
                      ),
                      // Dropdown list
                      if (_isDropdownOpen)
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          decoration: BoxDecoration(
                            color: _isDark(context) ? Ux4gPalette.gray900 : Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: _isDark(context) ? Ux4gPalette.neutral700 : Color(0xFFE5E7EB)),
                            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4))],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(filteredLanguages.length, (i) {
                              final lang = filteredLanguages[i];
                              final originalIndex = _languages.indexOf(lang);
                              final isSelected = _selectedIndex == originalIndex;
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    _selectedIndex = originalIndex;
                                    _searchValue = lang['name']!;
                                    _isDropdownOpen = false;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                  decoration: BoxDecoration(
                                    color: isSelected ? (_isDark(context) ? Ux4gPalette.primary800 : Color(0xFFF2EFFF)) : null,
                                    border: i < filteredLanguages.length - 1
                                        ? Border(bottom: BorderSide(color: _isDark(context) ? Ux4gPalette.neutral700 : Color(0xFFE5E7EB), width: 1))
                                        : null,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(lang['name']!, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: isSelected ? _getPrimaryColor(context) : _getTitleColor(context))),
                                            const SizedBox(height: 2),
                                            Text(lang['sub']!, style: TextStyle(fontSize: 12, color: isSelected ? _getPrimaryColor(context) : _getMutedText(context))),
                                          ],
                                        ),
                                      ),
                                      if (isSelected) Icon(Icons.check, color: _getPrimaryColor(context), size: 20),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              // Powered by Digital India
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Powered by -', style: TextStyle(fontSize: 11, color: _getMutedText(context))),
                    const SizedBox(width: 4),
                    Image.asset(Ux4gIcons.digitalIndiaLogoPng,  height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
""";

// ───────────────────────────────────────────────────────────────────────
// Source Code String — Card Style
// ───────────────────────────────────────────────────────────────────────

const _allScheduledLanguagesCardCode =
    r"""import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

/// Card Style variant — all scheduled languages inside a white card on purple background.
class AllScheduledLanguagesCardScreen extends StatefulWidget {
  const AllScheduledLanguagesCardScreen({super.key});

  @override
  State<AllScheduledLanguagesCardScreen> createState() => _AllScheduledLanguagesCardScreenState();
}

class _AllScheduledLanguagesCardScreenState extends State<AllScheduledLanguagesCardScreen> {
  int _selectedIndex = -1;
  String _searchValue = '';
  bool _isDropdownOpen = false;

  final _languages = [
    {'name': 'English', 'sub': 'United States'},
    {'name': 'हिंदी', 'sub': 'Hindi'},
    {'name': 'मराठी', 'sub': 'Marathi'},
    {'name': 'தமிழ்', 'sub': 'Tamil'},
    {'name': 'తెలుగు', 'sub': 'Telegu'},
    {'name': 'বাংলা', 'sub': 'Bengali'},
  ];

  @override
  Widget build(BuildContext context) {
    final query = _searchValue.toLowerCase();
    final isExactSelection = _languages.any((l) => l['name']!.toLowerCase() == query);
    final filteredLanguages = (isExactSelection || query.isEmpty)
        ? _languages
        : _languages.where((l) =>
            l['name']!.toLowerCase().contains(query) ||
            l['sub']!.toLowerCase().contains(query)).toList();

    return GestureDetector(
      onTap: () {
        if (_isDropdownOpen) {
          setState(() {
            _isDropdownOpen = false;
            if (_selectedIndex >= 0) _searchValue = _languages[_selectedIndex]['name']!;
          });
        }
      },
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
        backgroundColor: Color(0xFFF2EFFF),
        body: SafeArea(
          child: Column(
            children: [
              // App Header
              Ux4gAppHeader(
                variant: Ux4gAppHeaderVariant.light,
                elevation: 4,
                title: '',
                leadingSpacing: 8,
                leadingWidgets: [
                  SvgPicture.asset(Ux4gIcons.nationalEmblem,  height: 40),
                  SizedBox(
                    height: 32,
                    child: Ux4gDivider(
                      orientation: Ux4gDividerOrientation.vertical,
                      color: _isDark(context) ? Ux4gPalette.neutral700 : Color(0xFFD1D5DB),
                    ),
                  ),
                  SvgPicture.asset(Ux4gIcons.union, height: 32, colorFilter: ColorFilter.mode(_isDark(context) ? Ux4gPalette.primary300 : Ux4gPalette.primary600, BlendMode.srcIn)),
                ],
              ),
              // White card content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Ux4gCard(
                    backgroundColor: _isDark(context) ? Ux4gPalette.gray900 : Colors.white,
                    cornerRadius: 16,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('All scheduled languages',
                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
                          const SizedBox(height: 8),
                          Text('India\'s 22 scheduled languages plus English. Tap any tile to switch — "Coming soon" tiles mean translation is in progress.',
                              style: TextStyle(fontSize: 14, color: _getSubtleText(context))),
                          const SizedBox(height: 20),
                          // Search field
                          Ux4gSearchField(
                            value: _searchValue,
                            onValueChange: (v) {
                              setState(() { _searchValue = v; _isDropdownOpen = true; });
                            },
                            variant: Ux4gSearchFieldVariant.searchWithSubmit,
                            size: Ux4gSearchFieldSize.medium,
                            placeholder: 'Search for Language',
                            showVoiceIcon: true,
                            showClearIcon: false,
                            onClearClick: () {
                              setState(() { _searchValue = ''; _selectedIndex = -1; _isDropdownOpen = false; });
                            },
                            onSubmitClick: (_) {},
                          ),
                          // Dropdown list
                          if (_isDropdownOpen)
                            Container(
                              margin: const EdgeInsets.only(top: 4),
                              decoration: BoxDecoration(
                            color: _isDark(context) ? Ux4gPalette.gray900 : Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: _isDark(context) ? Ux4gPalette.neutral700 : Color(0xFFE5E7EB)),
                                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4))],
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: List.generate(filteredLanguages.length, (i) {
                                  final lang = filteredLanguages[i];
                                  final originalIndex = _languages.indexOf(lang);
                                  final isSelected = _selectedIndex == originalIndex;
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        _selectedIndex = originalIndex;
                                        _searchValue = lang['name']!;
                                        _isDropdownOpen = false;
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                      decoration: BoxDecoration(
                                        color: isSelected ? (_isDark(context) ? Ux4gPalette.primary800 : Color(0xFFF2EFFF)) : null,
                                        border: i < filteredLanguages.length - 1
                                            ? Border(bottom: BorderSide(color: _isDark(context) ? Ux4gPalette.neutral700 : Color(0xFFE5E7EB), width: 1))
                                            : null,
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(lang['name']!, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: isSelected ? _getPrimaryColor(context) : _getTitleColor(context))),
                                                const SizedBox(height: 2),
                                                Text(lang['sub']!, style: TextStyle(fontSize: 12, color: isSelected ? _getPrimaryColor(context) : _getMutedText(context))),
                                              ],
                                            ),
                                          ),
                                          if (isSelected) Icon(Icons.check, color: _getPrimaryColor(context), size: 20),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
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
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Powered by -', style: TextStyle(fontSize: 11, color: _getMutedText(context))),
                    const SizedBox(width: 4),
                    Image.asset(Ux4gIcons.digitalIndiaLogoPng,  height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
""";

// ───────────────────────────────────────────────────────────────────────
// Mockup Widget
// ───────────────────────────────────────────────────────────────────────

class _AllScheduledLanguagesMockup extends StatefulWidget {
  final bool isCard;

  const _AllScheduledLanguagesMockup({this.isCard = false});

  @override
  State<_AllScheduledLanguagesMockup> createState() =>
      _AllScheduledLanguagesMockupState();
}

class _AllScheduledLanguagesMockupState
    extends State<_AllScheduledLanguagesMockup> {
  int _selectedIndex = -1;
  String _searchValue = '';
  bool _isDropdownOpen = false;

  final _languages = const [
    {'name': 'English', 'sub': 'United States'},
    {'name': 'हिंदी', 'sub': 'Hindi'},
    {'name': 'मराठी', 'sub': 'Marathi'},
    {'name': 'தமிழ்', 'sub': 'Tamil'},
    {'name': 'తెలుగు', 'sub': 'Telegu'},
    {'name': 'বাংলা', 'sub': 'Bengali'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = _isDark(context);
    return GestureDetector(
        onTap: () {
          // Close dropdown on outside tap and restore selected value
          if (_isDropdownOpen) {
            setState(() {
              _isDropdownOpen = false;
              // Restore selected item name in field if user didn't use clear
              if (_selectedIndex >= 0) {
                _searchValue = _languages[_selectedIndex]['name']!;
              }
            });
          }
        },
        behavior: HitTestBehavior.translucent,
        child: Scaffold(
          backgroundColor: widget.isCard ? (isDark ? Ux4gPalette.primary800 : Color(0xFFF2EFFF)) : (isDark ? Ux4gPalette.neutral950 : Colors.white),
          body: SafeArea(
            child: Column(
              children: [
                // App Header
                Ux4gAppHeader(
                  variant: Ux4gAppHeaderVariant.light,
                elevation: 4,
                  title: '',
                  leadingSpacing: 8,
                  leadingWidgets: [
                    SvgPicture.asset(
                      Ux4gIcons.nationalEmblem, 
                      height: 40, colorFilter: _isDark(context) ? ColorFilter.mode(Colors.white, BlendMode.srcIn) : null),
                    SizedBox(
                      height: 32,
                      child: Ux4gDivider(
                        orientation: Ux4gDividerOrientation.vertical,
                        color: _isDark(context) ? Ux4gPalette.neutral700 : Color(0xFFD1D5DB),
                      ),
                    ),
                    SvgPicture.asset(Ux4gIcons.union, height: 32, colorFilter: ColorFilter.mode(_isDark(context) ? Ux4gPalette.primary300 : Ux4gPalette.primary600, BlendMode.srcIn)),
                  ],
                ),

                // Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: widget.isCard
                        ? Ux4gCard(
                            backgroundColor: _isDark(context) ? Ux4gPalette.gray900 : Colors.white,
                            cornerRadius: 16,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: _buildContent(context),
                            ),
                          )
                        : _buildContent(context),
                  ),
                ),

                // Powered by
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Powered by -',
                        style: TextStyle(
                          fontSize: 11,
                          color: _getMutedText(context),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Image.asset(
                        Ux4gIcons.digitalIndiaLogoPng, 
                        height: 20,
                        errorBuilder: (_, __, ___) => Text(
                          'Digital India',
                          style: TextStyle(
                            fontSize: 10,
                            color: _getPrimaryColor(context),
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

  Widget _buildContent(BuildContext context) {
    // Filter languages based on search
    final query = _searchValue.toLowerCase();
    final isExactSelection = _languages.any(
      (lang) => lang['name']!.toLowerCase() == query,
    );
    final filteredLanguages = (isExactSelection || query.isEmpty)
        ? _languages
        : _languages.where((lang) {
            return lang['name']!.toLowerCase().contains(query) ||
                lang['sub']!.toLowerCase().contains(query);
          }).toList();

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
          'India\'s 22 scheduled languages plus English. Tap any tile to switch — "Coming soon" tiles mean translation is in progress.',
          style: TextStyle(fontSize: 14, color: _getSubtleText(context)),
        ),
        const SizedBox(height: 20),

        // Search field — tap opens dropdown, shows selected value
        Ux4gSearchField(
          value: _searchValue,
          onValueChange: (v) {
            setState(() {
              _searchValue = v;
              _isDropdownOpen = true;
            });
          },
          variant: Ux4gSearchFieldVariant.searchWithSubmit,
          size: Ux4gSearchFieldSize.medium,
          placeholder: 'Search for Language',
          showVoiceIcon: true,
          showClearIcon: false,
          onClearClick: () {
            setState(() {
              _searchValue = '';
              _selectedIndex = -1;
              _isDropdownOpen = false;
            });
          },
          onSubmitClick: (_) {},
        ),

        // Dropdown list — only visible when open
        if (_isDropdownOpen)
          Container(
            margin: const EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
                            color: _isDark(context) ? Ux4gPalette.gray900 : Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: _isDark(context) ? Ux4gPalette.neutral700 : Color(0xFFE5E7EB)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(filteredLanguages.length, (i) {
                final lang = filteredLanguages[i];
                final originalIndex = _languages.indexOf(lang);
                final isSelected = _selectedIndex == originalIndex;
                return InkWell(
                  onTap: () {
                    setState(() {
                      _selectedIndex = originalIndex;
                      _searchValue = lang['name']!;
                      _isDropdownOpen = false;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected ? (_isDark(context) ? Ux4gPalette.primary800 : Color(0xFFF2EFFF)) : null,
                      border: i < filteredLanguages.length - 1
                          ? Border(
                              bottom: BorderSide(
                                color: Color(0xFFE5E7EB),
                                width: 1,
                              ),
                            )
                          : null,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                lang['name']!,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: isSelected
                                      ? _getPrimaryColor(context)
                                      : _getTitleColor(context),
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                lang['sub']!,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: isSelected
                                      ? _getPrimaryColor(context)
                                      : _getMutedText(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (isSelected)
                          Icon(
                            Icons.check,
                            color: _getPrimaryColor(context),
                            size: 20,
                          ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
      ],
    );
  }
}
