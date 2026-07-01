import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import '../widgets/component_docs.dart';

const _nationalEmblemPath = Ux4gIcons.nationalEmblem;
const _unionLogoPath = Ux4gIcons.union;
const _digitalIndiaLogoPath = Ux4gIcons.digitalIndiaLogoPng;

bool _isDark(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark;

Color _getBorder(BuildContext context) =>
    _isDark(context) ? Ux4gPalette.neutral600 : Ux4gPalette.neutral300;

Color _getMutedText(BuildContext context) =>
    _isDark(context) ? Ux4gPalette.neutral400 : Ux4gPalette.neutral500;

class _BrandHeader extends StatelessWidget {
  const _BrandHeader();

  @override
  Widget build(BuildContext context) {
    final isDark = _isDark(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Ux4gAppHeader(
          variant: Ux4gAppHeaderVariant.light,
          title: '',
          leadingWidgets: [
            SvgPicture.asset(
              _nationalEmblemPath,
              height: 32,
              colorFilter: isDark
                  ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
                  : null,
            ),
            SizedBox(
              height: 28,
              child: Ux4gDivider(
                orientation: Ux4gDividerOrientation.vertical,
                color: isDark
                    ? Ux4gPalette.neutral700
                    : Ux4gPalette.neutral300,
              ),
            ),
            SvgPicture.asset(
              _unionLogoPath,
              height: 32,
              colorFilter: ColorFilter.mode(
                isDark
                    ? Ux4gPalette.primary300
                    : Ux4gPalette.primary600,
                BlendMode.srcIn,
              ),
            ),
          ],
          horizontalPadding: 16,
          leadingSpacing: 8,
          actions: [
            Ux4gAppHeaderAction(
              customWidget: SizedBox(
                width: 40,
                height: 40,
                child: Material(
                  color: isDark
                      ? Ux4gPalette.neutral800
                      : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {},
                    child: Ink(
                      decoration: BoxDecoration(
                        color: isDark
                            ? Ux4gPalette.neutral800
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: isDark
                              ? Ux4gPalette.primary600
                              : Ux4gPalette.primary300,
                          width: 1.5,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.menu,
                          size: 20,
                          color: isDark
                              ? Ux4gPalette.primary300
                              : Ux4gPalette.primary600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Ux4gDivider(color: _getBorder(context)),
      ],
    );
  }
}

class _BrandFooter extends StatelessWidget {
  const _BrandFooter();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Powered by -',
            style: TextStyle(
              fontSize: 11,
              color: _getMutedText(context),
            ),
          ),
          const SizedBox(height: 6),
          Image.asset(
            _digitalIndiaLogoPath,
            height: 22,
            color: _isDark(context) ? Colors.white : null,
          ),
        ],
      ),
    );
  }
}

class _PhoneFrame extends StatelessWidget {
  const _PhoneFrame({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 360,
        height: 760,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: _isDark(context)
              ? Ux4gPalette.neutral950
              : Ux4gPalette.neutral50,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: _getBorder(context)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 24,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: SafeArea(child: child),
      ),
    );
  }
}

class _ServiceCategoryModel {
  final String name;
  final String summary;
  final List<_ServiceNotifItem> items;
  bool expanded;
  _ServiceCategoryModel(this.name, this.summary, this.items, {this.expanded = false});
}

class _ServiceNotifItem {
  final String label;
  final String? subtitle;
  bool enabled;
  _ServiceNotifItem(this.label, {this.subtitle, this.enabled = true});
}

class _NotifPrefMasterScreen extends StatefulWidget {
  final int initialTabIndex;
  const _NotifPrefMasterScreen({this.initialTabIndex = 0});

  @override
  State<_NotifPrefMasterScreen> createState() => _NotifPrefMasterScreenState();
}

class _NotifPrefMasterScreenState extends State<_NotifPrefMasterScreen> {
  late int _tabIndex;
  bool _sms = true;
  bool _email = true;
  bool _app = true;
  bool _whatsapp = false;
  String _frequency = 'Immediately';
  bool _whatsappConsented = false;

  late List<_ServiceCategoryModel> _services;


  @override
  void initState() {
    super.initState();
    _tabIndex = widget.initialTabIndex;
    _services = [
      _ServiceCategoryModel('Income Certificate', '3 of 3 notifications on', [
        _ServiceNotifItem('Status updates', subtitle: 'When your application changes stage'),
        _ServiceNotifItem('Action reminders', subtitle: 'When you need to upload or pay'),
        _ServiceNotifItem('Certificate expiry', subtitle: 'Renewal reminders before expiry'),
      ], expanded: true),
      _ServiceCategoryModel('Ration Card Renewal', '2 of 3 notifications on', [
        _ServiceNotifItem('Status updates', subtitle: 'When your application changes stage'),
        _ServiceNotifItem('Action reminders', subtitle: 'When you need to upload or pay'),
        _ServiceNotifItem('Certificate expiry', subtitle: 'Renewal reminders before expiry', enabled: false),
      ]),
      _ServiceCategoryModel('PAN Correction', '3 of 3 notifications on', [
        _ServiceNotifItem('Status updates', subtitle: 'When your application changes stage'),
        _ServiceNotifItem('Action reminders', subtitle: 'When you need to upload or pay'),
        _ServiceNotifItem('Certificate expiry', subtitle: 'Renewal reminders before expiry'),
      ]),
      _ServiceCategoryModel('Birth Certificate', 'All notifications off', [
        _ServiceNotifItem('Status updates', subtitle: 'When your application changes stage', enabled: false),
        _ServiceNotifItem('Action reminders', subtitle: 'When you need to upload or pay', enabled: false),
        _ServiceNotifItem('Certificate expiry', subtitle: 'Renewal reminders before expiry', enabled: false),
      ]),
    ];

  }

  @override
  Widget build(BuildContext context) {
    final isDark = _isDark(context);
    return _PhoneFrame(
      child: Column(
        children: [
          _buildHeader(context, isDark),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 16),
              child: _buildBody(context, isDark),
            ),
          ),
          const _BrandFooter(),
        ],
      ),
    );
  }

  static const _chipOptions = [
    'Notification channels',
    'Update Frequency',
    'Per Service Preferences',
    'Mandatory Notification',
    'WhatsApp notification',
    'Manage all Subscriptions',
  ];

  Widget _buildHeader(BuildContext context, bool isDark) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _BrandHeader(),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
          child: Text(
            'Notification Preferences',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: isDark ? Colors.white : const Color(0xFF111827),
              letterSpacing: -0.2,
            ),
          ),
        ),
        ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
              PointerDeviceKind.trackpad,
            },
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: _chipOptions.asMap().entries.map((entry) {
                final idx = entry.key;
                final label = entry.value;
                return Padding(
                  padding: EdgeInsets.only(right: idx == _chipOptions.length - 1 ? 0 : 8),
                  child: _buildTabButton(label, idx, isDark),
                );
              }).toList(),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildTabButton(String label, int targetIndex, bool isDark) {
    final active = _tabIndex == targetIndex;
    final selectedBg = isDark ? Ux4gPalette.primary300 : Ux4gPalette.primary600;
    final selectedText = isDark ? Ux4gPalette.gray900 : Colors.white;
    return GestureDetector(
      onTap: () => setState(() => _tabIndex = targetIndex),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: active
              ? selectedBg
              : (isDark ? const Color(0xFF1E1E1E) : Colors.white),
          borderRadius: BorderRadius.circular(6),
          border: active
              ? null
              : Border.all(
                  color: isDark
                      ? const Color(0xFF333333)
                      : const Color(0xFFE5E7EB),
                ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: active ? FontWeight.w600 : FontWeight.w500,
            color: active
                ? selectedText
                : (isDark ? const Color(0xFFD1D5DB) : const Color(0xFF1F2937)),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, bool isDark) {
    switch (_tabIndex) {
      case 0:
        return _buildChannelsCard(isDark);
      case 1:
        return _buildFrequencyCard(isDark);
      case 2:
        return _buildPerServiceList(isDark, _services);
      case 3:
        return _buildLockedView(isDark);
      case 4:
        return _buildWhatsAppView(isDark);
      case 5:
        return _buildManageAllView(isDark);
      default:
        return _buildChannelsCard(isDark);
    }
  }

  Widget _buildChannelsCard(bool isDark) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1A1A) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? Ux4gPalette.neutral600 : Ux4gPalette.neutral300,
        ),
      ),
      child: Column(
        children: [
          _buildChannelRow('SMS', '+91 98765 43210', _sms, (v) => setState(() => _sms = v), isDark),
          _buildDivider(isDark),
          _buildChannelRow('Email', 'r•••••h@gmail.com', _email, (v) => setState(() => _email = v), isDark),
          _buildDivider(isDark),
          _buildChannelRow('App notifications', 'Push alerts on this device', _app, (v) => setState(() => _app = v), isDark),
          _buildDivider(isDark),
          _buildChannelRow('WhatsApp', 'Opt-in required', _whatsapp, (v) => setState(() => _whatsapp = v), isDark),
        ],
      ),
    );
  }

  Widget _buildChannelRow(String title, String subtitle, bool value, ValueChanged<bool> onChanged, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
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
                    color: isDark ? Colors.white : const Color(0xFF111827),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563),
                  ),
                ),
              ],
            ),
          ),
          Ux4gToggle(
            checked: value,
            onCheckedChange: onChanged,
            labelPosition: Ux4gToggleLabelPosition.noLabel,
          ),
        ],
      ),
    );
  }

  Widget _buildDivider(bool isDark) => Divider(
    height: 1,
    thickness: 1,
    color: isDark ? Ux4gPalette.neutral600 : Ux4gPalette.neutral300,
  );

  Widget _buildFrequencyCard(bool isDark) {
    final primary = isDark ? Ux4gPalette.primary300 : Ux4gPalette.primary600;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1A1A) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? Ux4gPalette.neutral600 : Ux4gPalette.neutral300,
        ),
      ),
      child: Column(
        children: [
          _buildFreqRow('Immediately', 'Get each notification the moment it arrives.', isDark, primary),
          const SizedBox(height: 10),
          _buildFreqRow('Daily Summary', 'One digest every day at 6:00 PM.', isDark, primary),
          const SizedBox(height: 10),
          _buildFreqRow('Weekly Digest', 'A round-up every Monday morning.', isDark, primary),
        ],
      ),
    );
  }

  Widget _buildFreqRow(String title, String subtitle, bool isDark, Color primary) {
    final sel = _frequency == title;
    final bg = sel
        ? (isDark ? primary.withValues(alpha: 0.15) : primary.withValues(alpha: 0.08))
        : (isDark ? const Color(0xFF262626) : const Color(0xFFF3F4F6));
    return InkWell(
      onTap: () => setState(() => _frequency = title),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Ux4gRadioButton<String>(
              value: title,
              groupValue: _frequency,
              onChanged: (v) => setState(() => _frequency = title),
              color: primary,
              size: Ux4gRadioButtonSize.medium,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: sel ? primary : (isDark ? Colors.white : const Color(0xFF111827)),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 11,
                      color: sel
                          ? primary.withValues(alpha: 0.8)
                          : (isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280)),
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

  Widget _buildPerServiceList(bool isDark, List<_ServiceCategoryModel> list) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1A1A) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isDark ? Ux4gPalette.neutral600 : Ux4gPalette.neutral300),
      ),
      child: Column(
        children: list.asMap().entries.map((entry) {
          final idx = entry.key;
          final cat = entry.value;
          return Container(
            margin: idx == list.length - 1 ? EdgeInsets.zero : const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF1A1A1A) : Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: isDark ? Ux4gPalette.neutral600 : Ux4gPalette.neutral300),
            ),
            child: Column(
              children: [
                InkWell(
                  borderRadius: cat.expanded ? const BorderRadius.vertical(top: Radius.circular(9)) : BorderRadius.circular(9),
                  onTap: () => setState(() => cat.expanded = !cat.expanded),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    decoration: BoxDecoration(
                      color: cat.expanded ? (isDark ? const Color(0xFF262626) : const Color(0xFFF3F4F6)) : Colors.transparent,
                      borderRadius: cat.expanded ? const BorderRadius.vertical(top: Radius.circular(9)) : BorderRadius.circular(9),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(cat.name, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: isDark ? Colors.white : const Color(0xFF111827))),
                              const SizedBox(height: 2),
                              Text(cat.summary, style: TextStyle(fontSize: 11, color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280))),
                            ],
                          ),
                        ),
                        Icon(cat.expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, color: isDark ? Colors.white : const Color(0xFF111827), size: 20),
                      ],
                    ),
                  ),
                ),
                if (cat.expanded) ...[
                  Divider(height: 1, color: isDark ? Ux4gPalette.neutral600 : Ux4gPalette.neutral300),
                  ...cat.items.asMap().entries.map((itemEntry) {
                    final iIdx = itemEntry.key;
                    final item = itemEntry.value;
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(item.label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: isDark ? Colors.white : const Color(0xFF111827))),
                                    if (item.subtitle != null) ...[
                                      const SizedBox(height: 2),
                                      Text(item.subtitle!, style: TextStyle(fontSize: 11, color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280))),
                                    ],
                                  ],
                                ),
                              ),
                              Ux4gToggle(
                                checked: item.enabled,
                                onCheckedChange: (v) => setState(() => item.enabled = v),
                                labelPosition: Ux4gToggleLabelPosition.noLabel,
                              ),
                            ],
                          ),
                        ),
                        if (iIdx < cat.items.length - 1)
                          Divider(height: 1, color: isDark ? Ux4gPalette.neutral600 : Ux4gPalette.neutral300),
                      ],
                    );
                  }),
                ],
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildLockedView(bool isDark) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1A1A) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isDark ? Ux4gPalette.neutral600 : Ux4gPalette.neutral300),
      ),
      child: Column(
        children: [
          _buildMandatoryItem('SLA breach alerts', 'Sent when an application crosses its service guarantee deadline.', isDark),
          Divider(height: 1, color: isDark ? Ux4gPalette.neutral600 : Ux4gPalette.neutral300),
          _buildMandatoryItem('Rejection notices', 'Sent if an application is rejected, with the reason and next steps.', isDark),
          Divider(height: 1, color: isDark ? Ux4gPalette.neutral600 : Ux4gPalette.neutral300),
          _buildMandatoryItem('Legal & payment deadlines', 'Sent for statutory deadlines and fee payment due dates.', isDark),
        ],
      ),
    );
  }

  Widget _buildMandatoryItem(String title, String subtitle, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 8,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: isDark ? Colors.white : const Color(0xFF111827),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: isDark ? const Color(0xFF262626) : const Color(0xFFF3F4F6),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'Locked',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 11,
                    color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Ux4gToggle(
            checked: true,
            enabled: false,
            onCheckedChange: (_) {},
            labelPosition: Ux4gToggleLabelPosition.noLabel,
          ),
        ],
      ),
    );
  }

  Widget _buildWhatsAppView(bool isDark) {
    final primary = isDark ? Ux4gPalette.primary300 : Ux4gPalette.primary600;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1A1A) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isDark ? Ux4gPalette.neutral600 : Ux4gPalette.neutral300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark ? Ux4gPalette.green800 : Ux4gPalette.green100,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: isDark ? Ux4gPalette.green600 : Ux4gPalette.green300),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'What you will receive on WhatsApp:',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: isDark ? const Color(0xFFECFDF5) : const Color(0xFF111827),
                  ),
                ),
                const SizedBox(height: 12),
                _buildBenefitRow('Application status changes', isDark),
                _buildBenefitRow('Appointment reminders (D-1 and H-1)', isDark),
                _buildBenefitRow('Action-required alerts with quick links', isDark),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Ux4gCheckbox(
            value: _whatsappConsented,
            onChanged: (v) => setState(() => _whatsappConsented = v ?? false),
            label: 'I consent to receiving notifications on WhatsApp at +91 98765 43210.',
            isRequired: true,
            description: 'You can withdraw this consent at any time. This checkbox is never pre-ticked (DPDP Act 2023).',
          ),
          const SizedBox(height: 20),
          Ux4gButton(
            text: 'Enable WhatsApp notifications',
            onPressed: _whatsappConsented ? () => setState(() {
              _whatsapp = true;
              _tabIndex = 0;
            }) : null,
            width: double.infinity,
            height: 48,
            backgroundColor: primary,
            contentColor: Colors.white,
            disabledBackgroundColor: isDark ? Ux4gPalette.primary600.withValues(alpha: 0.4) : Ux4gPalette.primary300,
            disabledContentColor: Colors.white,
            borderRadius: 8,
          ),
        ],
      ),
    );
  }

  Widget _buildBenefitRow(String text, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check, size: 16, color: isDark ? const Color(0xFFECFDF5) : const Color(0xFF111827)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 12,
                color: isDark ? const Color(0xFFECFDF5) : const Color(0xFF111827),
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildManageAllView(bool isDark) {
    final primary = isDark ? Ux4gPalette.primary300 : Ux4gPalette.primary600;
    final dividerColor = isDark ? Ux4gPalette.neutral600 : Ux4gPalette.neutral300;
    final headerStyle = TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w700,
      color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563),
      letterSpacing: 0.5,
    );

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1A1A) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8, left: 4),
            child: Text('OPTIONAL — YOU CAN TURN OFF', style: headerStyle),
          ),
          _buildManageRow('Status updates', 'Stage changes across all your applications', true, isDark, primary),
          Divider(height: 1, color: dividerColor),
          _buildManageRow('Action reminders', 'Upload and payment reminders', true, isDark, primary),
          Divider(height: 1, color: dividerColor),
          _buildManageRow('Certificate expiry', 'Renewal reminders before documents expire', true, isDark, primary),
          Divider(height: 1, color: dividerColor),
          _buildManageRow('Promotional updates', 'New services and scheme announcements', true, isDark, primary),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.only(bottom: 8, left: 4),
            child: Text('MANDATORY — REQUIRED BY GOVERNMENT POLICY', style: headerStyle),
          ),
          _buildManageRow('SLA breach alerts', 'Service guarantee deadline notifications', false, isDark, primary),
          Divider(height: 1, color: dividerColor),
          _buildManageRow('Rejection notices', 'Application rejection with reasons', false, isDark, primary),
          const SizedBox(height: 20),
          Ux4gButton(
            text: 'Turn off all optional notifications',
            onPressed: () {},
            variant: Ux4gButtonVariant.outline,
            width: double.infinity,
            height: 48,
            borderColor: const Color(0xFFEF4444),
            contentColor: isDark ? const Color(0xFFF87171) : const Color(0xFF991B1B),
            backgroundColor: isDark ? const Color(0xFF2C0B0E) : const Color(0xFFFEF2F2),
            borderRadius: 8,
          ),
        ],
      ),
    );
  }

  Widget _buildManageRow(String title, String subtitle, bool optional, bool isDark, Color primary) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: isDark ? Colors.white : const Color(0xFF111827))),
                const SizedBox(height: 3),
                Text(subtitle, style: TextStyle(fontSize: 11, color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280))),
              ],
            ),
          ),
          const SizedBox(width: 12),
          if (optional)
            Ux4gToggle(checked: true, onCheckedChange: (_) {}, labelPosition: Ux4gToggleLabelPosition.noLabel)
          else
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF262626) : const Color(0xFFE5E7EB),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'Always on',
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: isDark ? const Color(0xFFE5E7EB) : const Color(0xFF111827)),
              ),
            ),
        ],
      ),
    );
  }
}

