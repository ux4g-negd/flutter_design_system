import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import '../../../widgets/component_docs.dart';

// ── Design tokens ────────────────────────────────────────────────────────
bool _isDark(BuildContext context) => Theme.of(context).brightness == Brightness.dark;
Color _getTitleColor(BuildContext context) => _isDark(context) ? Ux4gColors.neutral50 : const Color(0xFF111827);
Color _getSubtleText(BuildContext context) => _isDark(context) ? Ux4gColors.neutral400 : const Color(0xFF4B5563);
Color _getMutedText(BuildContext context) => _isDark(context) ? Ux4gColors.neutral500 : const Color(0xFF6B7280);
Color _getPrimaryColor(BuildContext context) => _isDark(context) ? Ux4gColors.primary300 : const Color(0xFF432CBB);

// ── Component ────────────────────────────────────────────────────────────

final languageSwitcherComponent = WidgetbookComponent(
  name: 'Language Switcher',
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
          name: 'Language Switcher ($variant)',
          description: isCard
              ? 'Interface language selection with dropdown inside a '
                    'card container with light purple background.'
              : 'Interface language selection with dropdown on white background.',
          code: isCard
              ? _languageSwitcherCardCode
              : _languageSwitcherDefaultCode,
          center: true,
          child: _LanguageSwitcherMockup(isCard: isCard),
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Source Code String — Default
// ───────────────────────────────────────────────────────────────────────

const _languageSwitcherDefaultCode = r"""import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

class LanguageSwitcherScreen extends StatelessWidget {
  const LanguageSwitcherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    color: const Color(0xFFD1D5DB),
                  ),
                ),
                SvgPicture.asset(Ux4gIcons.union, height: 32, colorFilter: ColorFilter.mode(_isDark(context) ? Ux4gColors.primary300 : Ux4gColors.primary600, BlendMode.srcIn)),
              ],
            ),
            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Choose your interface language',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
                    const SizedBox(height: 8),
                    Text('Switch the portal to a language you read most comfortably. You can change this anytime from the header.',
                        style: TextStyle(fontSize: 14, color: Color(0xFF4B5563))),
                    const SizedBox(height: 24),
                    // Interface Language label
                    Text('Interface Language',
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    _LanguageSwitcherDropdown(
                      selectedId: 'en',
                      onSelectionChange: (_) {},
                    ),
                    const SizedBox(height: 12),
                    Text('Auto-detected from your browser preferences. Changing this updates the portal immediately — no page reload needed.',
                        style: TextStyle(fontSize: 13, color: Color(0xFF6B7280))),
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
                  Text('Powered by -', style: TextStyle(fontSize: 11, color: Color(0xFF6B7280))),
                  const SizedBox(width: 4),
                  Image.asset(Ux4gIcons.digitalIndiaLogoPng,  height: 20),
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

const _languageSwitcherCardCode = r"""import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

/// Card Style variant — language switcher inside a white card on purple background.
class LanguageSwitcherCardScreen extends StatelessWidget {
  const LanguageSwitcherCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2EFFF),
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
                    color: const Color(0xFFD1D5DB),
                  ),
                ),
                SvgPicture.asset(Ux4gIcons.union, height: 32, colorFilter: ColorFilter.mode(_isDark(context) ? Ux4gColors.primary300 : Ux4gColors.primary600, BlendMode.srcIn)),
              ],
            ),
            // White card content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Ux4gCard(
                  backgroundColor: Colors.white,
                  cornerRadius: 16,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Choose your interface language',
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
                        const SizedBox(height: 8),
                        Text('Switch the portal to a language you read most comfortably. You can change this anytime from the header.',
                            style: TextStyle(fontSize: 14, color: Color(0xFF4B5563))),
                        const SizedBox(height: 24),
                        // Interface Language label
                        Text('Interface Language',
                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 8),
                        _LanguageSwitcherDropdown(
                          selectedId: 'en',
                          onSelectionChange: (_) {},
                        ),
                        const SizedBox(height: 12),
                        Text('Auto-detected from your browser preferences. Changing this updates the portal immediately — no page reload needed.',
                            style: TextStyle(fontSize: 13, color: Color(0xFF6B7280))),
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
                  Text('Powered by -', style: TextStyle(fontSize: 11, color: Color(0xFF6B7280))),
                  const SizedBox(width: 4),
                  Image.asset(Ux4gIcons.digitalIndiaLogoPng,  height: 20),
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

class _LanguageSwitcherMockup extends StatefulWidget {
  final bool isCard;

  const _LanguageSwitcherMockup({this.isCard = false});

  @override
  State<_LanguageSwitcherMockup> createState() =>
      _LanguageSwitcherMockupState();
}

class _LanguageSwitcherMockupState extends State<_LanguageSwitcherMockup> {
  String _selectedId = 'en';

  @override
  Widget build(BuildContext context) {
    final isDark = _isDark(context);
    return Scaffold(
        backgroundColor: widget.isCard
            ? (isDark ? Ux4gColors.primary800 : Color(0xFFF2EFFF))
            : (isDark ? Ux4gColors.neutral950 : Colors.white),
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
                      color: _isDark(context) ? Ux4gColors.neutral700 : Color(0xFFD1D5DB),
                    ),
                  ),
                  SvgPicture.asset(Ux4gIcons.union, height: 32, colorFilter: ColorFilter.mode(_isDark(context) ? Ux4gColors.primary300 : Ux4gColors.primary600, BlendMode.srcIn)),
                ],
              ),

              // Content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: widget.isCard
                      ? Ux4gCard(
                          backgroundColor: _isDark(context) ? Ux4gColors.gray900 : Colors.white,
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
                      style: TextStyle(fontSize: 11, color: _getMutedText(context)),
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
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choose your interface language',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: _getTitleColor(context),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Switch the portal to a language you read most comfortably. You can change this anytime from the header.',
          style: TextStyle(fontSize: 14, color: _getSubtleText(context)),
        ),
        const SizedBox(height: 24),

        // Interface Language label
        Text(
          'Interface Language',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: _getTitleColor(context),
          ),
        ),
        const SizedBox(height: 8),

        // Dropdown field
        _LanguageSwitcherDropdown(
          selectedId: _selectedId,
          onSelectionChange: (id) => setState(() => _selectedId = id),
        ),
        const SizedBox(height: 12),

        Text(
          'Auto-detected from your browser preferences. Changing this updates the portal immediately — no page reload needed.',
          style: TextStyle(fontSize: 13, color: _getMutedText(context)),
        ),
      ],
    );
  }
}

