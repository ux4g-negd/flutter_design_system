import 'package:flutter/material.dart';
import '../foundation/colors.dart';
import '../foundation/typography.dart';
import 'buttons.dart';
import 'input_field.dart';

/// Defines the mode for the date picker.
enum Ux4gDatePickerMode { single, range }

/// A highly customizable Date Picker component supporting single and range modes.
class Ux4gDatePicker extends StatefulWidget {
  final Ux4gDatePickerMode mode;
  final DateTime? initialDate;
  final DateTimeRange? initialDateRange;
  final DateTime? minDate;
  final DateTime? maxDate;
  final ValueChanged<DateTime>? onDateSelected;
  final ValueChanged<DateTimeRange>? onDateRangeSelected;
  final String placeholder;
  final bool enabled;
  final String? label;
  final String? description;
  final bool isRequired;
  final Ux4gInputFieldStatus status;

  /// Accessibility semantic label for screen readers.
  final String? semanticLabel;

  const Ux4gDatePicker({
    super.key,
    this.mode = Ux4gDatePickerMode.single,
    this.initialDate,
    this.initialDateRange,
    this.minDate,
    this.maxDate,
    this.onDateSelected,
    this.onDateRangeSelected,
    this.placeholder = 'Select date',
    this.enabled = true,
    this.label,
    this.description,
    this.isRequired = false,
    this.status = Ux4gInputFieldStatus.defaultStatus,
    this.semanticLabel,
  });

  @override
  State<Ux4gDatePicker> createState() => _Ux4gDatePickerState();
}