const _masterNotificationPreferencesCode = r'''
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';

// Copy this complete working code to use Notification Preferences in your Flutter application!

bool _isDark(BuildContext context) => Theme.of(context).brightness == Brightness.dark;
Color _getBorder(BuildContext context) => _isDark(context) ? Ux4gPalette.neutral600 : Ux4gPalette.neutral300;
Color _getMutedText(BuildContext context) => _isDark(context) ? Ux4gPalette.neutral400 : Ux4gPalette.neutral500;

class BrandHeader extends StatelessWidget {
  const BrandHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = _isDark(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Ux4gAppHeader(
          variant: Ux4gAppHeaderVariant.light,
          title: '',
          leadingWidgets: [
            SvgPicture.asset(
              Ux4gIcons.nationalEmblem,
              height: 32,
              colorFilter: isDark ? const ColorFilter.mode(Colors.white, BlendMode.srcIn) : null,
            ),
            SizedBox(
              height: 28,
              child: Ux4gDivider(
                orientation: Ux4gDividerOrientation.vertical,
                color: isDark ? Ux4gPalette.neutral700 : Ux4gPalette.neutral300,
              ),
            ),
            SvgPicture.asset(
              Ux4gIcons.union,
              height: 32,
              colorFilter: ColorFilter.mode(
                isDark ? Ux4gPalette.primary300 : Ux4gPalette.primary600,
                BlendMode.srcIn,
              ),
            ),
          ],
          horizontalPadding: 16,
          leadingSpacing: 8,
          actions: [
            Ux4gAppHeaderAction(
              customWidget: SizedBox(
                width: 40,
                height: 40,
                child: Material(
                  color: isDark ? Ux4gPalette.neutral800 : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {},
                    child: Center(
                      child: Icon(
                        Icons.menu,
                        size: 20,
                        color: isDark ? Ux4gPalette.primary300 : Ux4gPalette.primary600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Ux4gDivider(color: _getBorder(context)),
      ],
    );
  }
}

class BrandFooter extends StatelessWidget {
  const BrandFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Powered by -', style: TextStyle(fontSize: 11, color: _getMutedText(context))),
          const SizedBox(height: 6),
          Image.asset(Ux4gIcons.digitalIndiaLogoPng, height: 22, color: _isDark(context) ? Colors.white : null),
        ],
      ),
    );
  }
}

class PhoneFrame extends StatelessWidget {
  const PhoneFrame({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 360,
        height: 760,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: _isDark(context) ? Ux4gPalette.neutral950 : Ux4gPalette.neutral50,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: _getBorder(context)),
        ),
        child: SafeArea(child: child),
      ),
    );
  }
}

class ServiceCategoryModel {
  final String name;
  final String summary;
  final List<ServiceNotifItem> items;
  bool expanded;
  ServiceCategoryModel(this.name, this.summary, this.items, {this.expanded = false});
}

class ServiceNotifItem {
  final String label;
  final String? subtitle;
  bool enabled;
  ServiceNotifItem(this.label, {this.subtitle, this.enabled = true});
}

class Ux4gNotificationPreferencesScreen extends StatefulWidget {
  final int initialTabIndex;
  const Ux4gNotificationPreferencesScreen({super.key, this.initialTabIndex = 0});

  @override
  State<Ux4gNotificationPreferencesScreen> createState() => _Ux4gNotificationPreferencesScreenState();
}

class _Ux4gNotificationPreferencesScreenState extends State<Ux4gNotificationPreferencesScreen> {
  late int _tabIndex;
  bool _sms = true;
  bool _email = true;
  bool _app = true;
  bool _whatsapp = false;
  String _frequency = 'Immediately';
  bool _whatsappConsented = false;

  late List<ServiceCategoryModel> _services;


  static const _chipOptions = [
    'Notification channels',
    'Update Frequency',
    'Per Service Preferences',
    'Mandatory Notification',
    'WhatsApp notification',
    'Manage all Subscriptions',
  ];

  @override
  void initState() {
    super.initState();
    _tabIndex = widget.initialTabIndex;
    _services = [
      ServiceCategoryModel('Income Certificate', '3 of 3 notifications on', [
        ServiceNotifItem('Status updates', subtitle: 'When your application changes stage'),
        ServiceNotifItem('Action reminders', subtitle: 'When you need to upload or pay'),
        ServiceNotifItem('Certificate expiry', subtitle: 'Renewal reminders before expiry'),
      ], expanded: true),
      ServiceCategoryModel('Ration Card Renewal', '2 of 3 notifications on', [
        ServiceNotifItem('Status updates', subtitle: 'When your application changes stage'),
        ServiceNotifItem('Action reminders', subtitle: 'When you need to upload or pay'),
        ServiceNotifItem('Certificate expiry', subtitle: 'Renewal reminders before expiry', enabled: false),
      ]),
      ServiceCategoryModel('PAN Correction', '3 of 3 notifications on', [
        ServiceNotifItem('Status updates', subtitle: 'When your application changes stage'),
        ServiceNotifItem('Action reminders', subtitle: 'When you need to upload or pay'),
        ServiceNotifItem('Certificate expiry', subtitle: 'Renewal reminders before expiry'),
      ]),
      ServiceCategoryModel('Birth Certificate', 'All notifications off', [
        ServiceNotifItem('Status updates', subtitle: 'When your application changes stage', enabled: false),
        ServiceNotifItem('Action reminders', subtitle: 'When you need to upload or pay', enabled: false),
        ServiceNotifItem('Certificate expiry', subtitle: 'Renewal reminders before expiry', enabled: false),
      ]),
    ];

  }

  @override
  Widget build(BuildContext context) {
    final isDark = _isDark(context);
    return PhoneFrame(
      child: Column(
        children: [
          _buildHeader(context, isDark),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 16),
              child: _buildBody(context, isDark),
            ),
          ),
          const BrandFooter(),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isDark) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BrandHeader(),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
          child: Text(
            'Notification Preferences',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: isDark ? Colors.white : const Color(0xFF111827),
            ),
          ),
        ),
        ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch, PointerDeviceKind.trackpad},
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: _chipOptions.asMap().entries.map((entry) {
                final idx = entry.key;
                final label = entry.value;
                return Padding(
                  padding: EdgeInsets.only(right: idx == _chipOptions.length - 1 ? 0 : 8),
                  child: _buildTabButton(label, idx, isDark),
                );
              }).toList(),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildTabButton(String label, int targetIndex, bool isDark) {
    final active = _tabIndex == targetIndex;
    final selectedBg = isDark ? Ux4gPalette.primary300 : Ux4gPalette.primary600;
    final selectedText = isDark ? Ux4gPalette.gray900 : Colors.white;
    return GestureDetector(
      onTap: () => setState(() => _tabIndex = targetIndex),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: active ? selectedBg : (isDark ? const Color(0xFF1E1E1E) : Colors.white),
          borderRadius: BorderRadius.circular(6),
          border: active ? null : Border.all(color: isDark ? Ux4gPalette.neutral600 : Ux4gPalette.neutral300),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: active ? FontWeight.w600 : FontWeight.w500,
            color: active ? selectedText : (isDark ? const Color(0xFFD1D5DB) : const Color(0xFF1F2937)),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, bool isDark) {
    switch (_tabIndex) {
      case 1: return _buildFrequencyCard(isDark);
      case 2: return _buildPerServiceList(isDark, _services);
      case 3: return _buildLockedView(isDark);
      case 4: return _buildWhatsAppView(isDark);
      case 5: return _buildManageAllView(isDark);
      case 0: default: return _buildChannelsCard(isDark);
    }
  }

  Widget _buildChannelsCard(bool isDark) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1A1A) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isDark ? Ux4gPalette.neutral600 : Ux4gPalette.neutral300),
      ),
      child: Column(
        children: [
          _buildChannelRow('SMS', '+91 98765 43210', _sms, (v) => setState(() => _sms = v), isDark),
          _buildDivider(isDark),
          _buildChannelRow('Email', 'user@gmail.com', _email, (v) => setState(() => _email = v), isDark),
          _buildDivider(isDark),
          _buildChannelRow('App notifications', 'Push alerts on this device', _app, (v) => setState(() => _app = v), isDark),
          _buildDivider(isDark),
          _buildChannelRow('WhatsApp', 'Opt-in required', _whatsapp, (v) => setState(() => _whatsapp = v), isDark),
        ],
      ),
    );
  }

  Widget _buildChannelRow(String title, String subtitle, bool value, ValueChanged<bool> onChanged, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: isDark ? Colors.white : const Color(0xFF111827))),
                const SizedBox(height: 2),
                Text(subtitle, style: TextStyle(fontSize: 12, color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563))),
              ],
            ),
          ),
          Ux4gToggle(
            checked: value, onCheckedChange: onChanged,
            labelPosition: Ux4gToggleLabelPosition.noLabel,
          ),
        ],
      ),
    );
  }

  Widget _buildDivider(bool isDark) => Divider(height: 1, thickness: 1, color: isDark ? Ux4gPalette.neutral600 : Ux4gPalette.neutral300);

  Widget _buildFrequencyCard(bool isDark) {
    final primary = isDark ? Ux4gPalette.primary300 : Ux4gPalette.primary600;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1A1A) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isDark ? Ux4gPalette.neutral600 : Ux4gPalette.neutral300),
      ),
      child: Column(
        children: [
          _buildFreqRow('Immediately', 'Get each notification the moment it arrives.', isDark, primary),
          const SizedBox(height: 10),
          _buildFreqRow('Daily Summary', 'One digest every day at 6:00 PM.', isDark, primary),
          const SizedBox(height: 10),
          _buildFreqRow('Weekly Digest', 'A round-up every Monday morning.', isDark, primary),
        ],
      ),
    );
  }

  Widget _buildFreqRow(String title, String subtitle, bool isDark, Color primary) {
    final sel = _frequency == title;
    final bg = sel ? (isDark ? primary.withValues(alpha: 0.15) : primary.withValues(alpha: 0.08)) : (isDark ? const Color(0xFF262626) : const Color(0xFFF3F4F6));
    return InkWell(
      onTap: () => setState(() => _frequency = title),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Ux4gRadioButton<String>(value: title, groupValue: _frequency, onChanged: (v) => setState(() => _frequency = title), color: primary, size: Ux4gRadioButtonSize.medium),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: sel ? primary : (isDark ? Colors.white : const Color(0xFF111827)))),
                  const SizedBox(height: 2),
                  Text(subtitle, style: TextStyle(fontSize: 11, color: sel ? primary.withValues(alpha: 0.8) : (isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280)))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPerServiceList(bool isDark, List<ServiceCategoryModel> list) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1A1A) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isDark ? Ux4gPalette.neutral600 : Ux4gPalette.neutral300),
      ),
      child: Column(
        children: list.asMap().entries.map((entry) {
          final idx = entry.key;
          final cat = entry.value;
          return Container(
            margin: idx == list.length - 1 ? EdgeInsets.zero : const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF1A1A1A) : Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: isDark ? Ux4gPalette.neutral600 : Ux4gPalette.neutral300),
            ),
            child: Column(
              children: [
                InkWell(
                  borderRadius: cat.expanded ? const BorderRadius.vertical(top: Radius.circular(9)) : BorderRadius.circular(9),
                  onTap: () => setState(() => cat.expanded = !cat.expanded),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    decoration: BoxDecoration(
                      color: cat.expanded ? (isDark ? const Color(0xFF262626) : const Color(0xFFF3F4F6)) : Colors.transparent,
                      borderRadius: cat.expanded ? const BorderRadius.vertical(top: Radius.circular(9)) : BorderRadius.circular(9),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(cat.name, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: isDark ? Colors.white : const Color(0xFF111827))),
                              const SizedBox(height: 2),
                              Text(cat.summary, style: TextStyle(fontSize: 11, color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280))),
                            ],
                          ),
                        ),
                        Icon(cat.expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, color: isDark ? Colors.white : const Color(0xFF111827), size: 20),
                      ],
                    ),
                  ),
                ),
                if (cat.expanded) ...[
                  Divider(height: 1, color: isDark ? Ux4gPalette.neutral600 : Ux4gPalette.neutral300),
                  ...cat.items.asMap().entries.map((itemEntry) {
                    final iIdx = itemEntry.key;
                    final item = itemEntry.value;
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(item.label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: isDark ? Colors.white : const Color(0xFF111827))),
                                    if (item.subtitle != null) ...[
                                      const SizedBox(height: 2),
                                      Text(item.subtitle!, style: TextStyle(fontSize: 11, color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280))),
                                    ],
                                  ],
                                ),
                              ),
                              Ux4gToggle(
                                checked: item.enabled,
                                onCheckedChange: (v) => setState(() => item.enabled = v),
                                labelPosition: Ux4gToggleLabelPosition.noLabel,
                              ),
                            ],
                          ),
                        ),
                        if (iIdx < cat.items.length - 1)
                          Divider(height: 1, color: isDark ? Ux4gPalette.neutral600 : Ux4gPalette.neutral300),
                      ],
                    );
                  }),
                ],
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildLockedView(bool isDark) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1A1A) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isDark ? Ux4gPalette.neutral600 : Ux4gPalette.neutral300),
      ),
      child: Column(
        children: [
          _buildMandatoryItem('SLA breach alerts', 'Sent when an application crosses its service guarantee deadline.', isDark),
          Divider(height: 1, color: isDark ? Ux4gPalette.neutral600 : Ux4gPalette.neutral300),
          _buildMandatoryItem('Rejection notices', 'Sent if an application is rejected, with the reason and next steps.', isDark),
          Divider(height: 1, color: isDark ? Ux4gPalette.neutral600 : Ux4gPalette.neutral300),
          _buildMandatoryItem('Legal & payment deadlines', 'Sent for statutory deadlines and fee payment due dates.', isDark),
        ],
      ),
    );
  }

  Widget _buildMandatoryItem(String title, String subtitle, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 8,
                  children: [
                    Text(title, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: isDark ? Colors.white : const Color(0xFF111827))),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(color: isDark ? const Color(0xFF262626) : const Color(0xFFF3F4F6), borderRadius: BorderRadius.circular(4)),
                      child: Text('Locked', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563))),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(subtitle, style: TextStyle(fontSize: 11, color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280))),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Ux4gToggle(checked: true, enabled: false, onCheckedChange: (_) {}, labelPosition: Ux4gToggleLabelPosition.noLabel),
        ],
      ),
    );
  }

  Widget _buildWhatsAppView(bool isDark) {
    final primary = isDark ? Ux4gPalette.primary300 : Ux4gPalette.primary600;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1A1A) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isDark ? Ux4gPalette.neutral600 : Ux4gPalette.neutral300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark ? Ux4gPalette.green800 : Ux4gPalette.green100,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: isDark ? Ux4gPalette.green600 : Ux4gPalette.green300),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'What you will receive on WhatsApp:',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: isDark ? const Color(0xFFECFDF5) : const Color(0xFF111827),
                  ),
                ),
                const SizedBox(height: 12),
                _buildBenefitRow('Application status changes', isDark),
                _buildBenefitRow('Appointment reminders (D-1 and H-1)', isDark),
                _buildBenefitRow('Action-required alerts with quick links', isDark),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Ux4gCheckbox(
            value: _whatsappConsented,
            onChanged: (v) => setState(() => _whatsappConsented = v ?? false),
            label: 'I consent to receiving notifications on WhatsApp at +91 98765 43210.',
            isRequired: true,
            description: 'You can withdraw this consent at any time. This checkbox is never pre-ticked (DPDP Act 2023).',
          ),
          const SizedBox(height: 20),
          Ux4gButton(
            text: 'Enable WhatsApp notifications',
            onPressed: _whatsappConsented ? () => setState(() {
              _whatsapp = true;
              _tabIndex = 0;
            }) : null,
            width: double.infinity,
            height: 48,
            backgroundColor: primary,
            contentColor: Colors.white,
            disabledBackgroundColor: isDark ? Ux4gPalette.primary600.withValues(alpha: 0.4) : Ux4gPalette.primary300,
            disabledContentColor: Colors.white,
            borderRadius: 8,
          ),
        ],
      ),
    );
  }

  Widget _buildBenefitRow(String text, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check, size: 16, color: isDark ? const Color(0xFFECFDF5) : const Color(0xFF111827)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 12,
                color: isDark ? const Color(0xFFECFDF5) : const Color(0xFF111827),
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildManageAllView(bool isDark) {
    final primary = isDark ? Ux4gPalette.primary300 : Ux4gPalette.primary600;
    final dividerColor = isDark ? Ux4gPalette.neutral600 : Ux4gPalette.neutral300;
    final headerStyle = TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w700,
      color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563),
      letterSpacing: 0.5,
    );

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1A1A) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8, left: 4),
            child: Text('OPTIONAL — YOU CAN TURN OFF', style: headerStyle),
          ),
          _buildManageRow('Status updates', 'Stage changes across all your applications', true, isDark, primary),
          Divider(height: 1, color: dividerColor),
          _buildManageRow('Action reminders', 'Upload and payment reminders', true, isDark, primary),
          Divider(height: 1, color: dividerColor),
          _buildManageRow('Certificate expiry', 'Renewal reminders before documents expire', true, isDark, primary),
          Divider(height: 1, color: dividerColor),
          _buildManageRow('Promotional updates', 'New services and scheme announcements', true, isDark, primary),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.only(bottom: 8, left: 4),
            child: Text('MANDATORY — REQUIRED BY GOVERNMENT POLICY', style: headerStyle),
          ),
          _buildManageRow('SLA breach alerts', 'Service guarantee deadline notifications', false, isDark, primary),
          Divider(height: 1, color: dividerColor),
          _buildManageRow('Rejection notices', 'Application rejection with reasons', false, isDark, primary),
          const SizedBox(height: 20),
          Ux4gButton(
            text: 'Turn off all optional notifications',
            onPressed: () {},
            variant: Ux4gButtonVariant.outline,
            width: double.infinity,
            height: 48,
            borderColor: const Color(0xFFEF4444),
            contentColor: isDark ? const Color(0xFFF87171) : const Color(0xFF991B1B),
            backgroundColor: isDark ? const Color(0xFF2C0B0E) : const Color(0xFFFEF2F2),
            borderRadius: 8,
          ),
        ],
      ),
    );
  }

  Widget _buildManageRow(String title, String subtitle, bool optional, bool isDark, Color primary) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: isDark ? Colors.white : const Color(0xFF111827))),
                const SizedBox(height: 3),
                Text(subtitle, style: TextStyle(fontSize: 11, color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280))),
              ],
            ),
          ),
          const SizedBox(width: 12),
          if (optional)
            Ux4gToggle(checked: true, onCheckedChange: (_) {}, labelPosition: Ux4gToggleLabelPosition.noLabel)
          else
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF262626) : const Color(0xFFE5E7EB),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'Always on',
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: isDark ? const Color(0xFFE5E7EB) : const Color(0xFF111827)),
              ),
            ),
        ],
      ),
    );
  }
}
''';

