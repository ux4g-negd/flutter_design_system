import 'package:flutter/material.dart';
import '../foundation/dimensions.dart';
import '../foundation/colors.dart';
import '../foundation/typography.dart';
import 'chips.dart';
import 'checkbox.dart';
enum Ux4gDropdownFilterType { contains, startsWith, startsWithPerTerm }

enum Ux4gDropdownSize { s, m, l }

enum Ux4gDropdownMode { single, multi }

enum Ux4gDropdownStatus { defaultStatus, error, disabled, warning, success }

class Ux4gDropdownOption {
  final String id;
  final String label;
  final IconData? leadingIcon;

  const Ux4gDropdownOption({
    required this.id,
    required this.label,
    this.leadingIcon,
  });
}

// ── ACTION DROPDOWN ──────────────────────────────────────────────────────────

class Ux4gActionDropdownOption {
  final String id;
  final String label;
  final bool showTrailingArrow;

  const Ux4gActionDropdownOption({
    required this.id,
    required this.label,
    this.showTrailingArrow = true,
  });
}

typedef Ux4gDropdownTriggerBuilder =
    Widget Function(BuildContext context, VoidCallback toggleDropdown);

class Ux4gActionDropdown extends StatefulWidget {
  final List<Ux4gActionDropdownOption> options;
  final ValueChanged<Ux4gActionDropdownOption> onOptionClick;
  final Ux4gDropdownTriggerBuilder triggerBuilder;
  final String? selectedOptionId;

  const Ux4gActionDropdown({
    super.key,
    required this.options,
    required this.onOptionClick,
    required this.triggerBuilder,
    this.selectedOptionId,
  });

  @override
  State<Ux4gActionDropdown> createState() => _Ux4gActionDropdownState();
}

class _Ux4gActionDropdownState extends State<Ux4gActionDropdown> {
  bool _isExpanded = false;
  final LayerLink _layerLink = LayerLink();
  final Object _tapGroupId = Object();
  OverlayEntry? _overlayEntry;