class _Ux4gDatePickerState extends State<Ux4gDatePicker> {
  DateTime? _selectedDate;
  DateTimeRange? _selectedRange;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
    _selectedRange = widget.initialDateRange;
  }

  String _getFormattedValue() {
    if (widget.mode == Ux4gDatePickerMode.single) {
      if (_selectedDate == null) return widget.placeholder;
      return _formatDate(_selectedDate!);
    } else {
      if (_selectedRange == null) return widget.placeholder;
      return '${_formatDate(_selectedRange!.start)}  –  ${_formatDate(_selectedRange!.end)}';
    }
  }

  String _formatDate(DateTime date) {
    final d = date.day.toString().padLeft(2, '0');
    final m = date.month.toString().padLeft(2, '0');
    final y = date.year.toString().padLeft(4, '0');
    return '$d/$m/$y';
  }

  void _openPicker() async {
    if (!widget.enabled) return;

    final result = await showDialog<dynamic>(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          child: _Ux4gDatePickerDialog(
            mode: widget.mode,
            initialDate: _selectedDate,
            initialDateRange: _selectedRange,
            minDate: widget.minDate,
            maxDate: widget.maxDate,
          ),
        );
      },
    );

    if (result != null) {
      setState(() {
        if (widget.mode == Ux4gDatePickerMode.single && result is DateTime) {
          _selectedDate = result;
          widget.onDateSelected?.call(result);
        } else if (widget.mode == Ux4gDatePickerMode.range &&
            result is DateTimeRange) {
          _selectedRange = result;
          widget.onDateRangeSelected?.call(result);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final materialTheme = Theme.of(context);
    final ux4gColors = materialTheme.extension<Ux4gThemeColors>();
    final ux4gTypography = materialTheme.extension<Ux4gTypography>();

    final isSelected =
        (widget.mode == Ux4gDatePickerMode.single && _selectedDate != null) ||
        (widget.mode == Ux4gDatePickerMode.range && _selectedRange != null);

    final onSurface =
        ux4gColors?.onSurface ?? materialTheme.colorScheme.onSurface;
    final onBackground =
        ux4gColors?.onBackground ?? materialTheme.colorScheme.onSurface;
    final errorColor = ux4gColors?.error ?? materialTheme.colorScheme.error;
    final warningColor = ux4gColors?.warning ?? Colors.orange;
    final successColor = ux4gColors?.success ?? Colors.green;

    Color borderColor;
    if (!widget.enabled) {
      borderColor = onSurface.withValues(alpha: 0.38);
    } else {
      borderColor = switch (widget.status) {
        Ux4gInputFieldStatus.error => errorColor,
        Ux4gInputFieldStatus.warning => warningColor,
        Ux4gInputFieldStatus.success => successColor,
        Ux4gInputFieldStatus.defaultStatus => isSelected
            ? (ux4gColors?.primary ?? materialTheme.colorScheme.primary)
            : onSurface.withValues(alpha: 0.38),
      };
    }

    final textStyle = (ux4gTypography?.bM_default ?? materialTheme.textTheme.bodyMedium ?? const TextStyle())
        .copyWith(
          color: isSelected
              ? (ux4gColors?.onSurface ?? materialTheme.colorScheme.onSurface)
              : onSurface.withValues(alpha: 0.38),
        );
    final iconColor = isSelected
        ? (ux4gColors?.primary ?? materialTheme.colorScheme.primary)
        : onSurface.withValues(alpha: 0.38);

    final bsStrong = (ux4gTypography?.bS_strong ??
            materialTheme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.bold,
            ) ??
            const TextStyle(fontWeight: FontWeight.bold));
    final bxsDefault = (ux4gTypography?.bXS_default ??
            materialTheme.textTheme.bodySmall ??
            const TextStyle());
    final labelColor =
        widget.enabled ? onBackground : onSurface.withValues(alpha: 0.38);

    Color descriptionColor;
    IconData statusIcon;
    switch (widget.status) {
      case Ux4gInputFieldStatus.error:
        descriptionColor = errorColor;
        statusIcon = Icons.error_outline;
      case Ux4gInputFieldStatus.warning:
        descriptionColor = warningColor;
        statusIcon = Icons.warning_amber_outlined;
      case Ux4gInputFieldStatus.success:
        descriptionColor = successColor;
        statusIcon = Icons.check_circle_outline;
      case Ux4gInputFieldStatus.defaultStatus:
        descriptionColor = onSurface.withValues(alpha: 0.6);
        statusIcon = Icons.info_outline;
    }

    Widget buildBox(String text) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: ux4gColors?.surface ?? materialTheme.colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(text, style: textStyle, overflow: TextOverflow.ellipsis)),
            const SizedBox(width: 8),
            Icon(Icons.calendar_today_outlined, size: 20, color: iconColor),
          ],
        ),
      );
    }

    Widget pickerWidget;
    if (widget.mode == Ux4gDatePickerMode.single) {
      pickerWidget = MouseRegion(
        cursor: widget.enabled ? SystemMouseCursors.click : SystemMouseCursors.forbidden,
        child: GestureDetector(
          onTap: _openPicker,
          child: buildBox(_getFormattedValue()),
        ),
      );
    } else {
      String startText = widget.placeholder;
      String endText = widget.placeholder;
      if (_selectedRange != null) {
        startText = _formatDate(_selectedRange!.start);
        endText = _formatDate(_selectedRange!.end);
      }
      pickerWidget = MouseRegion(
        cursor: widget.enabled ? SystemMouseCursors.click : SystemMouseCursors.forbidden,
        child: GestureDetector(
          onTap: _openPicker,
          child: Row(
            children: [
              Expanded(child: buildBox(startText)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text("-", style: textStyle),
              ),
              Expanded(child: buildBox(endText)),
            ],
          ),
        ),
      );
    }

    final mainWidget = (widget.label == null && widget.description == null)
        ? pickerWidget
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.label != null) ...[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(widget.label!, style: bsStrong.copyWith(color: labelColor)),
                    if (widget.isRequired) ...[
                      const SizedBox(width: 4),
                      Text("*", style: bsStrong.copyWith(color: errorColor)),
                    ],
                  ],
                ),
                const SizedBox(height: 8),
              ],
              pickerWidget,
              if (widget.description != null) ...[
                const SizedBox(height: 4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      statusIcon,
                      size: 14,
                      color: descriptionColor,
                    ),
                    const SizedBox(width: 6),
                    Flexible(
                      child: Text(
                        widget.description!,
                        style: bxsDefault.copyWith(color: descriptionColor),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          );

    return Semantics(
      button: true,
      enabled: widget.enabled,
      label: widget.semanticLabel ?? widget.label ?? 'Date picker',
      value: _getFormattedValue(),
      child: mainWidget,
    );
  }
}

class _Ux4gDatePickerDialog extends StatefulWidget {
  final Ux4gDatePickerMode mode;
  final DateTime? initialDate;
  final DateTimeRange? initialDateRange;
  final DateTime? minDate;
  final DateTime? maxDate;

  const _Ux4gDatePickerDialog({
    required this.mode,
    this.initialDate,
    this.initialDateRange,
    this.minDate,
    this.maxDate,
  });

  @override
  State<_Ux4gDatePickerDialog> createState() => _Ux4gDatePickerDialogState();
}