class _LanguageSwitcherDropdown extends StatefulWidget {
  final String selectedId;
  final ValueChanged<String> onSelectionChange;

  const _LanguageSwitcherDropdown({
    required this.selectedId,
    required this.onSelectionChange,
  });

  @override
  State<_LanguageSwitcherDropdown> createState() => _LanguageSwitcherDropdownState();
}

class _LanguageSwitcherDropdownState extends State<_LanguageSwitcherDropdown> {
  final LayerLink _layerLink = LayerLink();
  final GlobalKey _triggerKey = GlobalKey();
  OverlayEntry? _overlayEntry;
  bool _isOpen = false;

  static const _languages = [
    {'id': 'en', 'native': 'English', 'english': 'United States'},
    {'id': 'hi', 'native': 'हिंदी', 'english': 'Hindi'},
    {'id': 'mr', 'native': 'मराठी', 'english': 'Marathi'},
    {'id': 'ta', 'native': 'தமிழ்', 'english': 'Tamil'},
    {'id': 'te', 'native': 'తెలుగు', 'english': 'Telegu'},
    {'id': 'bn', 'native': 'বাংলা', 'english': 'Bengali'},
  ];

  void _toggle() {
    if (_isOpen) {
      _close();
    } else {
      _open();
    }
  }

  void _open() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    setState(() => _isOpen = true);
  }

  void _close() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() => _isOpen = false);
  }

  @override
  void dispose() {
    _close();
    super.dispose();
  }

  OverlayEntry _createOverlayEntry() {
    final appTheme = Theme.of(context);
    return OverlayEntry(
      builder: (overlayContext) {
        final renderBox = _triggerKey.currentContext?.findRenderObject() as RenderBox?;
        final size = renderBox?.hasSize == true ? renderBox!.size : Size.zero;

        return Theme(
          data: appTheme,
          child: Builder(
            builder: (context) {
              return TapRegion(
                groupId: _triggerKey,
                onTapOutside: (_) => _close(),
                child: Stack(
                  children: [
                    CompositedTransformFollower(
                link: _layerLink,
                showWhenUnlinked: false,
                offset: Offset(0, size.height + 4),
                child: Material(
                  elevation: 8,
                  borderRadius: BorderRadius.circular(8),
                  color: _isDark(context) ? Ux4gColors.neutral900 : Colors.white,
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: _isDark(context) ? Ux4gColors.neutral700 : const Color(0xFFE5E7EB),
                      ),
                    ),
                    constraints: const BoxConstraints(maxHeight: 380),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ..._languages.map((lang) {
                            final isSelected = widget.selectedId == lang['id'];
                            return InkWell(
                              onTap: () {
                                widget.onSelectionChange(lang['id']!);
                                _close();
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                color: isSelected
                                    ? (_isDark(context) ? Ux4gColors.primary950 : const Color(0xFFF3E8FF))
                                    : null,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            lang['native']!,
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                                              color: isSelected
                                                  ? (_isDark(context) ? Ux4gColors.primary300 : const Color(0xFF432CBB))
                                                  : _getTitleColor(context),
                                            ),
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            lang['english']!,
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              color: isSelected
                                                  ? (_isDark(context) ? Ux4gColors.primary300 : const Color(0xFF432CBB))
                                                  : _getMutedText(context),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (isSelected)
                                      Icon(
                                        Icons.check,
                                        size: 20,
                                        color: _isDark(context) ? Ux4gColors.primary300 : const Color(0xFF432CBB),
                                      ),
                                  ],
                                ),
                              ),
                            );
                          }),
                          Divider(
                            height: 1,
                            color: _isDark(context) ? Ux4gColors.neutral700 : const Color(0xFFE5E7EB),
                          ),
                          InkWell(
                            onTap: _close,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              child: Center(
                                child: Text(
                                  'See all 22 scheduled languages',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: _getPrimaryColor(context),
                                  ),
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
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedLang = _languages.firstWhere(
      (l) => l['id'] == widget.selectedId,
      orElse: () => _languages.first,
    );

    return TapRegion(
      groupId: _triggerKey,
      child: CompositedTransformTarget(
        link: _layerLink,
      child: GestureDetector(
        key: _triggerKey,
        onTap: _toggle,
        child: Container(
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: _isDark(context) ? Ux4gColors.neutral950 : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _isOpen
                  ? _getPrimaryColor(context)
                  : (_isDark(context) ? Ux4gColors.neutral700 : const Color(0xFFD1D5DB)),
              width: _isOpen ? 1.5 : 1,
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.language,
                size: 20,
                color: _getSubtleText(context),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  '${selectedLang['native']} (${selectedLang['english']})',
                  style: TextStyle(
                    fontSize: 14,
                    color: _getTitleColor(context),
                  ),
                ),
              ),
              Icon(
                _isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                color: _getSubtleText(context),
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }
}