  @override
  void didUpdateWidget(Ux4gActionDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedOptionId != oldWidget.selectedOptionId) {
      setState(() {});
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _overlayEntry?.markNeedsBuild();
      });
    }
  }

  void _toggleDropdown() {
    if (_isExpanded) {
      _closeDropdown();
    } else {
      _openDropdown();
    }
  }

  void _openDropdown() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    setState(() => _isExpanded = true);
  }

  void _closeDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() => _isExpanded = false);
  }

  OverlayEntry _createOverlayEntry() {
    final appTheme = Theme.of(context);
    return OverlayEntry(
      builder: (overlayContext) {
        final renderBox = this.context.findRenderObject() as RenderBox?;
        final size = renderBox?.hasSize == true ? renderBox!.size : Size.zero;

        return Theme(
          data: appTheme,
          child: Builder(
            builder: (context) {
              return TapRegion(
                groupId: _tapGroupId,
                onTapOutside: (_) => _closeDropdown(),
                child: Stack(
                  children: [
                    Positioned(
                      width: 200,
                      child: CompositedTransformFollower(
                link: _layerLink,
                showWhenUnlinked: false,
                offset: Offset(0, size.height + 4),
                child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(Ux4gRadius.radius8),
                  color:
                      Theme.of(context).extension<Ux4gThemeColors>()?.surface ??
                      Theme.of(context).colorScheme.surface,
                  child: Container(
                    constraints: const BoxConstraints(maxHeight: 300),
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      itemCount: widget.options.length,
                      itemBuilder: (context, index) {
                        final option = widget.options[index];
                        final typography = Theme.of(
                          context,
                        ).extension<Ux4gTypography>();
                        final uxColors = Theme.of(context).extension<Ux4gThemeColors>();
                        final materialTheme = Theme.of(context);
                        final isSelected = widget.selectedOptionId != null && widget.selectedOptionId == option.id;

                        return ListTile(
                          dense: true,
                          selected: isSelected,
                          selectedTileColor: (uxColors?.primary ?? materialTheme.colorScheme.primary).withValues(alpha: 0.08),
                          title: Text(
                            option.label,
                            style: (typography?.bS_default ?? Theme.of(context).textTheme.bodySmall)?.copyWith(
                              color: isSelected ? (uxColors?.primary ?? materialTheme.colorScheme.primary) : null,
                              fontWeight: isSelected ? FontWeight.w600 : null,
                            ),
                          ),
                          trailing: option.showTrailingArrow
                              ? Icon(Icons.keyboard_arrow_right, size: 20, color: isSelected ? (uxColors?.primary ?? materialTheme.colorScheme.primary) : null)
                              : (isSelected ? Icon(Icons.check, size: 20, color: uxColors?.primary ?? materialTheme.colorScheme.primary) : null),
                          onTap: () {
                            _closeDropdown();
                            widget.onOptionClick(option);
                          },
                        );
                      },
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
    return TapRegion(
      groupId: _tapGroupId,
      onTapOutside: (_) {
        if (_isExpanded) _closeDropdown();
      },
      child: CompositedTransformTarget(
        link: _layerLink,
        child: widget.triggerBuilder(context, _toggleDropdown),
      ),
    );
  }
}

// ── SELECTION DROPDOWN ────────────────────────────────────────────────────────

class Ux4gSelectionDropdown extends StatefulWidget {
  final List<Ux4gDropdownOption> options;
  final List<String> selectedOptionIds;
  final ValueChanged<List<String>> onSelectionChange;
  final String? label;
  final bool isRequired;
  final String? description;
  final String placeholder;
  final Ux4gDropdownSize size;
  final Ux4gDropdownMode mode;
  final Ux4gDropdownStatus status;
  final bool searchEnabled;
  final Ux4gDropdownFilterType filterType;
  final TextStyle? labelTextStyle;
  final TextStyle? valueTextStyle;
  final IconData? leadingIcon;

  const Ux4gSelectionDropdown({
    super.key,
    required this.options,
    required this.selectedOptionIds,
    required this.onSelectionChange,
    this.label,
    this.isRequired = false,
    this.description,
    this.placeholder = "Please select..",
    this.size = Ux4gDropdownSize.m,
    this.mode = Ux4gDropdownMode.single,
    this.status = Ux4gDropdownStatus.defaultStatus,
    this.searchEnabled = false,
    this.filterType = Ux4gDropdownFilterType.contains,
    this.labelTextStyle,
    this.valueTextStyle,
    this.leadingIcon,
  });

  @override
  State<Ux4gSelectionDropdown> createState() => _Ux4gSelectionDropdownState();
}

class _Ux4gSelectionDropdownState extends State<Ux4gSelectionDropdown> {
  bool _isExpanded = false;
  String _searchQuery = "";
  final LayerLink _layerLink = LayerLink();
  final GlobalKey _dropdownKey = GlobalKey();
  final Object _tapGroupId = Object();
  OverlayEntry? _overlayEntry;

  @override
  void didUpdateWidget(Ux4gSelectionDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedOptionIds != oldWidget.selectedOptionIds) {
      setState(() {});
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _overlayEntry?.markNeedsBuild();
      });
    }
  }

  void _toggleDropdown() {
    if (widget.status == Ux4gDropdownStatus.disabled) return;
    if (_isExpanded) {
      _closeDropdown();
    } else {
      _openDropdown();
    }
  }

  void _openDropdown() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    setState(() => _isExpanded = true);
  }

  void _closeDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() {
      _isExpanded = false;
      _searchQuery = "";
    });
  }

  OverlayEntry _createOverlayEntry() {
    final appTheme = Theme.of(context);
    return OverlayEntry(
      builder: (overlayContext) {
        final renderBox =
            _dropdownKey.currentContext?.findRenderObject() as RenderBox?;
        final size = renderBox?.hasSize == true ? renderBox!.size : Size.zero;

        return Theme(
          data: appTheme,
          child: Builder(
            builder: (context) {
              return TapRegion(
                groupId: _tapGroupId,
                onTapOutside: (_) => _closeDropdown(),
                child: Stack(
                  children: [
                    CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              offset: Offset(0, size.height + 4),
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(Ux4gRadius.radius8),
                color:
                    Theme.of(context).extension<Ux4gThemeColors>()?.surface ??
                    Theme.of(context).colorScheme.surface,
                clipBehavior: Clip.antiAlias,
                child: Container(
                  width: size.width,
                  constraints: const BoxConstraints(maxHeight: 300),
                  child: _buildDropdownList(),
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

  Widget _buildDropdownList() {
    final uxColors = Theme.of(context).extension<Ux4gThemeColors>();
    final uxTypography = Theme.of(context).extension<Ux4gTypography>();
    final materialTheme = Theme.of(context);
    final isDark = materialTheme.brightness == Brightness.dark;

    final filteredOptions = widget.options.where((option) {
      if (!widget.searchEnabled || _searchQuery.isEmpty) return true;
      final query = _searchQuery.trim().toLowerCase();
      if (query.isEmpty) return true;
      final label = option.label.toLowerCase();

      return switch (widget.filterType) {
        Ux4gDropdownFilterType.contains => label.contains(query),
        Ux4gDropdownFilterType.startsWith => label.startsWith(query),
        Ux4gDropdownFilterType.startsWithPerTerm => () {
          final queryTerms = query.split(' ').where((t) => t.isNotEmpty);
          final labelTerms = label.split(' ').where((t) => t.isNotEmpty);
          return queryTerms.every(
            (qTerm) => labelTerms.any((lTerm) => lTerm.startsWith(qTerm)),
          );
        }(),
      };
    }).toList();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.searchEnabled)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              autofocus: true,
              style: (uxTypography?.bM_default ?? materialTheme.textTheme.bodyMedium)?.copyWith(
                color: isDark ? Ux4gColors.neutral0 : Ux4gColors.neutral900,
              ),
              decoration: InputDecoration(
                hintText: "Start typing..",
                hintStyle: (uxTypography?.bM_default ?? materialTheme.textTheme.bodyMedium)?.copyWith(
                  color: isDark ? Ux4gColors.neutral400 : Ux4gColors.neutral500,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  size: 20,
                  color: isDark ? Ux4gColors.neutral400 : Ux4gColors.neutral500,
                ),
                isDense: true,
                filled: true,
                fillColor: isDark ? Ux4gColors.neutral950 : Ux4gColors.neutral0,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: isDark ? Ux4gColors.neutral700 : Ux4gColors.neutral300,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: isDark ? Ux4gColors.neutral700 : Ux4gColors.neutral300,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: uxColors?.primary ?? materialTheme.colorScheme.primary,
                  ),
                ),
              ),
              onChanged: (val) {
                _searchQuery = val;
                _overlayEntry?.markNeedsBuild();
              },
            ),
          ),
        Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 4),
            itemCount: filteredOptions.length,
            itemBuilder: (context, index) {
              final option = filteredOptions[index];
              final isSelected = widget.selectedOptionIds.contains(option.id);
              final selectedBgColor = isDark ? Ux4gColors.primary900 : Ux4gColors.primary50;
              final activeColor = isDark ? Ux4gColors.primary300 : Ux4gColors.primary600;

              return Ink(
                color: isSelected ? selectedBgColor : Colors.transparent,
                child: InkWell(
                  onTap: () => _handleSelection(option.id),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    child: Row(
                      children: [
                        if (widget.mode == Ux4gDropdownMode.multi) ...[
                          IgnorePointer(
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: Ux4gCheckbox(
                                value: isSelected,
                                onChanged: (_) {},
                                size: Ux4gCheckboxSize.medium,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                        ] else if (option.leadingIcon != null) ...[
                          Icon(option.leadingIcon, size: 20, color: isSelected ? activeColor : null),
                          const SizedBox(width: 12),
                        ],
                        Expanded(
                          child: Text(
                            option.label,
                            style:
                                (uxTypography?.bS_default ??
                                        materialTheme.textTheme.bodySmall)
                                    ?.copyWith(
                                      color: isSelected
                                          ? activeColor
                                          : null,
                                      fontWeight: isSelected
                                          ? FontWeight.w600
                                          : null,
                                    ),
                          ),
                        ),
                        if (widget.mode == Ux4gDropdownMode.single && isSelected)
                          Icon(
                            Icons.check,
                            color: activeColor,
                            size: 20,
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void _handleSelection(String id) {
    if (widget.mode == Ux4gDropdownMode.single) {
      widget.onSelectionChange([id]);
      _closeDropdown();
    } else {
      final newSelection = List<String>.from(widget.selectedOptionIds);
      if (newSelection.contains(id)) {
        newSelection.remove(id);
      } else {
        newSelection.add(id);
      }
      widget.onSelectionChange(newSelection);
    }
  }

  @override
  Widget build(BuildContext context) {
    final uxColors = Theme.of(context).extension<Ux4gThemeColors>();
    final uxTypography = Theme.of(context).extension<Ux4gTypography>();
    final materialTheme = Theme.of(context);

    final (minHeight, verticalPadding) = switch (widget.size) {
      Ux4gDropdownSize.s => (32.0, 6.0),
      Ux4gDropdownSize.m => (40.0, 8.0),
      Ux4gDropdownSize.l => (48.0, 12.0),
    };

    final textStyle = switch (widget.size) {
      Ux4gDropdownSize.s =>
        uxTypography?.lM_default ?? materialTheme.textTheme.labelMedium,
      Ux4gDropdownSize.m =>
        uxTypography?.lL_default ?? materialTheme.textTheme.labelLarge,
      Ux4gDropdownSize.l =>
        uxTypography?.lXL_default ?? materialTheme.textTheme.labelLarge,
    };

    final isDark = materialTheme.brightness == Brightness.dark;
    final defaultBgColor = isDark ? Ux4gColors.neutral950 : Ux4gColors.neutral0;
    final defaultBorderColor = isDark ? Ux4gColors.neutral700 : Ux4gColors.neutral200;

    final borderColor = switch (widget.status) {
      Ux4gDropdownStatus.disabled =>
        (uxColors?.onSurface ?? materialTheme.colorScheme.onSurface).withValues(
          alpha: 0.2,
        ),
      Ux4gDropdownStatus.error =>
        uxColors?.error ?? materialTheme.colorScheme.error,
      Ux4gDropdownStatus.warning =>
        uxColors?.warning ?? Colors.orange,
      Ux4gDropdownStatus.success =>
        uxColors?.success ?? Colors.green,
      Ux4gDropdownStatus.defaultStatus =>
        _isExpanded
            ? (uxColors?.primary ?? materialTheme.colorScheme.primary)
            : defaultBorderColor,
    };

    final descriptionColor = switch (widget.status) {
      Ux4gDropdownStatus.error => uxColors?.error ?? materialTheme.colorScheme.error,
      Ux4gDropdownStatus.warning => uxColors?.warning ?? Colors.orange,
      Ux4gDropdownStatus.success => uxColors?.success ?? Colors.green,
      _ => (uxColors?.onSurface ?? materialTheme.colorScheme.onSurface).withValues(alpha: 0.7),
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Row(
            children: [
              Text(
                widget.label!,
                style:
                    widget.labelTextStyle ??
                    (uxTypography?.lL_default ??
                            materialTheme.textTheme.labelLarge)
                        ?.copyWith(
                          color: widget.status == Ux4gDropdownStatus.disabled
                              ? (uxColors?.onSurface ??
                                        materialTheme.colorScheme.onSurface)
                                    .withValues(alpha: 0.38)
                              : (uxColors?.onSurface ??
                                    materialTheme.colorScheme.onSurface),
                        ),
              ),
              if (widget.isRequired) ...[
                const SizedBox(width: 4),
                Text(
                  "*",
                  style: (uxTypography?.bS_strong ??
                          materialTheme.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w700,
                          ) ??
                          const TextStyle(fontWeight: FontWeight.w700))
                      .copyWith(
                        color: uxColors?.error ?? materialTheme.colorScheme.error,
                      ),
                ),
              ],
            ],
          ),
          const SizedBox(height: Ux4gSpace.space4),
        ],
        TapRegion(
          groupId: _tapGroupId,
          onTapOutside: (_) {
            if (_isExpanded) _closeDropdown();
          },
          child: CompositedTransformTarget(
            link: _layerLink,
          child: GestureDetector(
            key: _dropdownKey,
            onTap: _toggleDropdown,
            child: Container(
              constraints: BoxConstraints(minHeight: minHeight),
              padding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: verticalPadding,
              ),
              decoration: BoxDecoration(
                color: widget.status == Ux4gDropdownStatus.disabled
                    ? (uxColors?.onSurface ??
                              materialTheme.colorScheme.onSurface)
                          .withValues(alpha: 0.04)
                    : defaultBgColor,
                borderRadius: BorderRadius.circular(Ux4gRadius.radius8),
                border: Border.all(color: borderColor),
              ),
              child: Row(
                children: [
                  if (widget.leadingIcon != null) ...[
                    Icon(
                      widget.leadingIcon,
                      size: 20,
                      color:
                          (uxColors?.onSurface ??
                                  materialTheme.colorScheme.onSurface)
                              .withValues(alpha: 0.6),
                    ),
                    const SizedBox(width: 8),
                  ],
                  Expanded(
                    child: widget.selectedOptionIds.isEmpty
                        ? Text(
                            widget.placeholder,
                            style: (textStyle ?? const TextStyle()).copyWith(
                              color: isDark ? Ux4gColors.neutral300 : Ux4gColors.neutral500,
                            ),
                          )
                        : (widget.mode == Ux4gDropdownMode.single
                              ? Text(
                                  widget.options
                                      .firstWhere(
                                        (o) =>
                                            o.id ==
                                            widget.selectedOptionIds.first,
                                      )
                                      .label,
                                  style: widget.valueTextStyle ?? textStyle,
                                )
                              : Wrap(
                                  spacing: 4,
                                  runSpacing: 4,
                                  children: widget.selectedOptionIds.map((id) {
                                    final opt = widget.options.firstWhere(
                                      (o) => o.id == id,
                                    );
                                    return Ux4gInputChip(
                                      text: opt.label,
                                      onDismiss: () => _handleSelection(id),
                                      leadingContent: opt.leadingIcon != null
                                          ? Icon(opt.leadingIcon, size: 14)
                                          : null,
                                    );
                                  }).toList(),
                                )),
                  ),
                  Icon(
                    _isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color:
                        (uxColors?.onSurface ??
                                materialTheme.colorScheme.onSurface)
                            .withValues(alpha: 0.6),
                  ),
                ],
              ),
            ),
          ),
        ),
        ),
        if (widget.description != null) ...[
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(
                switch (widget.status) {
                  Ux4gDropdownStatus.error => Icons.error,
                  Ux4gDropdownStatus.warning => Icons.warning,
                  Ux4gDropdownStatus.success => Icons.check_circle,
                  _ => Icons.info_outline,
                },
                size: 16,
                color: descriptionColor,
              ),
              const SizedBox(width: 4),
              Text(
                widget.description!,
                style:
                    (uxTypography?.lS_default ??
                            materialTheme.textTheme.labelSmall)
                        ?.copyWith(color: descriptionColor),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