class _Ux4gDatePickerDialogState extends State<_Ux4gDatePickerDialog> {
  late DateTime _currentDisplayedMonth;
  DateTime? _tempSelectedDate;
  DateTime? _tempRangeStart;
  DateTime? _tempRangeEnd;

  bool _showMonthYearPicker = false;
  int _yearGridStart = 2020;

  final List<String> _weekdays = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];
  final List<String> _months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    if (widget.mode == Ux4gDatePickerMode.single) {
      _tempSelectedDate = widget.initialDate;
      _currentDisplayedMonth = widget.initialDate ?? now;
    } else {
      _tempRangeStart = widget.initialDateRange?.start;
      _tempRangeEnd = widget.initialDateRange?.end;
      _currentDisplayedMonth = widget.initialDateRange?.start ?? now;
    }
    _currentDisplayedMonth = DateTime(
      _currentDisplayedMonth.year,
      _currentDisplayedMonth.month,
    );
    _yearGridStart =
        _currentDisplayedMonth.year - (_currentDisplayedMonth.year % 8);
  }

  bool _isSelectable(DateTime date) {
    if (widget.minDate != null &&
        date.isBefore(
          DateTime(
            widget.minDate!.year,
            widget.minDate!.month,
            widget.minDate!.day,
          ),
        )) {
      return false;
    }
    if (widget.maxDate != null &&
        date.isAfter(
          DateTime(
            widget.maxDate!.year,
            widget.maxDate!.month,
            widget.maxDate!.day,
          ),
        )) {
      return false;
    }
    return true;
  }

  void _onConfirm() {
    if (widget.mode == Ux4gDatePickerMode.single) {
      if (_tempSelectedDate != null) {
        Navigator.pop(context, _tempSelectedDate);
      }
    } else {
      if (_tempRangeStart != null && _tempRangeEnd != null) {
        Navigator.pop(
          context,
          DateTimeRange(start: _tempRangeStart!, end: _tempRangeEnd!),
        );
      }
    }
  }

  void _onCancel() {
    Navigator.pop(context, null);
  }

  void _handleDaySelect(DateTime date) {
    if (!_isSelectable(date)) return;
    setState(() {
      if (widget.mode == Ux4gDatePickerMode.single) {
        _tempSelectedDate = date;
      } else {
        if (_tempRangeStart == null ||
            (_tempRangeStart != null && _tempRangeEnd != null)) {
          final now = DateTime.now();
          final today = DateTime(now.year, now.month, now.day);
          if (date.isAfter(today)) return; // Start date cannot be after today
          _tempRangeStart = date;
          _tempRangeEnd = null;
        } else {
          if (date.isBefore(_tempRangeStart!)) {
            final now = DateTime.now();
            final today = DateTime(now.year, now.month, now.day);
            if (date.isAfter(today)) return; // New start date cannot be after today
            _tempRangeEnd = _tempRangeStart;
            _tempRangeStart = date;
          } else {
            _tempRangeEnd = date;
          }
        }
      }
    });
  }

  void _changeMonth(int offset) {
    setState(() {
      _currentDisplayedMonth = DateTime(
        _currentDisplayedMonth.year,
        _currentDisplayedMonth.month + offset,
      );
    });
  }

  void _changeYearGrid(int offset) {
    setState(() {
      _yearGridStart += (8 * offset);
    });
  }

  String _getMonthName(int month) {
    const names = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return names[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    final materialTheme = Theme.of(context);
    final ux4gColors = materialTheme.extension<Ux4gThemeColors>();
    final ux4gTypography = materialTheme.extension<Ux4gTypography>();

    return Container(
      width: 320,
      decoration: BoxDecoration(
        color: ux4gColors?.surface ?? materialTheme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    if (_showMonthYearPicker) {
                      _changeYearGrid(-1);
                    } else {
                      _changeMonth(-1);
                    }
                  },
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _showMonthYearPicker = !_showMonthYearPicker;
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                        _showMonthYearPicker
                            ? '$_yearGridStart-${_yearGridStart + 7}'
                            : '${_getMonthName(_currentDisplayedMonth.month)} ${_currentDisplayedMonth.year}',
                        style:
                            (ux4gTypography?.bM_strong ??
                                    materialTheme.textTheme.bodyMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ) ??
                                    const TextStyle())
                                .copyWith(
                                  color:
                                      ux4gColors?.primary ??
                                      materialTheme.colorScheme.primary,
                                ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        _showMonthYearPicker
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color:
                            ux4gColors?.primary ??
                            materialTheme.colorScheme.primary,
                        size: 20,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () {
                    if (_showMonthYearPicker) {
                      _changeYearGrid(1);
                    } else {
                      _changeMonth(1);
                    }
                  },
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            color:
                (ux4gColors?.onSurface ?? materialTheme.colorScheme.onSurface)
                    .withValues(alpha: 0.12),
          ),

          // Body
          Container(
            padding: const EdgeInsets.all(16),
            height: 280, // Fixed height to prevent jumps
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: _showMonthYearPicker
                  ? _buildMonthYearPicker(
                      ux4gColors,
                      ux4gTypography,
                      materialTheme,
                    )
                  : _buildCalendarView(
                      ux4gColors,
                      ux4gTypography,
                      materialTheme,
                    ),
            ),
          ),

          Divider(
            height: 1,
            color:
                (ux4gColors?.onSurface ?? materialTheme.colorScheme.onSurface)
                    .withValues(alpha: 0.12),
          ),

          // Footer
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Ux4gButton(
                    text: 'Cancel',
                    variant: Ux4gButtonVariant.outline,
                    onPressed: _onCancel,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Ux4gButton(
                    text: _showMonthYearPicker ? 'Select date' : 'Confirm',
                    variant: Ux4gButtonVariant.primary,
                    onPressed: _showMonthYearPicker
                        ? () {
                            setState(() {
                              _showMonthYearPicker = false;
                            });
                          }
                        : _onConfirm,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMonthYearPicker(
    Ux4gThemeColors? colors,
    Ux4gTypography? typography,
    ThemeData materialTheme,
  ) {
    return Column(
      key: const ValueKey('MonthYearPicker'),
      children: [
        // Year Grid
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: 8,
          itemBuilder: (context, index) {
            final year = _yearGridStart + index;
            final isSelected = year == _currentDisplayedMonth.year;
            final isSelectable = widget.maxDate == null ||
                year <= widget.maxDate!.year;
            final resolvedPrimary =
                colors?.primary ?? materialTheme.colorScheme.primary;
            final resolvedOnSurface =
                colors?.onSurface ?? materialTheme.colorScheme.onSurface;
            return GestureDetector(
              onTap: isSelectable
                  ? () {
                      setState(() {
                        _currentDisplayedMonth = DateTime(
                          year,
                          _currentDisplayedMonth.month,
                        );
                      });
                    }
                  : null,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected
                      ? resolvedPrimary.withValues(alpha: 0.2)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  year.toString(),
                  style:
                      (typography?.bM_default ??
                              materialTheme.textTheme.bodyMedium ??
                              const TextStyle())
                          .copyWith(
                            color: isSelected
                                ? resolvedPrimary
                                : isSelectable
                                    ? resolvedOnSurface
                                    : resolvedOnSurface.withValues(
                                        alpha: 0.38,
                                      ),
                          ),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 16),
        Divider(
          height: 1,
          color: (colors?.onSurface ?? materialTheme.colorScheme.onSurface)
              .withValues(alpha: 0.12),
        ),

        // Month Grid
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: 12,
          itemBuilder: (context, index) {
            final month = index + 1;
            final isSelected = month == _currentDisplayedMonth.month;
            final isSelectable = widget.maxDate == null ||
                _currentDisplayedMonth.year < widget.maxDate!.year ||
                (_currentDisplayedMonth.year == widget.maxDate!.year &&
                    month <= widget.maxDate!.month);
            final resolvedPrimary =
                colors?.primary ?? materialTheme.colorScheme.primary;
            final resolvedOnSurface =
                colors?.onSurface ?? materialTheme.colorScheme.onSurface;
            return GestureDetector(
              onTap: isSelectable
                  ? () {
                      setState(() {
                        _currentDisplayedMonth = DateTime(
                          _currentDisplayedMonth.year,
                          month,
                        );
                      });
                    }
                  : null,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected
                      ? resolvedPrimary.withValues(alpha: 0.2)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  _months[index],
                  style:
                      (typography?.bM_default ??
                              materialTheme.textTheme.bodyMedium ??
                              const TextStyle())
                          .copyWith(
                            color: isSelected
                                ? resolvedPrimary
                                : isSelectable
                                    ? resolvedOnSurface
                                    : resolvedOnSurface.withValues(
                                        alpha: 0.38,
                                      ),
                          ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildCalendarView(
    Ux4gThemeColors? colors,
    Ux4gTypography? typography,
    ThemeData materialTheme,
  ) {
    final now = DateTime.now();
    final firstDayOfMonth = DateTime(
      _currentDisplayedMonth.year,
      _currentDisplayedMonth.month,
      1,
    );
    final lastDayOfMonth = DateTime(
      _currentDisplayedMonth.year,
      _currentDisplayedMonth.month + 1,
      0,
    );

    // Calculate leading empty days (1 = Monday, 7 = Sunday)
    int leadingDays = firstDayOfMonth.weekday - 1;

    final daysInMonth = lastDayOfMonth.day;
    final totalCells = leadingDays + daysInMonth;
    final rows = (totalCells / 7).ceil();

    return Column(
      key: const ValueKey('Calendar'),
      children: [
        // Weekdays Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _weekdays
              .map(
                (d) => Expanded(
                  child: Center(
                    child: Text(
                      d,
                      style:
                          (typography?.bS_strong ??
                                  materialTheme.textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ) ??
                                  const TextStyle())
                              .copyWith(
                                color:
                                    colors?.onSurface ??
                                    materialTheme.colorScheme.onSurface,
                              ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 8),
        // Days Grid
        Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1,
              crossAxisSpacing: 0,
              mainAxisSpacing: 4,
            ),
            itemCount: rows * 7,
            itemBuilder: (context, index) {
              if (index < leadingDays || index >= leadingDays + daysInMonth) {
                return const SizedBox.shrink();
              }
              final day = index - leadingDays + 1;
              final date = DateTime(
                _currentDisplayedMonth.year,
                _currentDisplayedMonth.month,
                day,
              );

              final isToday =
                  date.year == now.year &&
                  date.month == now.month &&
                  date.day == now.day;
              final isSelectable = _isSelectable(date);

              bool isSelectedSingle = false;
              bool isRangeStart = false;
              bool isRangeEnd = false;
              bool isInRange = false;

              if (widget.mode == Ux4gDatePickerMode.single) {
                isSelectedSingle =
                    _tempSelectedDate?.year == date.year &&
                    _tempSelectedDate?.month == date.month &&
                    _tempSelectedDate?.day == date.day;
              } else {
                if (_tempRangeStart != null &&
                    date.year == _tempRangeStart!.year &&
                    date.month == _tempRangeStart!.month &&
                    date.day == _tempRangeStart!.day) {
                  isRangeStart = true;
                }
                if (_tempRangeEnd != null &&
                    date.year == _tempRangeEnd!.year &&
                    date.month == _tempRangeEnd!.month &&
                    date.day == _tempRangeEnd!.day) {
                  isRangeEnd = true;
                }
                if (_tempRangeStart != null &&
                    _tempRangeEnd != null &&
                    date.isAfter(_tempRangeStart!) &&
                    date.isBefore(_tempRangeEnd!)) {
                  isInRange = true;
                }
              }

              final resolvedPrimary =
                  colors?.primary ?? materialTheme.colorScheme.primary;
              final resolvedOnSurface =
                  colors?.onSurface ?? materialTheme.colorScheme.onSurface;

              final isSolidPurple =
                  isSelectedSingle || isRangeStart || isRangeEnd;
              final isLightPurple = isInRange;

              return GestureDetector(
                onTap: isSelectable ? () => _handleDaySelect(date) : null,
                child: Container(
                  decoration: BoxDecoration(
                    color: isSolidPurple
                        ? resolvedPrimary
                        : (isLightPurple
                              ? resolvedPrimary.withValues(alpha: 0.1)
                              : Colors.transparent),
                    borderRadius: isSolidPurple
                        ? BorderRadius.circular(4)
                        : (isRangeStart
                              ? const BorderRadius.horizontal(
                                  left: Radius.circular(4),
                                )
                              : (isRangeEnd
                                    ? const BorderRadius.horizontal(
                                        right: Radius.circular(4),
                                      )
                                    : BorderRadius.zero)),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          day.toString(),
                          style:
                              (typography?.bM_default ??
                                      materialTheme.textTheme.bodyMedium ??
                                      const TextStyle())
                                  .copyWith(
                                    color: isSolidPurple
                                        ? (colors?.onPrimary ??
                                              materialTheme
                                                  .colorScheme
                                                  .onPrimary)
                                        : (isSelectable
                                              ? resolvedOnSurface
                                              : resolvedOnSurface.withValues(
                                                  alpha: 0.38,
                                                )),
                                  ),
                        ),
                        if (isToday && !isSolidPurple)
                          Container(
                            margin: const EdgeInsets.only(top: 2),
                            width: 4,
                            height: 4,
                            decoration: BoxDecoration(
                              color: resolvedPrimary,
                              shape: BoxShape.circle,
                            ),
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
}
