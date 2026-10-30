import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:widgetbook/widgetbook.dart';
import '../data/flutter_changelog_data.dart';
import '../theme_notifier.dart';

class Ux4gChangelogPage extends StatefulWidget {
  const Ux4gChangelogPage({super.key});

  @override
  State<Ux4gChangelogPage> createState() => _Ux4gChangelogPageState();
}

class _Ux4gChangelogPageState extends State<Ux4gChangelogPage> {
  String _selectedVersion = 'all';
  String _selectedCategory = 'all';
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  String? _copiedKey;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _handleCopy(String text, String key) {
    Clipboard.setData(ClipboardData(text: text));
    if (mounted) {
      setState(() => _copiedKey = key);
      Future.delayed(const Duration(milliseconds: 2200), () {
        if (mounted && _copiedKey == key) {
          setState(() => _copiedKey = null);
        }
      });
    }
  }

  void _resetFilters() {
    setState(() {
      _selectedVersion = 'all';
      _selectedCategory = 'all';
      _searchQuery = '';
      _searchController.clear();
    });
  }

  List<ChangelogRelease> _getFilteredReleases() {
    List<ChangelogRelease> list = kFlutterChangelogData;

    // Filter by version
    if (_selectedVersion != 'all') {
      list = list.where((r) => r.version == _selectedVersion).toList();
    }

    final query = _searchQuery.trim().toLowerCase();

    // Filter by search query
    if (query.isNotEmpty) {
      list = list
          .map((release) {
            final versionMatches = release.version.toLowerCase().contains(query);
            final titleMatches = release.title.toLowerCase().contains(query);
            final overviewMatches = release.overview.toLowerCase().contains(query);

            final filteredCategories = release.categories
                .map((cat) {
                  final catTypeMatches = cat.type.toLowerCase().contains(query);
                  final catLabelMatches = cat.label.toLowerCase().contains(query);

                  final filteredItems = cat.items.where((item) {
                    final compMatches = item.component.toLowerCase().contains(query);
                    final sumMatches = item.summary.toLowerCase().contains(query);
                    final detailMatches = item.details.any(
                      (d) => d.toLowerCase().contains(query),
                    );
                    return compMatches || sumMatches || detailMatches;
                  }).toList();

                  if (filteredItems.isNotEmpty || catTypeMatches || catLabelMatches) {
                    return ChangelogCategory(
                      type: cat.type,
                      label: cat.label,
                      items: filteredItems.isNotEmpty ? filteredItems : cat.items,
                    );
                  }
                  return null;
                })
                .whereType<ChangelogCategory>()
                .toList();

            if (versionMatches || titleMatches || overviewMatches || filteredCategories.isNotEmpty) {
              return ChangelogRelease(
                version: release.version,
                date: release.date,
                relativeDate: release.relativeDate,
                tag: release.tag,
                isLatest: release.isLatest,
                title: release.title,
                overview: release.overview,
                highlights: release.highlights,
                installCommand: release.installCommand,
                categories: filteredCategories.isNotEmpty
                    ? filteredCategories
                    : release.categories,
              );
            }
            return null;
          })
          .whereType<ChangelogRelease>()
          .toList();
    }

    // Filter by Category
    if (_selectedCategory != 'all') {
      list = list
          .map((release) {
            final matchingCategories = release.categories.where((cat) {
              final catType = cat.type.toLowerCase();
              final sel = _selectedCategory.toLowerCase();
              if (sel == 'fixed') {
                return catType == 'fixed' || cat.label.toLowerCase().contains('fix');
              } else if (sel == 'added') {
                return catType == 'added' || cat.label.toLowerCase().contains('add');
              } else if (sel == 'enhanced') {
                return catType == 'enhanced' || cat.label.toLowerCase().contains('enhanc');
              } else if (sel == 'changed') {
                return catType == 'changed' || cat.label.toLowerCase().contains('change');
              }
              return catType == sel;
            }).toList();

            if (matchingCategories.isNotEmpty) {
              return ChangelogRelease(
                version: release.version,
                date: release.date,
                relativeDate: release.relativeDate,
                tag: release.tag,
                isLatest: release.isLatest,
                title: release.title,
                overview: release.overview,
                highlights: release.highlights,
                installCommand: release.installCommand,
                categories: matchingCategories,
              );
            }
            return null;
          })
          .whereType<ChangelogRelease>()
          .toList();
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: widgetbookThemeNotifier,
      builder: (context, mode, _) {
        final theme = Theme.of(context);
        final bool isDark = theme.brightness == Brightness.dark ||
            mode == ThemeMode.dark ||
            (mode == ThemeMode.system &&
                MediaQuery.platformBrightnessOf(context) == Brightness.dark);

        // Consistent surface tokens matching ComponentDocs and UX4G foundations
        final bg = isDark ? const Color(0xFF0F1117) : const Color(0xFFF8F9FC);
        final cardBg = isDark ? const Color(0xFF161925) : Colors.white;
        final borderColor = isDark ? const Color(0xFF2D3348) : const Color(0xFFE2E8F0);
        final onSurface = isDark ? Colors.white : const Color(0xFF0F172A);
        final subColor = isDark ? const Color(0xFF94A3B8) : const Color(0xFF475569);
        const primary = Ux4gColors.primary; // Official UX4G primary (0xFF4A2BC2)
        final primaryAccent = isDark ? const Color(0xFFA391FF) : Ux4gColors.primary;

        final filteredReleases = _getFilteredReleases();
        final latestRelease = kFlutterChangelogData.firstWhere(
          (r) => r.isLatest,
          orElse: () => kFlutterChangelogData.first,
        );

        final showSpotlight = (_selectedVersion == 'all' ||
                _selectedVersion == latestRelease.version) &&
            _searchQuery.isEmpty &&
            _selectedCategory == 'all';

        return Scaffold(
          backgroundColor: bg,
          body: LayoutBuilder(
            builder: (context, constraints) {
              final isDesktop = constraints.maxWidth >= 960;
              final isTablet = constraints.maxWidth >= 640 && !isDesktop;
              final maxW = constraints.maxWidth > 1160 ? 1160.0 : constraints.maxWidth;

              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: isDesktop ? 48 : (isTablet ? 32 : 18),
                  vertical: isDesktop ? 48 : 28,
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: maxW),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ── Header ──────────────────────────────────────────────
                        _buildHeader(
                          context,
                          isDesktop,
                          isDark,
                          onSurface,
                          subColor,
                          primary,
                          primaryAccent,
                          borderColor,
                          latestRelease,
                        ),

                        const SizedBox(height: 28),

                        // ── Spotlight Card for Latest Version ───────────────────
                        if (showSpotlight) ...[
                          _buildSpotlightCard(
                            context,
                            isDesktop,
                            isDark,
                            cardBg,
                            borderColor,
                            onSurface,
                            subColor,
                            primary,
                            primaryAccent,
                            latestRelease,
                          ),
                          const SizedBox(height: 28),
                        ],

                        // ── Controls & Filters Bar ──────────────────────────────
                        _buildControlsCard(
                          context,
                          isDesktop,
                          isDark,
                          cardBg,
                          borderColor,
                          onSurface,
                          subColor,
                          primary,
                        ),

                        const SizedBox(height: 28),

                        // ── Timeline / Releases List ────────────────────────────
                        if (filteredReleases.isEmpty)
                          _buildEmptyState(isDark, cardBg, borderColor, onSurface, subColor, primary)
                        else
                          ...filteredReleases.map(
                            (release) => Padding(
                              padding: const EdgeInsets.only(bottom: 24),
                              child: _buildReleaseCard(
                                context,
                                release,
                                isDesktop,
                                isDark,
                                cardBg,
                                borderColor,
                                onSurface,
                                subColor,
                                primary,
                              ),
                            ),
                          ),

                        const SizedBox(height: 48),

                        // ── Footer ──────────────────────────────────────────────
                        _buildFooter(isDark, subColor, primary),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  // ── 1. Header ──────────────────────────────────────────────────────────────

  Widget _buildHeader(
    BuildContext context,
    bool isDesktop,
    bool isDark,
    Color onSurface,
    Color subColor,
    Color primary,
    Color primaryAccent,
    Color borderColor,
    ChangelogRelease latestRelease,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top Badges Row
        Wrap(
          spacing: 10,
          runSpacing: 10,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            // UX4G Design System badge with live pulse dot
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF161925) : const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: borderColor,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 7,
                    height: 7,
                    decoration: const BoxDecoration(
                      color: Color(0xFF10B981),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 7),
                  Text(
                    'UX4G Design System',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: isDark ? const Color(0xFFCBD5E1) : const Color(0xFF475569),
                    ),
                  ),
                ],
              ),
            ),

            // Latest Version Pill
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: isDark
                    ? const Color(0xFF166534).withValues(alpha: 0.25)
                    : const Color(0xFFDCFCE7),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isDark ? const Color(0xFF15803D) : const Color(0xFF86EFAC),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.verified_rounded,
                    size: 14,
                    color: Color(0xFF16A34A),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Latest v${latestRelease.version}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: isDark ? const Color(0xFF86EFAC) : const Color(0xFF15803D),
                    ),
                  ),
                ],
              ),
            ),

            // Flutter Component Library tag
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: isDark
                    ? Ux4gColors.primary.withValues(alpha: 0.25)
                    : Ux4gColors.primary50,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isDark
                      ? Ux4gColors.primary.withValues(alpha: 0.5)
                      : Ux4gColors.primary100,
                ),
              ),
              child: Text(
                'Flutter Component Library',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: primaryAccent,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 18),

        // Title
        Text(
          'Changes Logs',
          style: TextStyle(
            fontSize: isDesktop ? 38 : 28,
            fontWeight: FontWeight.w900,
            letterSpacing: -0.8,
            color: onSurface,
            height: 1.15,
          ),
        ),

        const SizedBox(height: 10),

        // Subtitle
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 820),
          child: Text(
            'Keep track of recent updates, new components, bug fixes, enhancements, and breaking changes across every release of the UX4G Flutter component library.',
            style: TextStyle(
              fontSize: isDesktop ? 16 : 14.5,
              color: subColor,
              height: 1.55,
            ),
          ),
        ),

        const SizedBox(height: 20),

        // Action Buttons Row (flutter pub add command)
        Wrap(
          spacing: 12,
          runSpacing: 10,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            _buildCommandPill(
              label: 'flutter pub add ux4g_flutter_components',
              copyText: 'flutter pub add ux4g_flutter_components',
              copyKey: 'header-install',
              isDark: isDark,
              borderColor: borderColor,
              onSurface: onSurface,
              primary: primary,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCommandPill({
    required String label,
    required String copyText,
    required String copyKey,
    required bool isDark,
    required Color borderColor,
    required Color onSurface,
    required Color primary,
  }) {
    final isCopied = _copiedKey == copyKey;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _handleCopy(copyText, copyKey),
        borderRadius: BorderRadius.circular(10),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: isCopied
                ? (isDark
                    ? const Color(0xFF166534).withValues(alpha: 0.25)
                    : const Color(0xFFF0FDF4))
                : (isDark ? const Color(0xFF161925) : Colors.white),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isCopied ? const Color(0xFF86EFAC) : borderColor,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.03),
                blurRadius: 4,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: isCopied
                      ? const Color(0xFF16A34A)
                      : (isDark ? const Color(0xFFE2E8F0) : const Color(0xFF1E293B)),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                height: 14,
                width: 1,
                color: borderColor,
              ),
              const SizedBox(width: 10),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 150),
                child: isCopied
                    ? const Row(
                        key: ValueKey('copied'),
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.check_rounded,
                            size: 14,
                            color: Color(0xFF16A34A),
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Copied',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF16A34A),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        key: const ValueKey('copy'),
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.content_copy_rounded,
                            size: 14,
                            color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Copy',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
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

  // ── 2. Spotlight Card (Latest Release) ──────────────────────────────────────

  Widget _buildSpotlightCard(
    BuildContext context,
    bool isDesktop,
    bool isDark,
    Color cardBg,
    Color borderColor,
    Color onSurface,
    Color subColor,
    Color primary,
    Color primaryAccent,
    ChangelogRelease latest,
  ) {
    return Container(
      padding: EdgeInsets.all(isDesktop ? 26 : 20),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark
              ? Ux4gColors.primary.withValues(alpha: 0.45)
              : Ux4gColors.primary100,
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: Ux4gColors.primary.withValues(alpha: isDark ? 0.1 : 0.06),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Spotlight Top Row
          Wrap(
            spacing: 12,
            runSpacing: 8,
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: isDark
                      ? Ux4gColors.primary.withValues(alpha: 0.25)
                      : Ux4gColors.primary50,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isDark
                        ? Ux4gColors.primary.withValues(alpha: 0.5)
                        : Ux4gColors.primary100,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.star_rounded,
                      size: 15,
                      color: primaryAccent,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Latest Version Highlights • v${latest.version}',
                      style: TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w700,
                        color: primaryAccent,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Released ${latest.relativeDate} (${latest.date})',
                style: TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w500,
                  color: subColor,
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          // Title
          Text(
            latest.title,
            style: TextStyle(
              fontSize: isDesktop ? 22 : 18,
              fontWeight: FontWeight.w800,
              color: onSurface,
              letterSpacing: -0.3,
            ),
          ),

          const SizedBox(height: 8),

          // Overview
          Text(
            latest.overview,
            style: TextStyle(
              fontSize: 14.5,
              color: subColor,
              height: 1.5,
            ),
          ),

          if (latest.highlights.isNotEmpty) ...[
            const SizedBox(height: 18),
            LayoutBuilder(
              builder: (context, constraints) {
                final is2Col = constraints.maxWidth >= 720;
                final half = (latest.highlights.length / 2).ceil();
                final leftCol = is2Col ? latest.highlights.sublist(0, half) : latest.highlights;
                final rightCol = is2Col ? latest.highlights.sublist(half) : <String>[];

                if (is2Col) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: leftCol
                              .map((h) => _buildHighlightRow(h, isDark, onSurface, subColor))
                              .toList(),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          children: rightCol
                              .map((h) => _buildHighlightRow(h, isDark, onSurface, subColor))
                              .toList(),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: leftCol
                        .map((h) => _buildHighlightRow(h, isDark, onSurface, subColor))
                        .toList(),
                  );
                }
              },
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildHighlightRow(String text, bool isDark, Color onSurface, Color subColor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 2),
            child: Icon(
              Icons.check_circle_rounded,
              size: 16,
              color: Color(0xFF10B981),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13.5,
                color: isDark ? const Color(0xFFCBD5E1) : const Color(0xFF334155),
                height: 1.45,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── 3. Controls & Filter Bar ───────────────────────────────────────────────

  Widget _buildControlsCard(
    BuildContext context,
    bool isDesktop,
    bool isDark,
    Color cardBg,
    Color borderColor,
    Color onSurface,
    Color subColor,
    Color primary,
  ) {
    return Container(
      padding: EdgeInsets.all(isDesktop ? 20 : 16),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.03),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row 1: Search Box + Version Dropdown
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth >= 680;
              final searchBox = Container(
                height: 42,
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF0F1117) : const Color(0xFFF8F9FC),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: borderColor,
                  ),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    Icon(
                      Icons.search_rounded,
                      size: 18,
                      color: subColor,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        onChanged: (val) => setState(() => _searchQuery = val),
                        style: TextStyle(
                          fontSize: 13.5,
                          color: onSurface,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Search updates, components, or bug fixes...',
                          hintStyle: TextStyle(
                            fontSize: 13.5,
                            color: subColor.withValues(alpha: 0.8),
                          ),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(vertical: 10),
                        ),
                      ),
                    ),
                    if (_searchQuery.isNotEmpty)
                      IconButton(
                        icon: const Icon(Icons.close_rounded, size: 16),
                        color: subColor,
                        splashRadius: 16,
                        onPressed: () {
                          _searchController.clear();
                          setState(() => _searchQuery = '');
                        },
                      ),
                    const SizedBox(width: 4),
                  ],
                ),
              );

              final versionDropdown = Container(
                height: 42,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF0F1117) : const Color(0xFFF8F9FC),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: borderColor,
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedVersion,
                    icon: Icon(Icons.arrow_drop_down_rounded, color: subColor),
                    dropdownColor: isDark ? const Color(0xFF161925) : Colors.white,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: onSurface,
                    ),
                    items: [
                      DropdownMenuItem(
                        value: 'all',
                        child: Text('All Releases (${kFlutterChangelogData.length})'),
                      ),
                      ...kFlutterChangelogData.map(
                        (r) => DropdownMenuItem(
                          value: r.version,
                          child: Text('v${r.version} ${r.isLatest ? '(Latest)' : ''}'),
                        ),
                      ),
                    ],
                    onChanged: (val) {
                      if (val != null) {
                        setState(() => _selectedVersion = val);
                      }
                    },
                  ),
                ),
              );

              if (isWide) {
                return Row(
                  children: [
                    Expanded(child: searchBox),
                    const SizedBox(width: 14),
                    versionDropdown,
                  ],
                );
              } else {
                return Column(
                  children: [
                    searchBox,
                    const SizedBox(height: 10),
                    SizedBox(width: double.infinity, child: versionDropdown),
                  ],
                );
              }
            },
          ),

          const SizedBox(height: 16),

          // Row 2: Version Pills Scroll Row
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildVersionPill('all', 'All Releases', isDark, borderColor, primary),
                const SizedBox(width: 8),
                ...kFlutterChangelogData.map((r) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: _buildVersionPill(
                      r.version,
                      'v${r.version}',
                      isDark,
                      borderColor,
                      primary,
                      isLatest: r.isLatest,
                    ),
                  );
                }),
              ],
            ),
          ),

          const SizedBox(height: 14),

          // Divider
          Divider(color: borderColor, height: 1),

          const SizedBox(height: 14),

          // Row 3: Category Filter Chips
          Wrap(
            spacing: 8,
            runSpacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                'Filter Category:',
                style: TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                  color: subColor,
                ),
              ),
              _buildCategoryChip('all', 'All Updates', isDark, borderColor, primary),
              _buildCategoryChip('Added', 'Added', isDark, borderColor, Ux4gColors.primary),
              _buildCategoryChip('Fixed', 'Fixed', isDark, borderColor, const Color(0xFF10B981)),
              _buildCategoryChip('Enhanced', 'Enhanced', isDark, borderColor, const Color(0xFFF59E0B)),
              _buildCategoryChip('Changed', 'Changed', isDark, borderColor, const Color(0xFF3B82F6)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVersionPill(
    String versionKey,
    String label,
    bool isDark,
    Color borderColor,
    Color primary, {
    bool isLatest = false,
  }) {
    final isSelected = _selectedVersion == versionKey;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => setState(() => _selectedVersion = versionKey),
        borderRadius: BorderRadius.circular(20),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: isSelected
                ? primary
                : (isDark ? const Color(0xFF0F1117) : const Color(0xFFF1F5F9)),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected ? primary : borderColor,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  color: isSelected
                      ? Colors.white
                      : (isDark ? const Color(0xFFCBD5E1) : const Color(0xFF334155)),
                ),
              ),
              if (isLatest) ...[
                const SizedBox(width: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Colors.white.withValues(alpha: 0.25)
                        : const Color(0xFF16A34A).withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Latest',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: isSelected ? Colors.white : const Color(0xFF16A34A),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String catKey, String label, bool isDark, Color borderColor, Color activeColor) {
    final isSelected = _selectedCategory.toLowerCase() == catKey.toLowerCase();

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => setState(() => _selectedCategory = catKey),
        borderRadius: BorderRadius.circular(8),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
          decoration: BoxDecoration(
            color: isSelected
                ? activeColor.withValues(alpha: isDark ? 0.25 : 0.12)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? activeColor : borderColor,
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              color: isSelected
                  ? (isDark ? const Color(0xFFA391FF) : activeColor)
                  : (isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B)),
            ),
          ),
        ),
      ),
    );
  }

  // ── 4. Release Cards & Changes ──────────────────────────────────────────────

  Widget _buildReleaseCard(
    BuildContext context,
    ChangelogRelease release,
    bool isDesktop,
    bool isDark,
    Color cardBg,
    Color borderColor,
    Color onSurface,
    Color subColor,
    Color primary,
  ) {
    final isLatest = release.isLatest;
    final copyKey = 'card-pub-${release.version}';
    final isCopied = _copiedKey == copyKey;

    return Container(
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isLatest
              ? (isDark
                  ? Ux4gColors.primary.withValues(alpha: 0.5)
                  : Ux4gColors.primary100)
              : borderColor,
          width: isLatest ? 1.4 : 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.03),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Card Header
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 24 : 18,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF1E2235) : const Color(0xFFF8FAFC),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
              border: Border(bottom: BorderSide(color: borderColor)),
            ),
            child: Wrap(
              spacing: 12,
              runSpacing: 8,
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                // Left: Version + Tag + Date
                Wrap(
                  spacing: 10,
                  runSpacing: 6,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      'v${release.version}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: onSurface,
                        letterSpacing: -0.2,
                      ),
                    ),
                    if (release.tag != null)
                      _buildTagBadge(release.tag!, isDark, primary),
                    Text(
                      '• Released ${release.date} (${release.relativeDate})',
                      style: TextStyle(
                        fontSize: 13,
                        color: subColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                // Right: Quick Copy pub add button
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => _handleCopy(
                      'flutter pub add ux4g_flutter_components',
                      copyKey,
                    ),
                    borderRadius: BorderRadius.circular(8),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: isCopied
                            ? (isDark
                                ? const Color(0xFF166534).withValues(alpha: 0.3)
                                : const Color(0xFFF0FDF4))
                            : (isDark ? const Color(0xFF161925) : Colors.white),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isCopied ? const Color(0xFF86EFAC) : borderColor,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            isCopied ? Icons.check_rounded : Icons.content_copy_rounded,
                            size: 13,
                            color: isCopied
                                ? const Color(0xFF16A34A)
                                : (isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B)),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            isCopied ? 'Copied' : 'pub add @${release.version}',
                            style: TextStyle(
                              fontSize: 11.5,
                              fontWeight: FontWeight.w600,
                              color: isCopied
                                  ? const Color(0xFF16A34A)
                                  : (isDark ? const Color(0xFFCBD5E1) : const Color(0xFF475569)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Card Body
          Padding(
            padding: EdgeInsets.all(isDesktop ? 24 : 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  release.title,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: onSurface,
                  ),
                ),

                const SizedBox(height: 6),

                // Overview
                Text(
                  release.overview,
                  style: TextStyle(
                    fontSize: 14,
                    color: subColor,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 20),

                // Categories
                ...release.categories.map((category) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: _buildCategoryBlock(
                      context,
                      category,
                      isDark,
                      onSurface,
                      subColor,
                      borderColor,
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTagBadge(String tag, bool isDark, Color primary) {
    Color bg;
    Color border;
    Color text;

    switch (tag.toLowerCase()) {
      case 'latest':
        bg = isDark ? const Color(0xFF166534).withValues(alpha: 0.3) : const Color(0xFFDCFCE7);
        border = isDark ? const Color(0xFF15803D) : const Color(0xFF86EFAC);
        text = isDark ? const Color(0xFF86EFAC) : const Color(0xFF15803D);
        break;
      case 'major':
        bg = isDark ? Ux4gColors.primary.withValues(alpha: 0.25) : Ux4gColors.primary50;
        border = isDark ? Ux4gColors.primary.withValues(alpha: 0.5) : Ux4gColors.primary100;
        text = isDark ? const Color(0xFFA391FF) : Ux4gColors.primary;
        break;
      case 'maintenance':
      case 'patch':
        bg = isDark ? const Color(0xFF1E3A8A).withValues(alpha: 0.3) : const Color(0xFFDBEAFE);
        border = isDark ? const Color(0xFF2563EB) : const Color(0xFF93C5FD);
        text = isDark ? const Color(0xFF93C5FD) : const Color(0xFF1D4ED8);
        break;
      default:
        bg = isDark ? const Color(0xFF1E2235) : const Color(0xFFF1F5F9);
        border = isDark ? const Color(0xFF2D3348) : const Color(0xFFCBD5E1);
        text = isDark ? const Color(0xFFCBD5E1) : const Color(0xFF475569);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: border),
      ),
      child: Text(
        tag,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: text,
        ),
      ),
    );
  }

  Widget _buildCategoryBlock(
    BuildContext context,
    ChangelogCategory category,
    bool isDark,
    Color onSurface,
    Color subColor,
    Color borderColor,
  ) {
    Color typeBg;
    Color typeBorder;
    Color typeText;

    switch (category.type.toLowerCase()) {
      case 'fixed':
        typeBg = isDark ? const Color(0xFF166534).withValues(alpha: 0.25) : const Color(0xFFDCFCE7);
        typeBorder = isDark ? const Color(0xFF15803D) : const Color(0xFF86EFAC);
        typeText = isDark ? const Color(0xFF86EFAC) : const Color(0xFF15803D);
        break;
      case 'added':
        typeBg = isDark ? Ux4gColors.primary.withValues(alpha: 0.25) : Ux4gColors.primary50;
        typeBorder = isDark ? Ux4gColors.primary.withValues(alpha: 0.5) : Ux4gColors.primary100;
        typeText = isDark ? const Color(0xFFA391FF) : Ux4gColors.primary;
        break;
      case 'enhanced':
        typeBg = isDark ? const Color(0xFF78350F).withValues(alpha: 0.25) : const Color(0xFFFEF3C7);
        typeBorder = isDark ? const Color(0xFFB45309) : const Color(0xFFFDE68A);
        typeText = isDark ? const Color(0xFFFCD34D) : const Color(0xFFB45309);
        break;
      default:
        typeBg = isDark ? const Color(0xFF1E3A8A).withValues(alpha: 0.25) : const Color(0xFFDBEAFE);
        typeBorder = isDark ? const Color(0xFF2563EB) : const Color(0xFFBFDBFE);
        typeText = isDark ? const Color(0xFF93C5FD) : const Color(0xFF1D4ED8);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Category Header Tag
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: typeBg,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: typeBorder),
              ),
              child: Text(
                category.type,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: typeText,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              category.label,
              style: TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.w700,
                color: onSurface,
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        // Items List
        ...category.items.map((item) {
          return Padding(
            padding: const EdgeInsets.only(left: 6, bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Item Header (Component Pill + Summary)
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    _buildComponentPill(context, item, isDark, borderColor),
                    Text(
                      item.summary,
                      style: TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.w600,
                        color: isDark ? Colors.white : const Color(0xFF1E293B),
                      ),
                    ),
                  ],
                ),

                // Details List
                if (item.details.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  ...item.details.map((detail) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 12, top: 4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '• ',
                            style: TextStyle(
                              color: subColor,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              detail,
                              style: TextStyle(
                                fontSize: 13,
                                color: subColor,
                                height: 1.45,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildComponentPill(BuildContext context, ChangelogItem item, bool isDark, Color borderColor) {
    final hasLink = item.componentPath != null;

    final child = Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: isDark
            ? Ux4gColors.primary.withValues(alpha: 0.2)
            : Ux4gColors.primary50,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: hasLink
              ? (isDark
                  ? Ux4gColors.primary.withValues(alpha: 0.5)
                  : Ux4gColors.primary100)
              : borderColor,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            item.component,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: isDark
                  ? const Color(0xFFA391FF)
                  : Ux4gColors.primary,
            ),
          ),
          if (hasLink) ...[
            const SizedBox(width: 4),
            Icon(
              Icons.arrow_forward_rounded,
              size: 12,
              color: isDark ? const Color(0xFFA391FF) : Ux4gColors.primary,
            ),
          ],
        ],
      ),
    );

    if (hasLink) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            final state = WidgetbookState.maybeOf(context);
            // ignore: invalid_use_of_internal_member
            state?.updatePath(item.componentPath!);
          },
          borderRadius: BorderRadius.circular(6),
          child: child,
        ),
      );
    }

    return child;
  }

  // ── 5. Empty State ──────────────────────────────────────────────────────────

  Widget _buildEmptyState(
    bool isDark,
    Color cardBg,
    Color borderColor,
    Color onSurface,
    Color subColor,
    Color primary,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.history_toggle_off_rounded,
            size: 48,
            color: subColor.withValues(alpha: 0.6),
          ),
          const SizedBox(height: 16),
          Text(
            'No changelog entries matched',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: onSurface,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Try adjusting your search query or selecting a different version filter.',
            style: TextStyle(
              fontSize: 14,
              color: subColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: _resetFilters,
            icon: const Icon(Icons.refresh_rounded, size: 16),
            label: const Text('Reset Filters'),
            style: ElevatedButton.styleFrom(
              backgroundColor: primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── 6. Footer ───────────────────────────────────────────────────────────────

  Widget _buildFooter(bool isDark, Color subColor, Color primary) {
    return Center(
      child: Text(
        'UX4G Flutter Component Library • Unified Experience for Government',
        style: TextStyle(
          fontSize: 12.5,
          color: subColor.withValues(alpha: 0.8),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
