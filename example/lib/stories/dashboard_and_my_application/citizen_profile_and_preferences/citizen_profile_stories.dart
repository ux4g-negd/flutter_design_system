import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../widgets/component_docs.dart';

bool _isDark(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark;
Color _getTitleColor(BuildContext context) =>
    _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.neutral900;
Color _getSubtleText(BuildContext context) =>
    _isDark(context) ? Ux4gColors.neutral200 : Ux4gColors.neutral700;
Color _getBorderColor(BuildContext context) =>
    _isDark(context) ? Ux4gColors.neutral700 : Ux4gColors.neutral200;
Color _getScaffoldBg(BuildContext context) =>
    _isDark(context) ? Ux4gColors.neutral950 : Ux4gColors.neutral50;
Color _getCardBg(BuildContext context) =>
    _isDark(context) ? Ux4gColors.neutral900 : Ux4gColors.neutral0;
Color _getHeaderBg(BuildContext context) =>
    _isDark(context) ? Ux4gColors.neutral900 : Ux4gColors.neutral0;
Color _getReadOnlyBg(BuildContext context) =>
    _isDark(context) ? Ux4gColors.neutral800 : Ux4gColors.neutral300;

const Color _primaryColor = Ux4gColors.primary600;
const Color _greenColor = Ux4gColors.green600;
const Color _errorColor = Ux4gColors.red600;
const String _nationalEmblemLogoPath = Ux4gIcons.nationalEmblem;
const String _unionLogoPath = Ux4gIcons.union;

final citizenProfileComponent = WidgetbookComponent(
  name: 'Citizen Profile',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        return ComponentDocs(
          mobileMockup: true,
          name: 'Citizen Profile & Preferences',
          description:
              'A comprehensive profile pattern showing user identity, Aadhaar-linked info, '
              'personal details, linked accounts, notification preferences, and account deletion.',
          code: _citizenProfileCode,
          center: true,
          child: const _CitizenProfileMockup(),
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Source Code String
// ───────────────────────────────────────────────────────────────────────

const _citizenProfileCode = r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CitizenProfileScreen extends StatefulWidget {
  const CitizenProfileScreen({super.key});

  @override
  State<CitizenProfileScreen> createState() => _CitizenProfileScreenState();
}

class _CitizenProfileScreenState extends State<CitizenProfileScreen> {
  bool _smsEnabled = true;
  bool _emailEnabled = true;
  bool _appPushEnabled = true;
  bool _whatsAppEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _getCardBg(context),
      body: SafeArea(
        child: Column(
          children: [
            Ux4gAppHeader(
              variant: Ux4gAppHeaderVariant.light,
              leadingWidgets: [
                SvgPicture.asset(Ux4gIcons.nationalEmblem,  height: 40),
                SvgPicture.asset(Ux4gIcons.union,  height: 32),
                Text('Government of India', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF111827))),
              ],
              actions: [
                Ux4gAppHeaderAction(icon: Icons.notifications_outlined, onPressed: () {}),
              ],
              showAvatar: true,
              avatarInitials: 'R',
            ),
            Divider(height: 1, color: Color(0xFFE5E7EB)),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Profile & Preferences', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Color(0xFF111827))),
                    SizedBox(height: 20),

                    // Profile card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFE5E7EB)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Ux4gProfileAvatar(
                            size: Ux4gAvatarSize.xl,
                            initials: 'RK',
                            variant: Ux4gProfileBadge.verified,
                          ),
                          SizedBox(height: 12),
                          Text('Ramesh Kumar', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF111827))),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(color: Color(0xFF16A34A).withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.check_circle, size: 14, color: Color(0xFF16A34A)),
                                    SizedBox(width: 4),
                                    Text('Mobile verified', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Color(0xFF16A34A))),
                                  ],
                                ),
                              ),
                              SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(color: Color(0xFF16A34A).withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.check_circle, size: 14, color: Color(0xFF16A34A)),
                                    SizedBox(width: 4),
                                    Text('Aadhaar linked', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Color(0xFF16A34A))),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: Ux4gButton(text: 'Edit profile', onPressed: () {}, variant: Ux4gButtonVariant.outline),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),

                    // Aadhaar-linked Information
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(border: Border.all(color: Color(0xFFE5E7EB)), borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Aadhaar-linked Information', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Color(0xFF111827))),
                          SizedBox(height: 4),
                          Text('Fetched from UIDAI — update via the UIDAI portal.', style: TextStyle(fontSize: 13, color: Color(0xFF6B7280))),
                          SizedBox(height: 16),
                          Ux4gInputField(value: 'Ramesh Kumar', onValueChange: (_) {}, label: 'Full name', readOnly: true, labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF111827)), style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF111827))),
                          SizedBox(height: 12),
                          Ux4gInputField(value: '15 Aug 1990', onValueChange: (_) {}, label: 'Date of birth', readOnly: true, labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF111827)), style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF111827))),
                          SizedBox(height: 12),
                          Ux4gInputField(value: 'Male', onValueChange: (_) {}, label: 'Gender', readOnly: true, labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF111827)), style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF111827))),
                          SizedBox(height: 12),
                          Ux4gInputField(value: 'XXXX XXXX 4127', onValueChange: (_) {}, label: 'Aadhaar number (UID)', readOnly: true, labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF111827)), style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF111827))),
                          SizedBox(height: 12),
                          Text('Update via UIDAI', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xFF432CBB))),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),

                    // Personal information
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(border: Border.all(color: Color(0xFFE5E7EB)), borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Personal information', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Color(0xFF111827))),
                          SizedBox(height: 16),
                          Ux4gInputField(value: 'ramesh.kumar@gmail.com', onValueChange: (_) {}, label: 'Email address', readOnly: true, labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF111827)), style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF111827))),
                          SizedBox(height: 12),
                          Ux4gInputField(value: '+91 98765 43210', onValueChange: (_) {}, label: 'Mobile number', readOnly: true, labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF111827)), style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF111827))),
                          SizedBox(height: 12),
                          Ux4gInputField(value: 'English', onValueChange: (_) {}, label: 'Language preference', readOnly: true, labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF111827)), style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF111827))),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),

                    // Linked accounts
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(border: Border.all(color: Color(0xFFE5E7EB)), borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Linked accounts', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF111827))),
                          SizedBox(height: 16),
                          // DigiLocker
                          Row(
                            children: [
                              Text('DigiLocker', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF111827))),
                              SizedBox(width: 8),
                              Icon(Icons.check_circle, size: 16, color: Color(0xFF16A34A)),
                              SizedBox(width: 4),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(color: Color(0xFF16A34A).withValues(alpha: 0.1), borderRadius: BorderRadius.circular(4)),
                                child: Text('Linked', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Color(0xFF16A34A))),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Text('Access and share your digital documents', style: TextStyle(fontSize: 12, color: Color(0xFF4B5563))),
                          SizedBox(height: 4),
                          Text('View in DigiLocker', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xFF432CBB))),
                          SizedBox(height: 20),
                          // UMANG App
                          Row(
                            children: [
                              Text('UMANG App', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF111827))),
                              SizedBox(width: 8),
                              Icon(Icons.warning_amber_rounded, size: 16, color: Color(0xFFFF9800)),
                              SizedBox(width: 4),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(color: Color(0xFFFF9800).withValues(alpha: 0.1), borderRadius: BorderRadius.circular(4)),
                                child: Text('Not linked', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Color(0xFFFF9800))),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Text('Unified access to government services', style: TextStyle(fontSize: 12, color: Color(0xFF4B5563))),
                          SizedBox(height: 8),
                          Ux4gButton(text: 'Connect', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.small),
                          SizedBox(height: 20),
                          // Bank account
                          Text('Bank account for DBT', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF111827))),
                          SizedBox(height: 4),
                          Text('XXXXXX7842 · State Bank of India', style: TextStyle(fontSize: 12, color: Color(0xFF4B5563))),
                          SizedBox(height: 4),
                          Text('Change', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xFF432CBB))),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),

                    // Notification preferences
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(border: Border.all(color: Color(0xFFE5E7EB)), borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Notification preferences', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF111827))),
                          SizedBox(height: 16),
                          _ToggleRow(title: 'SMS', subtitle: 'Text message updates', value: _smsEnabled, onChanged: (v) => setState(() => _smsEnabled = v)),
                          SizedBox(height: 16),
                          _ToggleRow(title: 'Email', subtitle: 'Email updates', value: _emailEnabled, onChanged: (v) => setState(() => _emailEnabled = v)),
                          SizedBox(height: 16),
                          _ToggleRow(title: 'App push', subtitle: 'In-app alerts', value: _appPushEnabled, onChanged: (v) => setState(() => _appPushEnabled = v)),
                          SizedBox(height: 16),
                          _ToggleRow(title: 'WhatsApp', subtitle: 'WhatsApp updates', value: _whatsAppEnabled, onChanged: (v) => setState(() => _whatsAppEnabled = v)),
                          SizedBox(height: 16),
                          Text('Notification frequency', style: TextStyle(fontSize: 12, color: Color(0xFF4B5563))),
                          SizedBox(height: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                            decoration: BoxDecoration(border: Border.all(color: Color(0xFFE5E7EB)), borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Immediately', style: TextStyle(fontSize: 14, color: Color(0xFF111827))),
                                Icon(Icons.keyboard_arrow_down, size: 20, color: Color(0xFF4B5563)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),

                    // Delete account
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xFFDC2626).withValues(alpha: 0.03),
                        border: Border.all(color: Color(0xFFDB372D)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Delete account', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF111827))),
                          SizedBox(height: 4),
                          Text('Permanently delete your account and all data.\n30-day grace period to restore before it is final.', style: TextStyle(fontSize: 12, color: Color(0xFF4B5563))),
                          SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            child: Ux4gButton(text: 'Delete my account', onPressed: () {}, variant: Ux4gButtonVariant.outline, borderColor: Color(0xFFDB372D), contentColor: Color(0xFFDB372D)),
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
    );
  }
}