const _notifChannelsCode = _masterNotificationPreferencesCode;
const _notifFrequencyCode = _masterNotificationPreferencesCode;
const _notifPerServiceCode = _masterNotificationPreferencesCode;
const _notifLockedCode = _masterNotificationPreferencesCode;
const _notifWhatsAppCode = _masterNotificationPreferencesCode;
const _notifManageAllCode = _masterNotificationPreferencesCode;

final notificationChannelsComponent = WidgetbookComponent(
  name: 'Notification Channels',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => ComponentDocs(
        name: 'Notification Channels',
        description:
            'Channel preference toggles (SMS, Email, App notifications, WhatsApp) '
            'inside a rounded card. Fully compatible with light and dark mode.',
        code: _notifChannelsCode,
        center: true,
        child: const _NotifPrefMasterScreen(initialTabIndex: 0),
      ),
    ),
  ],
);

final updateFrequencyComponent = WidgetbookComponent(
  name: 'Update Frequency',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => ComponentDocs(
        name: 'Update Frequency',
        description:
            'Notification delivery frequency options (Immediately, Daily Summary, Weekly Digest). '
            'Fully compatible with light and dark mode.',
        code: _notifFrequencyCode,
        center: true,
        child: const _NotifPrefMasterScreen(initialTabIndex: 1),
      ),
    ),
  ],
);