class _ToggleRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;
  const _ToggleRow({required this.title, required this.subtitle, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF111827))),
            SizedBox(height: 2),
            Text(subtitle, style: TextStyle(fontSize: 12, color: Color(0xFF4B5563))),
          ],
        ),
        Ux4gToggle(checked: value, onCheckedChange: onChanged),
      ],
    );
  }
}
""";

// ───────────────────────────────────────────────────────────────────────
// Mockup
// ───────────────────────────────────────────────────────────────────────

class _CitizenProfileMockup extends StatefulWidget {
  const _CitizenProfileMockup();

  @override
  State<_CitizenProfileMockup> createState() => _CitizenProfileMockupState();
}

class _CitizenProfileMockupState extends State<_CitizenProfileMockup> {
  bool _smsEnabled = true;
  bool _emailEnabled = true;
  bool _appPushEnabled = true;
  bool _whatsAppEnabled = false;
  List<String> _selectedFrequency = ['immediately'];

  @override
  Widget build(BuildContext context) {
    final isDark = _isDark(context);
    return Theme(
      data: Ux4gTheme.themeData(isDark: isDark),
      child: Scaffold(
        backgroundColor: _getScaffoldBg(context),
        body: SafeArea(
          child: Column(
            children: [
              // Header
              Container(
                color: _getHeaderBg(context),
                child: Column(
                  children: [
                    Ux4gAppHeader(
                      variant: Ux4gAppHeaderVariant.light,
                      title: '',
                      horizontalPadding: 8,
                      leadingSpacing: 6,
                      actionSpacing: 0,
                      leadingWidgets: [
                        SvgPicture.asset(
                          _nationalEmblemLogoPath,
                          height: 28,
                          colorFilter: isDark
                              ? const ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                )
                              : null,
                          errorBuilder: (c, e, s) => Icon(
                            Icons.account_balance,
                            size: 28,
                            color: Colors.grey,
                          ),
                        ),
                        SvgPicture.asset(
                          _unionLogoPath,
                          height: 24,
                          errorBuilder: (c, e, s) =>
                              Icon(Icons.blur_on, size: 28, color: Colors.blue),
                        ),
                        Text(
                          'Government of India',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: _getTitleColor(context),
                          ),
                        ),
                      ],
                      actions: [
                        Ux4gAppHeaderAction(
                          icon: Icons.notifications_outlined,
                          onPressed: () {},
                        ),
                      ],
                      showAvatar: true,
                      avatar: const Ux4gStatusAvatar(
                        size: Ux4gAvatarSize.s,
                        initials: 'R',
                        variant: Ux4gStatusVariant.online,
                      ),
                    ),
                    Ux4gDivider(),
                  ],
                ),
              ),

              // Content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        'Profile & Preferences',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: _getTitleColor(context),
                        ),
                      ),
                      SizedBox(height: 20),

                      // Profile card
                      _buildProfileCard(),
                      SizedBox(height: 16),

                      // Aadhaar-linked information
                      _buildAadhaarSection(),
                      SizedBox(height: 16),

                      // Personal information
                      _buildPersonalInfoSection(),
                      SizedBox(height: 16),

                      // Linked accounts
                      _buildLinkedAccountsSection(),
                      SizedBox(height: 16),

                      // Notification preferences
                      _buildNotificationPreferences(),
                      SizedBox(height: 16),

                      // Delete account
                      _buildDeleteAccountSection(),
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

  Widget _buildProfileCard() {
    return Ux4gCard(
      cornerRadius: 12,
      borderColor: _getBorderColor(context),
      borderWidth: 1,
      backgroundColor: _getCardBg(context),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Avatar with verified badge
            Ux4gProfileAvatar(
              size: Ux4gAvatarSize.xl,
              initials: 'RK',
              variant: Ux4gProfileBadge.verified,
            ),
            SizedBox(height: 12),
            Text(
              'Ramesh Kumar',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: _getTitleColor(context),
              ),
            ),
            SizedBox(height: 10),

            // Verification badges using Ux4gTag
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Ux4gTag(
                    text: 'Mobile verified',
                    colorScheme: Ux4gTagColor.success,
                    style: Ux4gTagStyle.tonal,
                    shape: Ux4gTagShape.rectangular,
                    customBackgroundColor: Ux4gColors.green100,
                    customContentColor: Ux4gColors.green600,
                    leadingContent: Icon(
                      Icons.check_circle,
                      size: 12,
                      color: _greenColor,
                    ),
                  ),
                  SizedBox(width: 8),
                  Ux4gTag(
                    text: 'Aadhaar linked',
                    colorScheme: Ux4gTagColor.success,
                    style: Ux4gTagStyle.tonal,
                    shape: Ux4gTagShape.rectangular,
                    customBackgroundColor: Ux4gColors.green100,
                    customContentColor: Ux4gColors.green600,
                    leadingContent: Icon(
                      Icons.check_circle,
                      size: 12,
                      color: _greenColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Edit profile button
            SizedBox(
              width: double.infinity,
              child: Ux4gButton(
                text: 'Edit profile',
                onPressed: () {},
                variant: Ux4gButtonVariant.outline,
                borderColor: _isDark(context)
                    ? Ux4gColors.primary400
                    : Ux4gColors.primary300,
                contentColor: _isDark(context)
                    ? Ux4gColors.primary300
                    : Ux4gColors.primary600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAadhaarSection() {
    return Ux4gCard(
      cornerRadius: 12,
      borderColor: _getBorderColor(context),
      borderWidth: 1,
      backgroundColor: _getCardBg(context),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Aadhaar-linked Information',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: _getTitleColor(context),
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Fetched from UIDAI — update via the UIDAI portal.',
              style: TextStyle(fontSize: 13, color: _getSubtleText(context)),
            ),
            SizedBox(height: 16),

            Ux4gInputField(
              value: 'Ramesh Kumar',
              onValueChange: (_) {},
              label: 'Full name',
              readOnly: true,
              backgroundColor: _getReadOnlyBg(context),
              borderColor: _getReadOnlyBg(context),
              labelStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: _getTitleColor(context),
              ),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: _getTitleColor(context),
              ),
            ),
            SizedBox(height: 12),
            Ux4gInputField(
              value: '15 Aug 1990',
              onValueChange: (_) {},
              label: 'Date of birth',
              readOnly: true,
              backgroundColor: _getReadOnlyBg(context),
              borderColor: _getReadOnlyBg(context),
              labelStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: _getTitleColor(context),
              ),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: _getTitleColor(context),
              ),
            ),
            SizedBox(height: 12),
            Ux4gInputField(
              value: 'Male',
              onValueChange: (_) {},
              label: 'Gender',
              readOnly: true,
              backgroundColor: _getReadOnlyBg(context),
              borderColor: _getReadOnlyBg(context),
              labelStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: _getTitleColor(context),
              ),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: _getTitleColor(context),
              ),
            ),
            SizedBox(height: 12),
            Ux4gInputField(
              value: 'XXXX XXXX 4127',
              onValueChange: (_) {},
              label: 'Aadhaar number (UID)',
              readOnly: true,
              backgroundColor: _getReadOnlyBg(context),
              borderColor: _getReadOnlyBg(context),
              labelStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: _getTitleColor(context),
              ),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: _getTitleColor(context),
              ),
            ),
            SizedBox(height: 12),

            Text(
              'Update via UIDAI',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: _primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonalInfoSection() {
    return Ux4gCard(
      cornerRadius: 12,
      borderColor: _getBorderColor(context),
      borderWidth: 1,
      backgroundColor: _getCardBg(context),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Personal information',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: _getTitleColor(context),
              ),
            ),
            SizedBox(height: 16),

            Ux4gInputField(
              value: 'ramesh.kumar@gmail.com',
              onValueChange: (_) {},
              label: 'Email address',
              readOnly: true,
              backgroundColor: _getReadOnlyBg(context),
              borderColor: _getReadOnlyBg(context),
              labelStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: _getTitleColor(context),
              ),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: _getTitleColor(context),
              ),
            ),
            SizedBox(height: 12),
            Ux4gInputField(
              value: '+91 98765 43210',
              onValueChange: (_) {},
              label: 'Mobile number',
              readOnly: true,
              backgroundColor: _getReadOnlyBg(context),
              borderColor: _getReadOnlyBg(context),
              labelStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: _getTitleColor(context),
              ),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: _getTitleColor(context),
              ),
            ),
            SizedBox(height: 12),
            Ux4gInputField(
              value: 'English',
              onValueChange: (_) {},
              label: 'Language preference',
              readOnly: true,
              labelStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: _getTitleColor(context),
              ),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: _getTitleColor(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLinkedAccountsSection() {
    return Ux4gCard(
      cornerRadius: 12,
      borderColor: _getBorderColor(context),
      borderWidth: 1,
      backgroundColor: _getCardBg(context),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Linked accounts',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: _getTitleColor(context),
              ),
            ),
            SizedBox(height: 16),

            // DigiLocker
            Row(
              children: [
                Text(
                  'DigiLocker',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: _getTitleColor(context),
                  ),
                ),
                SizedBox(width: 8),
                Ux4gTag(
                  text: 'Linked',
                  colorScheme: Ux4gTagColor.success,
                  style: Ux4gTagStyle.tonal,
                  size: Ux4gTagSize.m,
                  shape: Ux4gTagShape.rectangular,
                  customBackgroundColor: Ux4gColors.green100,
                  customContentColor: Ux4gColors.green600,
                  leadingContent: Icon(
                    Icons.check_circle,
                    size: 12,
                    color: Ux4gColors.green600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            Text(
              'Access and share your digital documents',
              style: TextStyle(fontSize: 12, color: _getSubtleText(context)),
            ),
            SizedBox(height: 4),
            Text(
              'View in DigiLocker',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: _primaryColor,
              ),
            ),
            SizedBox(height: 10),
            Ux4gDivider(color: _getBorderColor(context)),
            SizedBox(height: 10),

            // UMANG App
            Row(
              children: [
                Text(
                  'UMANG App',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: _getTitleColor(context),
                  ),
                ),
                SizedBox(width: 8),
                Ux4gTag(
                  text: 'Not linked',
                  colorScheme: Ux4gTagColor.warning,
                  style: Ux4gTagStyle.tonal,
                  size: Ux4gTagSize.m,
                  shape: Ux4gTagShape.rectangular,
                  customBackgroundColor: Ux4gColors.orange100,
                  customContentColor: Ux4gColors.orange600,
                  leadingContent: Icon(
                    Icons.warning_amber_rounded,
                    size: 12,
                    color: Ux4gColors.orange600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            Text(
              'Unified access to government services',
              style: TextStyle(fontSize: 12, color: _getSubtleText(context)),
            ),
            SizedBox(height: 8),
            Ux4gButton(
              text: 'Connect',
              onPressed: () {},
              variant: Ux4gButtonVariant.outline,
              size: Ux4gButtonSize.small,
            ),
            SizedBox(height: 10),
            Ux4gDivider(color: _getBorderColor(context)),
            SizedBox(height: 10),

            // Bank account
            Text(
              'Bank account for DBT',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: _getTitleColor(context),
              ),
            ),
            SizedBox(height: 4),
            Text(
              'XXXXXX7842 · State Bank of India',
              style: TextStyle(fontSize: 12, color: _getSubtleText(context)),
            ),
            SizedBox(height: 4),
            Text(
              'Change',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: _primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationPreferences() {
    return Ux4gCard(
      cornerRadius: 12,
      borderColor: _getBorderColor(context),
      borderWidth: 1,
      backgroundColor: _getCardBg(context),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notification preferences',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: _getTitleColor(context),
              ),
            ),
            SizedBox(height: 16),

            _buildNotifToggleRow(
              'SMS',
              'Text message updates',
              _smsEnabled,
              (v) => setState(() => _smsEnabled = v),
            ),
            SizedBox(height: 8),
            Ux4gDivider(color: _getBorderColor(context)),
            SizedBox(height: 8),
            _buildNotifToggleRow(
              'Email',
              'Email updates',
              _emailEnabled,
              (v) => setState(() => _emailEnabled = v),
            ),
            SizedBox(height: 8),
            Ux4gDivider(color: _getBorderColor(context)),
            SizedBox(height: 8),
            _buildNotifToggleRow(
              'App push',
              'In-app alerts',
              _appPushEnabled,
              (v) => setState(() => _appPushEnabled = v),
            ),
            SizedBox(height: 8),
            Ux4gDivider(color: _getBorderColor(context)),
            SizedBox(height: 8),
            _buildNotifToggleRow(
              'WhatsApp',
              'WhatsApp updates',
              _whatsAppEnabled,
              (v) => setState(() => _whatsAppEnabled = v),
            ),
            SizedBox(height: 16),

            Ux4gSelectionDropdown(
              options: const [
                Ux4gDropdownOption(id: 'immediately', label: 'Immediately'),
                Ux4gDropdownOption(id: 'daily', label: 'Daily'),
                Ux4gDropdownOption(id: 'weekly', label: 'Weekly'),
              ],
              selectedOptionIds: _selectedFrequency,
              onSelectionChange: (v) => setState(() => _selectedFrequency = v),
              label: 'Notification frequency',
              mode: Ux4gDropdownMode.single,
              labelTextStyle: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: _getSubtleText(context),
              ),
              valueTextStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: _getTitleColor(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeleteAccountSection() {
    return Ux4gCard(
      cornerRadius: 12,
      borderColor: _isDark(context) ? Ux4gColors.red800 : Ux4gColors.red300,
      borderWidth: 1,
      backgroundColor: _getCardBg(context),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delete account',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: _getTitleColor(context),
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Permanently delete your account and all data.\n30-day grace period to restore before it is final.',
              style: TextStyle(fontSize: 12, color: _getSubtleText(context)),
            ),
            SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: Ux4gButton(
                text: 'Delete my account',
                onPressed: () {},
                variant: Ux4gButtonVariant.outline,
                borderColor: _isDark(context)
                    ? Ux4gColors.red700
                    : Ux4gColors.red600,
                contentColor: _isDark(context)
                    ? Ux4gColors.red300
                    : _errorColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotifToggleRow(
    String label,
    String description,
    bool value,
    ValueChanged<bool> onChanged,
  ) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: _getTitleColor(context),
                ),
              ),
              SizedBox(height: 2),
              Text(
                description,
                style: TextStyle(fontSize: 12, color: _getSubtleText(context)),
              ),
            ],
          ),
        ),
        Ux4gToggle(
          checked: value,
          onCheckedChange: onChanged,
          size: Ux4gToggleSize.s,
        ),
      ],
    );
  }
}