final perServiceComponent = WidgetbookComponent(
  name: 'Per Service',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => ComponentDocs(
        name: 'Per Service',
        description:
            'Granular notification preference toggles grouped by government service application. '
            'Expandable accordion cards with dark mode compatibility.',
        code: _notifPerServiceCode,
        center: true,
        child: const _NotifPrefMasterScreen(initialTabIndex: 2),
      ),
    ),
  ],
);

final lockedNotificationsComponent = WidgetbookComponent(
  name: 'Locked Notifications',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => ComponentDocs(
        name: 'Locked Notifications',
        description:
            'Statutory mandatory notifications that cannot be opted out of, displayed with a locked badge '
            'and policy notice banner.',
        code: _notifLockedCode,
        center: true,
        child: const _NotifPrefMasterScreen(initialTabIndex: 3),
      ),
    ),
  ],
);

final whatsAppConsentComponent = WidgetbookComponent(
  name: 'WhatsApp Consent',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => ComponentDocs(
        name: 'WhatsApp Consent',
        description:
            'DPDP Act 2023 compliant WhatsApp opt-in consent capture screen with feature benefits checklist.',
        code: _notifWhatsAppCode,
        center: true,
        child: const _NotifPrefMasterScreen(initialTabIndex: 4),
      ),
    ),
  ],
);

final manageAllComponent = WidgetbookComponent(
  name: 'Manage All',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => ComponentDocs(
        name: 'Manage All',
        description:
            'Master control screen separating optional vs mandatory statutory notifications with bulk opt-out CTA.',
        code: _notifManageAllCode,
        center: true,
        child: const _NotifPrefMasterScreen(initialTabIndex: 5),
      ),
    ),
  ],
);
