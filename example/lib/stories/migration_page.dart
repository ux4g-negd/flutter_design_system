import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../data/flutter_migration_markdown.dart';
import '../data/flutter_migration_prompt_markdown.dart';
import '../utils/file_downloader.dart';
import '../theme_notifier.dart';

// ── Models ───────────────────────────────────────────────────────────────────

enum StatusParity { yes, no, partial }

class FlutterComponentItem {
  final int id;
  final String name;
  final String category;
  final String ux4gTag;
  final StatusParity ux4gStatus;
  final String ux4gNote;
  final String m3Name;
  final StatusParity m3Status;
  final String cupertinoName;
  final StatusParity cupertinoStatus;
  final String notes;

  const FlutterComponentItem({
    required this.id,
    required this.name,
    required this.category,
    required this.ux4gTag,
    required this.ux4gStatus,
    this.ux4gNote = '',
    required this.m3Name,
    required this.m3Status,
    required this.cupertinoName,
    required this.cupertinoStatus,
    required this.notes,
  });
}

class FlutterPropMappingItem {
  final String component;
  final String propGroup;
  final String ux4gProp;
  final String m3Prop;
  final String cupertinoProp;
  final String description;

  const FlutterPropMappingItem({
    required this.component,
    required this.propGroup,
    required this.ux4gProp,
    required this.m3Prop,
    required this.cupertinoProp,
    required this.description,
  });
}

// ── Component Data (48 Items) ────────────────────────────────────────────────

const List<FlutterComponentItem> kFlutterComponentsData = [
  FlutterComponentItem(
    id: 1,
    name: 'Accordion & Group',
    category: 'Navigation & Layout',
    ux4gTag: 'Ux4gAccordion',
    ux4gStatus: StatusParity.yes,
    ux4gNote: 'Ux4gAccordionGroup',
    m3Name: 'ExpansionTile / ExpansionPanelList',
    m3Status: StatusParity.yes,
    cupertinoName: 'No (Custom)',
    cupertinoStatus: StatusParity.no,
    notes: 'Collapsible accordion with accessible status pills, custom arrow orientation, and group controller.',
  ),
  FlutterComponentItem(
    id: 2,
    name: 'App Header',
    category: 'Navigation & Layout',
    ux4gTag: 'Ux4gAppHeader',
    ux4gStatus: StatusParity.yes,
    m3Name: 'AppBar / SliverAppBar',
    m3Status: StatusParity.yes,
    cupertinoName: 'CupertinoNavigationBar',
    cupertinoStatus: StatusParity.yes,
    notes: 'Top application bar with government emblem logo, user profile avatar, and responsive action items.',
  ),
  FlutterComponentItem(
    id: 3,
    name: 'Avatar',
    category: 'Core Components',
    ux4gTag: 'Ux4gAvatar',
    ux4gStatus: StatusParity.yes,
    m3Name: 'CircleAvatar',
    m3Status: StatusParity.yes,
    cupertinoName: 'No (Custom Circle)',
    cupertinoStatus: StatusParity.no,
    notes: 'Citizen photo rendering with automatic initials fallback and custom sizing scales.',
  ),
  FlutterComponentItem(
    id: 4,
    name: 'Avatar Group & Status',
    category: 'Core Components',
    ux4gTag: 'Ux4gAvatarGroup',
    ux4gStatus: StatusParity.yes,
    ux4gNote: 'Ux4gStatusAvatar',
    m3Name: 'No (Custom Stack)',
    m3Status: StatusParity.no,
    cupertinoName: 'No',
    cupertinoStatus: StatusParity.no,
    notes: 'Overlapping avatar cluster with +N overflow indicator pill and online/offline status presence badges.',
  ),
  FlutterComponentItem(
    id: 5,
    name: 'Badge',
    category: 'Core Components',
    ux4gTag: 'Ux4gBadge',
    ux4gStatus: StatusParity.yes,
    m3Name: 'Badge / Badge.count',
    m3Status: StatusParity.yes,
    cupertinoName: 'No (Custom Container)',
    cupertinoStatus: StatusParity.no,
    notes: 'Standalone and anchored count badges with 99+ max count truncation and semantic color coding.',
  ),
  FlutterComponentItem(
    id: 6,
    name: 'Bottom Navigation (Tabs)',
    category: 'Navigation & Layout',
    ux4gTag: 'No (Use NavigationBar)',
    ux4gStatus: StatusParity.no,
    m3Name: 'NavigationBar / BottomNavigationBar',
    m3Status: StatusParity.yes,
    cupertinoName: 'CupertinoTabBar',
    cupertinoStatus: StatusParity.yes,
    notes: 'Bottom tab navigation. In UX4G Flutter, developers use Flutter NavigationBar with Ux4gTheme tokens.',
  ),
  FlutterComponentItem(
    id: 7,
    name: 'Bottom Sheet (Modal Sheet)',
    category: 'Navigation & Layout',
    ux4gTag: 'Ux4gBottomSheet',
    ux4gStatus: StatusParity.yes,
    m3Name: 'showModalBottomSheet',
    m3Status: StatusParity.yes,
    cupertinoName: 'showCupertinoModalPopup',
    cupertinoStatus: StatusParity.yes,
    notes: 'Slide-up modal sheet with drag handle, title bar, sticky CTA buttons, and scrollable content area.',
  ),
  FlutterComponentItem(
    id: 8,
    name: 'Button',
    category: 'Core Components',
    ux4gTag: 'Ux4gButton',
    ux4gStatus: StatusParity.yes,
    m3Name: 'FilledButton / OutlinedButton / TextButton',
    m3Status: StatusParity.yes,
    cupertinoName: 'CupertinoButton / CupertinoButton.filled',
    cupertinoStatus: StatusParity.yes,
    notes: 'Primary, secondary, outline, and ghost variants with loading spinner, leading/trailing icons, and min 48px touch targets.',
  ),
  FlutterComponentItem(
    id: 9,
    name: 'Icon Button',
    category: 'Core Components',
    ux4gTag: 'Ux4gIconButton',
    ux4gStatus: StatusParity.yes,
    m3Name: 'IconButton / IconButton.filled',
    m3Status: StatusParity.yes,
    cupertinoName: 'CupertinoButton (Icon)',
    cupertinoStatus: StatusParity.partial,
    notes: 'Accessible touch targets with built-in tooltips, variants (solid, outline, ghost), and sizing tokens.',
  ),
  FlutterComponentItem(
    id: 10,
    name: 'Segmented Button',
    category: 'Core Components',
    ux4gTag: 'No (Use Ux4gChipGroup)',
    ux4gStatus: StatusParity.no,
    ux4gNote: 'Ux4gChipGroup, Ux4gChoiceChip',
    m3Name: 'SegmentedButton',
    m3Status: StatusParity.yes,
    cupertinoName: 'CupertinoSlidingSegmentedControl',
    cupertinoStatus: StatusParity.yes,
    notes: 'Single and multi-select segmented pill toggles. Use Ux4gChipGroup with Ux4gChoiceChip or Flutter SegmentedButton with Ux4gTheme.',
  ),
  FlutterComponentItem(
    id: 11,
    name: 'Card',
    category: 'Core Components',
    ux4gTag: 'Ux4gCard',
    ux4gStatus: StatusParity.yes,
    m3Name: 'Card / Card.elevated / Card.outlined',
    m3Status: StatusParity.yes,
    cupertinoName: 'No (Custom Container)',
    cupertinoStatus: StatusParity.no,
    notes: 'Structured media card with header, subtitle, actions, elevation depth, and horizontal/vertical orientation.',
  ),
  FlutterComponentItem(
    id: 12,
    name: 'Carousel',
    category: 'Navigation & Layout',
    ux4gTag: 'Ux4gCarousel',
    ux4gStatus: StatusParity.yes,
    m3Name: 'CarouselView (Flutter 3.24+)',
    m3Status: StatusParity.partial,
    cupertinoName: 'No (PageView)',
    cupertinoStatus: StatusParity.no,
    notes: 'Touch-friendly swipeable banner with pagination indicator dots, auto-play timer, and citizen hero cards.',
  ),
  FlutterComponentItem(
    id: 13,
    name: 'Checkbox & Group',
    category: 'Inputs & Forms',
    ux4gTag: 'Ux4gCheckbox',
    ux4gStatus: StatusParity.yes,
    ux4gNote: 'Ux4gCheckboxGroup',
    m3Name: 'Checkbox / CheckboxListTile',
    m3Status: StatusParity.yes,
    cupertinoName: 'CupertinoCheckbox',
    cupertinoStatus: StatusParity.yes,
    notes: 'Checked, unchecked, and tri-state indeterminate selection with labels and subtitle descriptions.',
  ),
  FlutterComponentItem(
    id: 14,
    name: 'Chips & Chip Group',
    category: 'Inputs & Forms',
    ux4gTag: 'Ux4gChoiceChip',
    ux4gStatus: StatusParity.yes,
    ux4gNote: 'Ux4gFilterChip, Ux4gInputChip, Ux4gChipGroup',
    m3Name: 'ChoiceChip / FilterChip / InputChip',
    m3Status: StatusParity.yes,
    cupertinoName: 'No (Custom)',
    cupertinoStatus: StatusParity.no,
    notes: 'Interactive chip pills with selection checks, delete buttons, and automatic wrapping Ux4gChipGroup.',
  ),
  FlutterComponentItem(
    id: 15,
    name: 'Circular Progress Indicator',
    category: 'Feedback & Status',
    ux4gTag: 'Ux4gCircularProgressIndicator',
    ux4gStatus: StatusParity.yes,
    ux4gNote: 'Ux4gAnimatedCircularProgress',
    m3Name: 'CircularProgressIndicator',
    m3Status: StatusParity.yes,
    cupertinoName: 'CupertinoActivityIndicator',
    cupertinoStatus: StatusParity.partial,
    notes: 'Determinate circular percentage ring with center label, smooth animated transitions, and custom track stroke width.',
  ),
  FlutterComponentItem(
    id: 16,
    name: 'Half Circle Progress (Gauge)',
    category: 'Feedback & Status',
    ux4gTag: 'Ux4gHalfCircleProgress',
    ux4gStatus: StatusParity.yes,
    ux4gNote: 'Ux4gAnimatedHalfCircleProgress',
    m3Name: 'No (Custom Painter)',
    m3Status: StatusParity.no,
    cupertinoName: 'No',
    cupertinoStatus: StatusParity.no,
    notes: 'Speedometer half-circle meter gauge for citizen service quotas, completion metrics, and threshold scoring.',
  ),
  FlutterComponentItem(
    id: 17,
    name: 'Linear Progress Bar',
    category: 'Feedback & Status',
    ux4gTag: 'Ux4gLinearProgressBar',
    ux4gStatus: StatusParity.yes,
    ux4gNote: 'Ux4gAnimatedLinearProgressBar',
    m3Name: 'LinearProgressIndicator',
    m3Status: StatusParity.yes,
    cupertinoName: 'No',
    cupertinoStatus: StatusParity.no,
    notes: 'Linear progress bar with indeterminate animation, customizable height, rounded corners, and semantic colors.',
  ),
  FlutterComponentItem(
    id: 18,
    name: 'Date Picker',
    category: 'Inputs & Forms',
    ux4gTag: 'Ux4gDatePicker',
    ux4gStatus: StatusParity.yes,
    m3Name: 'showDatePicker / DatePickerDialog',
    m3Status: StatusParity.yes,
    cupertinoName: 'CupertinoDatePicker',
    cupertinoStatus: StatusParity.yes,
    notes: 'Modal calendar, range picker, and direct Indian date format (DD/MM/YYYY) input with year dropdowns.',
  ),
  FlutterComponentItem(
    id: 19,
    name: 'Time Picker',
    category: 'Inputs & Forms',
    ux4gTag: 'Ux4gTimePicker',
    ux4gStatus: StatusParity.yes,
    m3Name: 'showTimePicker / TimePickerDialog',
    m3Status: StatusParity.yes,
    cupertinoName: 'CupertinoTimerPicker',
    cupertinoStatus: StatusParity.yes,
    notes: '12-hour AM/PM dial and 24-hour clock selector for government appointment scheduling.',
  ),
  FlutterComponentItem(
    id: 20,
    name: 'Divider',
    category: 'Core Components',
    ux4gTag: 'Ux4gDivider',
    ux4gStatus: StatusParity.yes,
    m3Name: 'Divider / VerticalDivider',
    m3Status: StatusParity.yes,
    cupertinoName: 'CupertinoListSection (Separator)',
    cupertinoStatus: StatusParity.partial,
    notes: 'Horizontal & vertical dividers with center text labels and solid/dashed/dotted line styles.',
  ),
  FlutterComponentItem(
    id: 21,
    name: 'Draft Status Banner',
    category: 'Government Specific',
    ux4gTag: 'Ux4gStatusBanner',
    ux4gStatus: StatusParity.yes,
    m3Name: 'MaterialBanner',
    m3Status: StatusParity.partial,
    cupertinoName: 'No',
    cupertinoStatus: StatusParity.no,
    notes: 'Government service status alerts (Draft Saved, Under Review, Action Required, Verification Pending).',
  ),
  FlutterComponentItem(
    id: 22,
    name: 'Drawer (Side Menu)',
    category: 'Navigation & Layout',
    ux4gTag: 'No (Use Drawer)',
    ux4gStatus: StatusParity.no,
    m3Name: 'Drawer / NavigationDrawer',
    m3Status: StatusParity.yes,
    cupertinoName: 'No',
    cupertinoStatus: StatusParity.no,
    notes: 'Side navigation drawer for app menus. Developers use standard Flutter Drawer with Ux4gTheme.',
  ),
  FlutterComponentItem(
    id: 23,
    name: 'Dropdown (Action & Selection)',
    category: 'Inputs & Forms',
    ux4gTag: 'Ux4gActionDropdown',
    ux4gStatus: StatusParity.yes,
    ux4gNote: 'Ux4gSelectionDropdown',
    m3Name: 'DropdownMenu / DropdownButtonFormField',
    m3Status: StatusParity.yes,
    cupertinoName: 'CupertinoPicker',
    cupertinoStatus: StatusParity.partial,
    notes: 'Single selection, multi-select with tag pills, and searchable filter popup menu.',
  ),
  FlutterComponentItem(
    id: 24,
    name: 'Empty State',
    category: 'Feedback & Status',
    ux4gTag: 'Ux4gEmptyState',
    ux4gStatus: StatusParity.yes,
    m3Name: 'No (Custom Column)',
    m3Status: StatusParity.no,
    cupertinoName: 'No',
    cupertinoStatus: StatusParity.no,
    notes: 'Standardized zero-states (No Applications, No Results, Server Error) with illustration and CTA.',
  ),
  FlutterComponentItem(
    id: 25,
    name: 'Feedback Form (CSAT & NPS)',
    category: 'Feedback & Status',
    ux4gTag: 'Ux4gFeedbackFormStar',
    ux4gStatus: StatusParity.yes,
    ux4gNote: 'Ux4gFeedbackFormCsat, Ux4gFeedbackFormNps',
    m3Name: 'No (Custom)',
    m3Status: StatusParity.no,
    cupertinoName: 'No',
    cupertinoStatus: StatusParity.no,
    notes: 'Citizen satisfaction rating widgets with 1-5 Star, CSAT emoji faces, and 0-10 NPS scoring.',
  ),
  FlutterComponentItem(
    id: 26,
    name: 'File Upload',
    category: 'Inputs & Forms',
    ux4gTag: 'Ux4gFileUpload',
    ux4gStatus: StatusParity.yes,
    m3Name: 'No (Custom File Picker)',
    m3Status: StatusParity.no,
    cupertinoName: 'No',
    cupertinoStatus: StatusParity.no,
    notes: 'Government document upload box with file size validation, mime constraints, and upload progress states.',
  ),
  FlutterComponentItem(
    id: 27,
    name: 'Floating Action Button (FAB)',
    category: 'Core Components',
    ux4gTag: 'No (Use FloatingActionButton)',
    ux4gStatus: StatusParity.no,
    m3Name: 'FloatingActionButton / ExtendedFAB',
    m3Status: StatusParity.yes,
    cupertinoName: 'No',
    cupertinoStatus: StatusParity.no,
    notes: 'FAB button. In UX4G Flutter, developers style standard FloatingActionButton with Ux4gColors tokens.',
  ),
  FlutterComponentItem(
    id: 28,
    name: 'Input Field (Text Field)',
    category: 'Inputs & Forms',
    ux4gTag: 'Ux4gInputField',
    ux4gStatus: StatusParity.yes,
    m3Name: 'TextField / TextFormField',
    m3Status: StatusParity.yes,
    cupertinoName: 'CupertinoTextField',
    cupertinoStatus: StatusParity.yes,
    notes: 'Single-line input with floating label, prefix/suffix icons, helper text, and inline error validation.',
  ),
  FlutterComponentItem(
    id: 29,
    name: 'Aadhaar Input Field',
    category: 'Government Specific',
    ux4gTag: 'Ux4gAadhaarInputField',
    ux4gStatus: StatusParity.yes,
    m3Name: 'No (Custom Formatter)',
    m3Status: StatusParity.no,
    cupertinoName: 'No',
    cupertinoStatus: StatusParity.no,
    notes: 'Auto-formatting 12 digits (XXXX XXXX XXXX) with UIDAI-compliant Verhoeff checksum algorithm.',
  ),
  FlutterComponentItem(
    id: 30,
    name: 'PAN Input Field',
    category: 'Government Specific',
    ux4gTag: 'Ux4gPanInputField',
    ux4gStatus: StatusParity.yes,
    m3Name: 'No (Custom Formatter)',
    m3Status: StatusParity.no,
    cupertinoName: 'No',
    cupertinoStatus: StatusParity.no,
    notes: 'Alphanumeric 10-character Income Tax PAN card validator with auto-capitalization and regex verification.',
  ),
  FlutterComponentItem(
    id: 31,
    name: 'OTP Input (PIN Code)',
    category: 'Government Specific',
    ux4gTag: 'Ux4gOtpInput',
    ux4gStatus: StatusParity.yes,
    m3Name: 'No (Custom Row)',
    m3Status: StatusParity.no,
    cupertinoName: 'No',
    cupertinoStatus: StatusParity.no,
    notes: 'Segmented 4/6-digit OTP input boxes with auto-focus, paste listener, countdown resend timer, and error shake.',
  ),
  FlutterComponentItem(
    id: 32,
    name: 'Journey Timeline',
    category: 'Government Specific',
    ux4gTag: 'Ux4gJourneyTimeline',
    ux4gStatus: StatusParity.yes,
    m3Name: 'No (Custom Stepper)',
    m3Status: StatusParity.no,
    cupertinoName: 'No',
    cupertinoStatus: StatusParity.no,
    notes: 'Multi-stage citizen application tracker (Submitted -> Verified -> Approved) with timestamps and badges.',
  ),
  FlutterComponentItem(
    id: 33,
    name: 'Link',
    category: 'Core Components',
    ux4gTag: 'Ux4gLink',
    ux4gStatus: StatusParity.yes,
    m3Name: 'InkWell + Text',
    m3Status: StatusParity.partial,
    cupertinoName: 'CupertinoButton',
    cupertinoStatus: StatusParity.partial,
    notes: 'Accessible hyperlink with underline styling and trailing external link arrow icon.',
  ),
  FlutterComponentItem(
    id: 34,
    name: 'Modal Dialog',
    category: 'Navigation & Layout',
    ux4gTag: 'Ux4gModal',
    ux4gStatus: StatusParity.yes,
    m3Name: 'AlertDialog / Dialog',
    m3Status: StatusParity.yes,
    cupertinoName: 'CupertinoAlertDialog',
    cupertinoStatus: StatusParity.yes,
    notes: 'Accessible modal dialog with title header, close button, custom body, and dual action footer.',
  ),
  FlutterComponentItem(
    id: 35,
    name: 'Pagination (Numbered & Dotted)',
    category: 'Navigation & Layout',
    ux4gTag: 'Ux4gPagination',
    ux4gStatus: StatusParity.yes,
    ux4gNote: 'Ux4gPaginationDotted',
    m3Name: 'No (Custom Row)',
    m3Status: StatusParity.no,
    cupertinoName: 'No',
    cupertinoStatus: StatusParity.no,
    notes: 'Numbered page switcher with previous/next arrows and compact dotted carousel pagination indicator.',
  ),
  FlutterComponentItem(
    id: 36,
    name: 'Radio Button & Group',
    category: 'Inputs & Forms',
    ux4gTag: 'Ux4gRadioButton',
    ux4gStatus: StatusParity.yes,
    ux4gNote: 'Ux4gRadioGroup',
    m3Name: 'Radio / RadioListTile',
    m3Status: StatusParity.yes,
    cupertinoName: 'CupertinoRadio',
    cupertinoStatus: StatusParity.yes,
    notes: 'Single-choice radio selector with label, helper text, and exclusive selection group controller.',
  ),
  FlutterComponentItem(
    id: 37,
    name: 'Result List & Row',
    category: 'Core Components',
    ux4gTag: 'Ux4gResultList',
    ux4gStatus: StatusParity.yes,
    ux4gNote: 'Ux4gResultRow',
    m3Name: 'ListView.separated + ListTile',
    m3Status: StatusParity.partial,
    cupertinoName: 'CupertinoListSection + CupertinoListTile',
    cupertinoStatus: StatusParity.partial,
    notes: 'Structured government service search results with metadata chips, badges, status pills, and CTAs.',
  ),
  FlutterComponentItem(
    id: 38,
    name: 'Search Field',
    category: 'Inputs & Forms',
    ux4gTag: 'Ux4gSearchField',
    ux4gStatus: StatusParity.yes,
    m3Name: 'SearchBar / SearchAnchor',
    m3Status: StatusParity.yes,
    cupertinoName: 'CupertinoSearchTextField',
    cupertinoStatus: StatusParity.yes,
    notes: 'Search input with leading magnifying glass, clear button, and suggestions overlay controller.',
  ),
  FlutterComponentItem(
    id: 39,
    name: 'Slider (Range & Discrete)',
    category: 'Inputs & Forms',
    ux4gTag: 'Ux4gSlider',
    ux4gStatus: StatusParity.yes,
    m3Name: 'Slider / RangeSlider',
    m3Status: StatusParity.yes,
    cupertinoName: 'CupertinoSlider',
    cupertinoStatus: StatusParity.yes,
    notes: 'Continuous and stepped range slider with value tooltips, tick marks, and min/max limits.',
  ),
  FlutterComponentItem(
    id: 40,
    name: 'Slot Grid (Appointment Booking)',
    category: 'Government Specific',
    ux4gTag: 'Ux4gTimeslot',
    ux4gStatus: StatusParity.yes,
    ux4gNote: 'Ux4gTimeSlot, SlotGrid',
    m3Name: 'No (Custom GridView)',
    m3Status: StatusParity.no,
    cupertinoName: 'No',
    cupertinoStatus: StatusParity.no,
    notes: 'Time slot selection grid (Available, Selected, Booked, Inactive) for Seva Kendras and citizen visits.',
  ),
  FlutterComponentItem(
    id: 41,
    name: 'Spinner / Loader',
    category: 'Feedback & Status',
    ux4gTag: 'Ux4gSpinner',
    ux4gStatus: StatusParity.yes,
    ux4gNote: 'Ux4gLoader (Deprecated)',
    m3Name: 'CircularProgressIndicator',
    m3Status: StatusParity.yes,
    cupertinoName: 'CupertinoActivityIndicator',
    cupertinoStatus: StatusParity.yes,
    notes: 'Activity loader adhering to UX4G primary theme color tokens and multiple size presets.',
  ),
  FlutterComponentItem(
    id: 42,
    name: 'Status Pipeline (Workflow)',
    category: 'Government Specific',
    ux4gTag: 'Ux4gStatusPipeline',
    ux4gStatus: StatusParity.yes,
    m3Name: 'No (Custom)',
    m3Status: StatusParity.no,
    cupertinoName: 'No',
    cupertinoStatus: StatusParity.no,
    notes: 'Horizontal and vertical citizen workflow pipeline (Pending -> Processing -> Completed).',
  ),
  FlutterComponentItem(
    id: 43,
    name: 'Stepper (Form Wizard)',
    category: 'Navigation & Layout',
    ux4gTag: 'Ux4gStepper',
    ux4gStatus: StatusParity.yes,
    m3Name: 'Stepper',
    m3Status: StatusParity.yes,
    cupertinoName: 'No',
    cupertinoStatus: StatusParity.no,
    notes: 'Multi-step form wizard with numbered step bubbles, progress line, and validation checkmarks.',
  ),
  FlutterComponentItem(
    id: 44,
    name: 'Switch / Toggle',
    category: 'Inputs & Forms',
    ux4gTag: 'Ux4gSwitch',
    ux4gStatus: StatusParity.yes,
    ux4gNote: 'Ux4gToggle (Deprecated)',
    m3Name: 'Switch / SwitchListTile',
    m3Status: StatusParity.yes,
    cupertinoName: 'CupertinoSwitch',
    cupertinoStatus: StatusParity.yes,
    notes: 'Standard Boolean toggle switch with label, subtitle description, and smooth spring animation.',
  ),
  FlutterComponentItem(
    id: 45,
    name: 'Tag',
    category: 'Core Components',
    ux4gTag: 'Ux4gTag',
    ux4gStatus: StatusParity.yes,
    m3Name: 'Chip (read-only)',
    m3Status: StatusParity.partial,
    cupertinoName: 'No',
    cupertinoStatus: StatusParity.no,
    notes: 'Pill and rectangular metadata tags with semantic variants (success, warning, error, info) and remove button.',
  ),
  FlutterComponentItem(
    id: 46,
    name: 'Text Area (Multiline Input)',
    category: 'Inputs & Forms',
    ux4gTag: 'Ux4gTextArea',
    ux4gStatus: StatusParity.yes,
    m3Name: 'TextField(maxLines: N)',
    m3Status: StatusParity.partial,
    cupertinoName: 'CupertinoTextField(maxLines: N)',
    cupertinoStatus: StatusParity.partial,
    notes: 'Multiline input with built-in character count indicator, max length enforcement, and clear button.',
  ),
  FlutterComponentItem(
    id: 47,
    name: 'Toast (Snackbar Notification)',
    category: 'Feedback & Status',
    ux4gTag: 'Ux4gToast',
    ux4gStatus: StatusParity.yes,
    m3Name: 'ScaffoldMessenger.showSnackBar',
    m3Status: StatusParity.yes,
    cupertinoName: 'No',
    cupertinoStatus: StatusParity.no,
    notes: 'Floating alert toast with semantic status icons, action button, auto-dismiss duration, and dismiss gesture.',
  ),
  FlutterComponentItem(
    id: 48,
    name: 'Tooltip',
    category: 'Feedback & Status',
    ux4gTag: 'Ux4gTooltip',
    ux4gStatus: StatusParity.yes,
    m3Name: 'Tooltip',
    m3Status: StatusParity.yes,
    cupertinoName: 'No',
    cupertinoStatus: StatusParity.no,
    notes: 'Anchored floating popup overlay with directional pointer arrow for contextual citizen guidance.',
  ),
  FlutterComponentItem(
    id: 49,
    name: 'Biometric Face Auth (Liveness & Capture)',
    category: 'Government Specific',
    ux4gTag: 'BiometricVerificationFlow',
    ux4gStatus: StatusParity.yes,
    ux4gNote: 'FaceAlignmentOverlay, DeviceCheckScreen',
    m3Name: 'No (Requires 3rd-party ML Kit / Camera)',
    m3Status: StatusParity.no,
    cupertinoName: 'No (Custom)',
    cupertinoStatus: StatusParity.no,
    notes: 'UIDAI-grade biometric capture with camera feed, ML Kit face mesh alignment, device capability pre-checks, and liveness challenge verification.',
  ),
];

// ── Props Mapping Data (50+ Items) ───────────────────────────────────────────

const List<FlutterPropMappingItem> kFlutterPropsMappingData = [
  // Biometric Verification
  FlutterPropMappingItem(
    component: 'BiometricVerificationFlow',
    propGroup: 'Verification & Liveness',
    ux4gProp: 'onVerify: Future<BiometricResult> Function(Uint8List), showConsent: bool, cameraLensDirection: CameraLens',
    m3Prop: 'Not Available (Requires custom camera + Google ML Kit)',
    cupertinoProp: 'Not Available',
    description: 'Complete citizen face authentication flow with consent gate, camera diagnostics, and liveness verification.',
  ),
  FlutterPropMappingItem(
    component: 'FaceAlignmentOverlay',
    propGroup: 'Alignment Guide',
    ux4gProp: 'faceRect: Rect?, isFaceAligned: bool, instructionText: String, strokeColor: Color',
    m3Prop: 'Not Available (Requires CustomPainter)',
    cupertinoProp: 'Not Available',
    description: 'Real-time face oval overlay guide with color-coded alignment feedback for citizen selfies.',
  ),
  FlutterPropMappingItem(
    component: 'DeviceCheckScreen',
    propGroup: 'Hardware Diagnostics',
    ux4gProp: 'onProceed: VoidCallback, checkCamera: bool, checkMicrophone: bool',
    m3Prop: 'Not Available',
    cupertinoProp: 'Not Available',
    description: 'Pre-flight device hardware and permission diagnostics before biometric onboarding.',
  ),

  // Accordion
  FlutterPropMappingItem(
    component: 'Ux4gAccordion',
    propGroup: 'Header & Toggle',
    ux4gProp: 'title: String, subtitle: String?, isExpanded: bool, onToggle: ValueChanged<bool>?',
    m3Prop: 'title: Widget, subtitle: Widget?, initiallyExpanded: bool, onExpansionChanged: ValueChanged<bool>?',
    cupertinoProp: 'No direct equivalent',
    description: 'Header title, subtitle description, and collapsible expansion state control.',
  ),
  FlutterPropMappingItem(
    component: 'Ux4gAccordion',
    propGroup: 'Icons & Status',
    ux4gProp: 'leadingIcon: Widget?, statusPill: Widget?, trailingIconPosition: IconPosition',
    m3Prop: 'leading: Widget?, trailing: Widget?',
    cupertinoProp: 'No direct equivalent',
    description: 'Leading status icons, accessible pill indicators, and custom trailing chevron direction.',
  ),
  FlutterPropMappingItem(
    component: 'Ux4gAccordionGroup',
    propGroup: 'Multi-Expansion',
    ux4gProp: 'allowMultiple: bool, defaultExpandedIds: List<String>',
    m3Prop: 'ExpansionPanelList(children: ...)',
    cupertinoProp: 'No direct equivalent',
    description: 'Container widget managing accordion item multi-expansion or accordion single-collapse mode.',
  ),

  // App Header
  FlutterPropMappingItem(
    component: 'Ux4gAppHeader',
    propGroup: 'Emblem & Navigation',
    ux4gProp: 'title: String, showBackButton: bool, onBackPressed: VoidCallback?, emblemAsset: String?',
    m3Prop: 'AppBar(title: Widget, leading: Widget?)',
    cupertinoProp: 'CupertinoNavigationBar(middle: Widget, leading: Widget?)',
    description: 'Top screen header with official emblem logo, back navigation button, and title.',
  ),
  FlutterPropMappingItem(
    component: 'Ux4gAppHeader',
    propGroup: 'Actions & Profile',
    ux4gProp: 'actions: List<Widget>?, avatar: Widget?, notificationBadgeCount: int?',
    m3Prop: 'AppBar(actions: List<Widget>?)',
    cupertinoProp: 'CupertinoNavigationBar(trailing: Widget?)',
    description: 'Right-hand action buttons, unread notification counter badge, and citizen profile avatar.',
  ),

  // Avatar
  FlutterPropMappingItem(
    component: 'Ux4gAvatar',
    propGroup: 'Image & Initials',
    ux4gProp: 'imageUrl: String?, name: String?, icon: IconData?, size: Ux4gAvatarSize',
    m3Prop: 'CircleAvatar(backgroundImage: ImageProvider?, child: Text?, radius: double)',
    cupertinoProp: 'Custom ClipRRect or Circle Container',
    description: 'Citizen photo rendering with automatic initials fallback calculation and standard sizing scale.',
  ),
  FlutterPropMappingItem(
    component: 'Ux4gAvatarGroup',
    propGroup: 'Stack & Overflow',
    ux4gProp: 'avatars: List<Ux4gAvatar>, maxVisible: int, spacing: double',
    m3Prop: 'Custom Stack with positioning',
    cupertinoProp: 'Custom Stack',
    description: 'Overlapping citizen avatar cluster with +N overflow count pill.',
  ),

  // Badge
  FlutterPropMappingItem(
    component: 'Ux4gBadge',
    propGroup: 'Count & Truncation',
    ux4gProp: 'count: int?, maxCount: int, variant: Ux4gBadgeVariant, isDot: bool',
    m3Prop: 'Badge.count(count: int) / Badge()',
    cupertinoProp: 'Custom Container',
    description: 'Notification counter badge with 99+ truncation and semantic color coding.',
  ),

  // Bottom Sheet
  FlutterPropMappingItem(
    component: 'Ux4gBottomSheet',
    propGroup: 'Modal Sheet',
    ux4gProp: 'title: String, child: Widget, primaryAction: Widget?, isDismissible: bool',
    m3Prop: 'showModalBottomSheet(builder: (ctx) => ...)',
    cupertinoProp: 'showCupertinoModalPopup(...)',
    description: 'Slide-up modal sheet with drag handle, title bar, sticky CTA buttons, and scrollable content.',
  ),

  // Button
  FlutterPropMappingItem(
    component: 'Ux4gButton',
    propGroup: 'Variants & Style',
    ux4gProp: 'variant: Ux4gButtonVariant (primary, secondary, outline, ghost), size: Ux4gButtonSize',
    m3Prop: 'FilledButton / OutlinedButton / TextButton',
    cupertinoProp: 'CupertinoButton / CupertinoButton.filled',
    description: 'Visual style hierarchy adhering to government WCAG AA contrast standards.',
  ),
  FlutterPropMappingItem(
    component: 'Ux4gButton',
    propGroup: 'State & Icons',
    ux4gProp: 'isLoading: bool, leadingIcon: Widget?, trailingIcon: Widget?, onPressed: VoidCallback?',
    m3Prop: 'onPressed: VoidCallback?, icon: Widget?',
    cupertinoProp: 'onPressed: VoidCallback?, child: Widget',
    description: 'Integrated activity loader spinner, leading/trailing icon attachments, and touch target sizing.',
  ),

  // Icon Button
  FlutterPropMappingItem(
    component: 'Ux4gIconButton',
    propGroup: 'Icon & Touch Target',
    ux4gProp: 'icon: IconData, tooltip: String?, size: Ux4gButtonSize, variant: Ux4gIconButtonVariant',
    m3Prop: 'IconButton(icon: Widget, tooltip: String?, onPressed: VoidCallback?)',
    cupertinoProp: 'CupertinoButton(child: Icon, onPressed: VoidCallback?)',
    description: 'Accessible touch targets with minimum 48x48px touch bounding box.',
  ),

  // Segmented Button
  FlutterPropMappingItem(
    component: 'Ux4gSegmentedButton',
    propGroup: 'Selection',
    ux4gProp: 'segments: List<ButtonSegment<T>>, selected: Set<T>, onSelectionChanged: Function',
    m3Prop: 'SegmentedButton<T>(segments: ..., selected: ..., onSelectionChanged: ...)',
    cupertinoProp: 'CupertinoSlidingSegmentedControl<T>(children: ..., groupValue: ..., onValueChanged: ...)',
    description: 'Pill-segmented toggle control for view switching and filtered queries.',
  ),

  // Card
  FlutterPropMappingItem(
    component: 'Ux4gCard',
    propGroup: 'Header & Layout',
    ux4gProp: 'title: String?, subtitle: String?, badge: Widget?, actions: List<Widget>?, child: Widget?',
    m3Prop: 'Card(child: Column(...))',
    cupertinoProp: 'Custom Container with BoxDecoration',
    description: 'Structured citizen card with title header, badge, content body, and action footer.',
  ),

  // Carousel
  FlutterPropMappingItem(
    component: 'Ux4gCarousel',
    propGroup: 'AutoPlay & Items',
    ux4gProp: 'items: List<Widget>, autoPlay: bool, autoPlayInterval: Duration, showIndicators: bool',
    m3Prop: 'CarouselView (Flutter 3.24+) or PageView',
    cupertinoProp: 'PageView + PageController',
    description: 'Touch-friendly swipeable banner with auto-play timer and pagination indicator dots.',
  ),

  // Checkbox
  FlutterPropMappingItem(
    component: 'Ux4gCheckbox',
    propGroup: 'Tri-State & Label',
    ux4gProp: 'value: bool?, isTristate: bool, onChanged: ValueChanged<bool?>?, label: String?',
    m3Prop: 'Checkbox(value: bool?, tristate: bool, onChanged: ...)',
    cupertinoProp: 'CupertinoCheckbox(value: bool, onChanged: ...)',
    description: 'Checked, unchecked, and indeterminate tri-state selection with integrated label.',
  ),
  FlutterPropMappingItem(
    component: 'Ux4gCheckboxGroup',
    propGroup: 'Group Selection',
    ux4gProp: 'options: List<Ux4gCheckboxOption>, selectedValues: List<String>, onChanged: Function',
    m3Prop: 'Custom Column / ListView of CheckboxListTile',
    cupertinoProp: 'Custom Column',
    description: 'Manages multi-select checkbox arrays with horizontal or vertical layouts.',
  ),

  // Chips
  FlutterPropMappingItem(
    component: 'Ux4gChoiceChip',
    propGroup: 'Selection',
    ux4gProp: 'label: String, selected: bool, onSelected: ValueChanged<bool>?',
    m3Prop: 'ChoiceChip(label: Widget, selected: bool, onSelected: ...)',
    cupertinoProp: 'Custom Container',
    description: 'Single-choice filter chip pill with smooth check animation.',
  ),
  FlutterPropMappingItem(
    component: 'Ux4gChipGroup',
    propGroup: 'Wrapping Layout',
    ux4gProp: 'chips: List<Widget>, spacing: double, runSpacing: double',
    m3Prop: 'Wrap(spacing: double, runSpacing: double, children: ...)',
    cupertinoProp: 'Wrap(...)',
    description: 'Automatic wrapping chip container for quick category filters and multi-tags.',
  ),

  // Progress
  FlutterPropMappingItem(
    component: 'Ux4gCircularProgressIndicator',
    propGroup: 'Percentage Ring',
    ux4gProp: 'progress: double (0.0 - 1.0), size: double, strokeWidth: double, showPercentage: bool',
    m3Prop: 'CircularProgressIndicator(value: double?)',
    cupertinoProp: 'CupertinoActivityIndicator(radius: double)',
    description: 'Determinate circular percentage ring with center label and custom track stroke width.',
  ),
  FlutterPropMappingItem(
    component: 'Ux4gHalfCircleProgress',
    propGroup: 'Speedometer Gauge',
    ux4gProp: 'progress: double (0.0 - 1.0), label: String?, subLabel: String?, radius: double',
    m3Prop: 'CustomPainter',
    cupertinoProp: 'CustomPainter',
    description: 'Speedometer half-circle meter gauge for citizen service quotas and target metrics.',
  ),
  FlutterPropMappingItem(
    component: 'Ux4gLinearProgressBar',
    propGroup: 'Linear Indicator',
    ux4gProp: 'progress: double? (null for indeterminate), height: double, color: Color?, borderRadius: double',
    m3Prop: 'LinearProgressIndicator(value: double?, minHeight: double)',
    cupertinoProp: 'Custom Container',
    description: 'Linear progress bar with smooth transitions and theme color binding.',
  ),

  // Date & Time Pickers
  FlutterPropMappingItem(
    component: 'Ux4gDatePicker',
    propGroup: 'Date Selection',
    ux4gProp: 'initialDate: DateTime?, firstDate: DateTime, lastDate: DateTime, onDateSelected: Function',
    m3Prop: 'showDatePicker(context: context, initialDate: ..., firstDate: ..., lastDate: ...)',
    cupertinoProp: 'CupertinoDatePicker(mode: CupertinoDatePickerMode.date, onDateTimeChanged: ...)',
    description: 'Modal calendar and direct date of birth picker with Indian date format.',
  ),
  FlutterPropMappingItem(
    component: 'Ux4gTimePicker',
    propGroup: 'Time Intervals',
    ux4gProp: 'initialTime: TimeOfDay?, is24Hour: bool, onTimeSelected: ValueChanged<TimeOfDay>',
    m3Prop: 'showTimePicker(context: context, initialTime: ...)',
    cupertinoProp: 'CupertinoTimerPicker(onTimerDurationChanged: ...)',
    description: '12-hour AM/PM and 24-hour clock selector for service appointments.',
  ),

  // Dropdown
  FlutterPropMappingItem(
    component: 'Ux4gSelectionDropdown',
    propGroup: 'Options & Filter',
    ux4gProp: 'items: List<DropdownMenuItem<T>>, value: T?, onChanged: ValueChanged<T?>?, isSearchable: bool',
    m3Prop: 'DropdownMenu<T>(dropdownMenuEntries: ..., onSelected: ...)',
    cupertinoProp: 'CupertinoPicker(children: ..., onSelectedItemChanged: ...)',
    description: 'Single-select, multi-select with tag pills, and searchable filter input.',
  ),

  // Input Fields
  FlutterPropMappingItem(
    component: 'Ux4gInputField',
    propGroup: 'Value & Validation',
    ux4gProp: 'controller: TextEditingController?, label: String?, hintText: String?, errorText: String?',
    m3Prop: 'TextField(decoration: InputDecoration(labelText: ..., errorText: ...))',
    cupertinoProp: 'CupertinoTextField(placeholder: ...)',
    description: 'Single-line input with floating animated label, helper text, and validation status.',
  ),
  FlutterPropMappingItem(
    component: 'Ux4gAadhaarInputField',
    propGroup: 'Verhoeff Checksum',
    ux4gProp: 'controller: TextEditingController?, onValidChanged: ValueChanged<bool>?, enableChecksum: bool',
    m3Prop: 'Custom TextInputFormatter',
    cupertinoProp: 'Custom TextInputFormatter',
    description: 'Auto-formatting 12 digits (XXXX XXXX XXXX) with UIDAI-compliant Verhoeff checksum algorithm.',
  ),
  FlutterPropMappingItem(
    component: 'Ux4gPanInputField',
    propGroup: 'PAN Verification',
    ux4gProp: 'controller: TextEditingController?, onValidChanged: ValueChanged<bool>?',
    m3Prop: 'Custom TextInputFormatter',
    cupertinoProp: 'Custom TextInputFormatter',
    description: 'Alphanumeric 10-character Income Tax PAN card validator with auto-capitalization.',
  ),
  FlutterPropMappingItem(
    component: 'Ux4gOtpInput',
    propGroup: 'Segmented PIN',
    ux4gProp: 'length: int (4 or 6), onCompleted: ValueChanged<String>, onResend: VoidCallback?, resendTimeout: Duration',
    m3Prop: 'Custom Row of TextFields',
    cupertinoProp: 'Custom Row of TextFields',
    description: 'Segmented OTP box inputs with auto-focus, paste listener, and countdown resend timer.',
  ),

  // Journey Timeline
  FlutterPropMappingItem(
    component: 'Ux4gJourneyTimeline',
    propGroup: 'Stages & Status',
    ux4gProp: 'stages: List<TimelineStage>, currentStageIndex: int, isVertical: bool',
    m3Prop: 'Stepper(steps: ...)',
    cupertinoProp: 'Custom Column',
    description: 'Multi-stage citizen application tracker (Submitted -> Verified -> Approved).',
  ),

  // Modal
  FlutterPropMappingItem(
    component: 'Ux4gModal',
    propGroup: 'Dialog Actions',
    ux4gProp: 'title: String, content: Widget, primaryAction: Widget?, secondaryAction: Widget?',
    m3Prop: 'AlertDialog(title: Widget, content: Widget, actions: List<Widget>)',
    cupertinoProp: 'CupertinoAlertDialog(title: Widget, content: Widget, actions: List<Widget>)',
    description: 'Centered modal dialog with accessible title and standardized sticky actions.',
  ),

  // Pagination
  FlutterPropMappingItem(
    component: 'Ux4gPagination',
    propGroup: 'Numbered Navigation',
    ux4gProp: 'currentPage: int, totalPages: int, onPageChanged: ValueChanged<int>',
    m3Prop: 'Custom Row with IconButton',
    cupertinoProp: 'Custom Row',
    description: 'Numbered page selector with previous/next arrows and capsule layout.',
  ),
  FlutterPropMappingItem(
    component: 'Ux4gPaginationDotted',
    propGroup: 'Dots Indicator',
    ux4gProp: 'itemCount: int, activeIndex: int, dotSize: double, activeColor: Color?',
    m3Prop: 'Custom Row of AnimatedContainers',
    cupertinoProp: 'Custom Row',
    description: 'Compact dotted carousel pagination indicator for mobile onboarding and carousels.',
  ),

  // Radio Button
  FlutterPropMappingItem(
    component: 'Ux4gRadioButton',
    propGroup: 'Selection & Label',
    ux4gProp: 'value: T, groupValue: T?, onChanged: ValueChanged<T?>?, label: String?',
    m3Prop: 'Radio<T>(value: T, groupValue: T?, onChanged: ...)',
    cupertinoProp: 'CupertinoRadio<T>(value: T, groupValue: T?, onChanged: ...)',
    description: 'Single choice radio selector with accessible label and touch target.',
  ),
  FlutterPropMappingItem(
    component: 'Ux4gRadioGroup',
    propGroup: 'Exclusive Group',
    ux4gProp: 'options: List<Ux4gRadioOption<T>>, value: T?, onChanged: ValueChanged<T?>?',
    m3Prop: 'Column / ListView of RadioListTile',
    cupertinoProp: 'Column of CupertinoRadio',
    description: 'Manages exclusive single-choice option sets with keyboard navigation.',
  ),

  // Search Field
  FlutterPropMappingItem(
    component: 'Ux4gSearchField',
    propGroup: 'Search & Suggestions',
    ux4gProp: 'controller: TextEditingController?, onSearch: ValueChanged<String>?, showClear: bool',
    m3Prop: 'SearchBar(onChanged: ..., leading: Icon, trailing: ...)',
    cupertinoProp: 'CupertinoSearchTextField(onChanged: ...)',
    description: 'Search input with leading magnifying glass and clear button.',
  ),

  // Slot Grid / Timeslot
  FlutterPropMappingItem(
    component: 'Ux4gTimeslot',
    propGroup: 'Booking Slots',
    ux4gProp: 'data: Ux4gTimeslotData, onDateSelected: ValueChanged<DateTime>?, timeSlotProvider: Function?',
    m3Prop: 'GridView.builder(itemBuilder: ...)',
    cupertinoProp: 'GridView.builder(...)',
    description: 'Appointment slot calendar grid (Available, Selected, Booked, Inactive) for Seva Kendras.',
  ),

  // Status Banner
  FlutterPropMappingItem(
    component: 'Ux4gStatusBanner',
    propGroup: 'Alert Actions',
    ux4gProp: 'title: String, message: String, status: Ux4gStatus, onAction: VoidCallback?, actionLabel: String?',
    m3Prop: 'MaterialBanner(content: Widget, actions: List<Widget>)',
    cupertinoProp: 'Custom Container',
    description: 'Application status alert banner with action triggers and icon indicators.',
  ),

  // Stepper
  FlutterPropMappingItem(
    component: 'Ux4gStepper',
    propGroup: 'Steps & Navigation',
    ux4gProp: 'steps: List<Ux4gStepItem>, currentStep: int, totalSteps: int, orientation: StepperOrientation',
    m3Prop: 'Stepper(steps: ..., currentStep: ..., onStepTapped: ...)',
    cupertinoProp: 'Custom Column / Row',
    description: 'Multi-step form stepper with numbered step bubbles and completed checkmarks.',
  ),

  // Switch / Toggle
  FlutterPropMappingItem(
    component: 'Ux4gSwitch',
    propGroup: 'Toggle State',
    ux4gProp: 'checked: bool, onCheckedChange: ValueChanged<bool>?, label: String?, description: String?, size: Ux4gSwitchSize',
    m3Prop: 'Switch(value: bool, onChanged: ...)',
    cupertinoProp: 'CupertinoSwitch(value: bool, onChanged: ...)',
    description: 'Standard Boolean toggle switch with integrated label and description.',
  ),

  // Toast
  FlutterPropMappingItem(
    component: 'Ux4gToast',
    propGroup: 'Floating Alert',
    ux4gProp: 'Ux4gToast.show(context, message: String, variant: Ux4gToastVariant, duration: Duration)',
    m3Prop: 'ScaffoldMessenger.of(context).showSnackBar(SnackBar(...))',
    cupertinoProp: 'Custom OverlayEntry',
    description: 'Static helper to show stackable, auto-dismissing snackbars across any screen.',
  ),

  // Tooltip
  FlutterPropMappingItem(
    component: 'Ux4gTooltip',
    propGroup: 'Overlay Placement',
    ux4gProp: 'message: String, child: Widget, preferBelow: bool, triggerMode: TooltipTriggerMode',
    m3Prop: 'Tooltip(message: String, child: Widget)',
    cupertinoProp: 'Custom OverlayEntry',
    description: 'Anchored floating popup overlay with directional pointer arrows for contextual help.',
  ),
];

// ── Migration Page Widget ────────────────────────────────────────────────────

class Ux4gMigrationPage extends StatefulWidget {
  const Ux4gMigrationPage({super.key});

  @override
  State<Ux4gMigrationPage> createState() => _Ux4gMigrationPageState();
}

class _Ux4gMigrationPageState extends State<Ux4gMigrationPage> {
  int _activeTab = 0; // 0: Components, 1: Props, 2: Tokens, 3: Gov-Exclusive, 4: AI Migration Prompt
  String _compSearch = '';
  String _compFilter = 'all';
  String _propSearch = '';
  String _selectedPropComp = 'all';
  bool _downloadSuccess = false;
  bool _downloadPromptSuccess = false;
  bool _copiedPromptSuccess = false;

  void _handleDownloadMigrationDoc() {
    try {
      downloadMarkdownFile('MIGRATION.md', kFlutterMigrationMarkdownContent);
      if (mounted) {
        setState(() => _downloadSuccess = true);
        Future.delayed(const Duration(seconds: 3), () {
          if (mounted) setState(() => _downloadSuccess = false);
        });
      }
    } catch (err) {
      debugPrint('Failed to download MIGRATION.md: $err');
    }
  }

  void _handleDownloadPromptDoc() {
    try {
      downloadMarkdownFile('migration-prompt.md', kFlutterMigrationPromptMarkdownContent);
      if (mounted) {
        setState(() => _downloadPromptSuccess = true);
        Future.delayed(const Duration(seconds: 3), () {
          if (mounted) setState(() => _downloadPromptSuccess = false);
        });
      }
    } catch (err) {
      debugPrint('Failed to download migration-prompt.md: $err');
    }
  }

  void _handleCopyPromptText() {
    Clipboard.setData(const ClipboardData(text: kFlutterMigrationPromptMarkdownContent));
    if (mounted) {
      setState(() => _copiedPromptSuccess = true);
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) setState(() => _copiedPromptSuccess = false);
      });
    }
  }

  Widget _buildDownloadButton(bool isDark, Color borderColor, Color onSurface) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: _handleDownloadMigrationDoc,
        borderRadius: BorderRadius.circular(10),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          decoration: BoxDecoration(
            color: _downloadSuccess
                ? (isDark ? const Color(0xFF166534).withValues(alpha: 0.3) : const Color(0xFFF0FDF4))
                : (isDark ? const Color(0xFF1E293B) : Colors.white),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: _downloadSuccess
                  ? const Color(0xFF86EFAC)
                  : (isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0)),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 3,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                _downloadSuccess ? Icons.check_rounded : Icons.file_download_outlined,
                size: 17,
                color: _downloadSuccess
                    ? const Color(0xFF15803D)
                    : (isDark ? const Color(0xFF94A3B8) : const Color(0xFF475569)),
              ),
              const SizedBox(width: 7),
              Text(
                'migration.md',
                style: TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.1,
                  color: _downloadSuccess
                      ? const Color(0xFF15803D)
                      : (isDark ? const Color(0xFFE2E8F0) : const Color(0xFF334155)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDownloadPromptButton(bool isDark, Color borderColor, Color onSurface) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: _handleDownloadPromptDoc,
        borderRadius: BorderRadius.circular(10),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          decoration: BoxDecoration(
            color: _downloadPromptSuccess
                ? (isDark ? const Color(0xFF166534).withValues(alpha: 0.3) : const Color(0xFFF0FDF4))
                : (isDark ? const Color(0xFF1E293B) : Colors.white),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: _downloadPromptSuccess
                  ? const Color(0xFF86EFAC)
                  : (isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0)),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 3,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                _downloadPromptSuccess ? Icons.check_rounded : Icons.terminal_rounded,
                size: 17,
                color: _downloadPromptSuccess
                    ? const Color(0xFF15803D)
                    : (isDark ? const Color(0xFF94A3B8) : const Color(0xFF475569)),
              ),
              const SizedBox(width: 7),
              Text(
                'migration-prompt.md',
                style: TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.1,
                  color: _downloadPromptSuccess
                      ? const Color(0xFF15803D)
                      : (isDark ? const Color(0xFFE2E8F0) : const Color(0xFF334155)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDownloadButtonsGroup(bool isDark, Color borderColor, Color onSurface) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        _buildDownloadButton(isDark, borderColor, onSurface),
        _buildDownloadPromptButton(isDark, borderColor, onSurface),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: widgetbookThemeNotifier,
      builder: (context, mode, _) {
        final theme = Theme.of(context);
        final bool isDark = mode == ThemeMode.dark ||
            (mode == ThemeMode.system && theme.brightness == Brightness.dark);

        final bg = isDark ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC);
        final cardBg = isDark ? const Color(0xFF1E293B) : Colors.white;
        final borderColor = isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0);
        final onSurface = isDark ? const Color(0xFFF8FAFC) : const Color(0xFF0F172A);
        final subColor = isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B);
        const primary = Color(0xFF5B3AE6);

        return Scaffold(
          backgroundColor: bg,
          body: LayoutBuilder(
            builder: (context, constraints) {
              final isDesktop = constraints.maxWidth >= 960;
              final isTablet = constraints.maxWidth >= 640 && !isDesktop;
              final hPadding = isDesktop ? 40.0 : (isTablet ? 24.0 : 16.0);

              return SingleChildScrollView(
                padding: EdgeInsets.zero,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // ── 1. Hero Header (Edge-to-edge, 0 outer padding) ──
                    _buildHeroHeader(isDark, borderColor, onSurface, subColor, primary, isDesktop, hPadding),

                    // ── 2. Sticky Tab Bar ───────────────────────────────
                    _buildTabBar(isDark, borderColor, primary, hPadding),

                    // ── 3. Tab Content ──────────────────────────────────
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: 28),
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 1200),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (_activeTab == 0)
                                _buildComponentsTab(isDark, cardBg, borderColor, onSurface, subColor, primary),
                              if (_activeTab == 1)
                                _buildPropsTab(isDark, cardBg, borderColor, onSurface, subColor, primary),
                              if (_activeTab == 2)
                                _buildTokensTab(isDark, cardBg, borderColor, onSurface, subColor, primary),
                              if (_activeTab == 3)
                                _buildGovExclusiveTab(isDark, cardBg, borderColor, onSurface, subColor, primary),
                            ],
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

  // ── Hero Header ────────────────────────────────────────────────────────────

  Widget _buildHeroHeader(
    bool isDark,
    Color borderColor,
    Color onSurface,
    Color subColor,
    Color primary,
    bool isDesktop,
    double hPadding,
  ) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isDark
              ? [const Color(0xFF1E1B4B), const Color(0xFF0F172A)]
              : [const Color(0xFFF8F6FF), Colors.white],
        ),
        border: Border(
          bottom: BorderSide(
            color: isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0),
          ),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: hPadding,
              vertical: isDesktop ? 40 : 28,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Eyebrow badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF5B3AE6).withValues(alpha: 0.25) : const Color(0xFFF3E8FF),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: isDark ? const Color(0xFF6D28D9) : const Color(0xFFDDD6FE),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.star_outline_rounded,
                        size: 15,
                        color: isDark ? const Color(0xFFC4B5FD) : const Color(0xFF5B3AE6),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Flutter Ecosystem Parity & Migration Report',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: isDark ? const Color(0xFFC4B5FD) : const Color(0xFF5B3AE6),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),

                // Framework Comparison Logos
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildUx4gLogoBox(isDark),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14),
                        child: Text(
                          '↔',
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xFF94A3B8),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      _buildM3LogoBox(isDark),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14),
                        child: Text(
                          '↔',
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xFF94A3B8),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      _buildCupertinoLogoBox(isDark),
                    ],
                  ),
                ),
                const SizedBox(height: 18),

                // Description
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 880),
                  child: Text(
                    'Detailed cross-framework component mapping for 48+ UX4G Flutter components, '
                    'Flutter Material 3 (Material Design 3) and Cupertino equivalents, props parity, and migration guidelines.',
                    style: TextStyle(
                      fontSize: 15,
                      color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF475569),
                      height: 1.6,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                _buildDownloadButtonsGroup(isDark, borderColor, onSurface),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUx4gLogoBox(bool isDark) {
    return Container(
      height: 54,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E293B) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: SvgPicture.asset(
        'assets/ux4g_logo.svg',
        height: 30,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildM3LogoBox(bool isDark) {
    return Container(
      height: 54,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E293B) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: const Color(0xFF6200EE),
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: const Icon(
          Icons.view_quilt_rounded,
          size: 22,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildCupertinoLogoBox(bool isDark) {
    return Container(
      height: 54,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E293B) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: const Color(0xFF0284C7),
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: const Icon(
          Icons.apple_rounded,
          size: 22,
          color: Colors.white,
        ),
      ),
    );
  }

  // ── Tab Bar ────────────────────────────────────────────────────────────────

  Widget _buildTabBar(bool isDark, Color borderColor, Color primary, double hPadding) {
    final tabs = [
      {'id': 0, 'label': 'Components', 'badge': '${kFlutterComponentsData.length}'},
      {'id': 1, 'label': 'Props & API Mapping', 'badge': '${kFlutterPropsMappingData.length} APIs'},
      {'id': 2, 'label': 'Tokens & Theming', 'badge': 'Parity'},
      {'id': 3, 'label': 'Gov-Exclusive Modules', 'badge': '12+'},
    ];

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF0F172A) : Colors.white,
        border: Border(bottom: BorderSide(color: borderColor)),
      ),
      padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: 12),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF1E293B) : const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: borderColor),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: tabs.map((t) {
                    final idx = t['id'] as int;
                    final label = t['label'] as String;
                    final badge = t['badge'] as String;
                    final isActive = _activeTab == idx;

                    return Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: InkWell(
                        onTap: () => setState(() => _activeTab = idx),
                        borderRadius: BorderRadius.circular(8),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 150),
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(
                            color: isActive ? primary : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: isActive
                                ? [
                                    BoxShadow(
                                      color: primary.withValues(alpha: 0.3),
                                      blurRadius: 6,
                                      offset: const Offset(0, 2),
                                    ),
                                  ]
                                : null,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                label,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: isActive ? FontWeight.w700 : FontWeight.w600,
                                  color: isActive
                                      ? Colors.white
                                      : (isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B)),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: isActive
                                      ? Colors.white
                                      : (isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0)),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  badge,
                                  style: TextStyle(
                                    fontSize: 10.5,
                                    fontWeight: FontWeight.w800,
                                    color: isActive ? primary : (isDark ? const Color(0xFFCBD5E1) : const Color(0xFF475569)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ── TAB 1: Components ──────────────────────────────────────────────────────

  Widget _buildComponentsTab(
    bool isDark,
    Color cardBg,
    Color borderColor,
    Color onSurface,
    Color subColor,
    Color primary,
  ) {
    final filtered = kFlutterComponentsData.where((item) {
      final s = _compSearch.toLowerCase().trim();
      final matchText =
          '${item.name} ${item.category} ${item.ux4gTag} ${item.m3Name} ${item.cupertinoName} ${item.notes}'
              .toLowerCase();
      if (s.isNotEmpty && !matchText.contains(s)) return false;

      if (_compFilter == 'all-three') {
        return item.ux4gStatus == StatusParity.yes &&
            item.m3Status == StatusParity.yes &&
            item.cupertinoStatus == StatusParity.yes;
      }
      if (_compFilter == 'ux4g-only') {
        return item.ux4gStatus == StatusParity.yes &&
            (item.m3Status != StatusParity.yes || item.cupertinoStatus != StatusParity.yes);
      }
      if (_compFilter == 'has-ux4g') {
        return item.ux4gStatus == StatusParity.yes;
      }
      if (_compFilter == 'has-m3') {
        return item.m3Status == StatusParity.yes || item.m3Status == StatusParity.partial;
      }
      if (_compFilter == 'has-cupertino') {
        return item.cupertinoStatus == StatusParity.yes || item.cupertinoStatus == StatusParity.partial;
      }
      if (_compFilter == 'only-material') {
        return (item.m3Status == StatusParity.yes || item.m3Status == StatusParity.partial) &&
            item.cupertinoStatus == StatusParity.no;
      }
      if (_compFilter == 'only-cupertino') {
        return (item.cupertinoStatus == StatusParity.yes || item.cupertinoStatus == StatusParity.partial) &&
            item.m3Status == StatusParity.no;
      }
      return true;
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Component Mapping',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: onSurface),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF1E3A8A).withValues(alpha: 0.5) : const Color(0xFFEFF6FF),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: isDark ? const Color(0xFF3B82F6).withValues(alpha: 0.4) : const Color(0xFFBFDBFE),
                    ),
                  ),
                  child: Text(
                    '${filtered.length} of ${kFlutterComponentsData.length} components',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: isDark ? const Color(0xFF93C5FD) : const Color(0xFF2563EB),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'Side-by-side component availability across UX4G Flutter, Flutter Material 3 (M3), and Cupertino.',
              style: TextStyle(fontSize: 14, color: subColor),
            ),
          ],
        ),
        const SizedBox(height: 20),

        // Search and Filter Bar
        LayoutBuilder(
          builder: (context, constraints) {
            final isNarrow = constraints.maxWidth < 600;
            return isNarrow
                ? Column(
                    children: [
                      _buildSearchField(cardBg, borderColor, onSurface, subColor, (v) => setState(() => _compSearch = v)),
                      const SizedBox(height: 10),
                      _buildCategoryDropdown(cardBg, borderColor, onSurface),
                    ],
                  )
                : Row(
                    children: [
                      Expanded(
                        child: _buildSearchField(
                            cardBg, borderColor, onSurface, subColor, (v) => setState(() => _compSearch = v)),
                      ),
                      const SizedBox(width: 12),
                      _buildCategoryDropdown(cardBg, borderColor, onSurface),
                    ],
                  );
          },
        ),
        const SizedBox(height: 20),

        // Responsive Components List (No Horizontal Scroll)
        LayoutBuilder(
          builder: (context, constraints) {
            final isDesktop = constraints.maxWidth >= 900;

            if (filtered.isEmpty) {
              return Container(
                width: double.infinity,
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: cardBg,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: borderColor),
                ),
                child: Center(
                  child: Column(
                    children: [
                      Icon(Icons.search_off, size: 40, color: subColor),
                      const SizedBox(height: 8),
                      Text('No components match your search', style: TextStyle(fontWeight: FontWeight.bold, color: onSurface)),
                    ],
                  ),
                ),
              );
            }

            if (isDesktop) {
              final double tableWidth = constraints.maxWidth > 1160 ? constraints.maxWidth : 1160.0;
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: cardBg,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: borderColor),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: tableWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Desktop Table Header
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                          decoration: BoxDecoration(
                            color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC),
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
                            border: Border(bottom: BorderSide(color: borderColor)),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 44,
                                child: Text('#', style: TextStyle(fontWeight: FontWeight.bold, color: subColor, fontSize: 13)),
                              ),
                              SizedBox(
                                width: 190,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Text('Component', style: TextStyle(fontWeight: FontWeight.bold, color: onSurface, fontSize: 13)),
                                ),
                              ),
                              SizedBox(
                                width: 230,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 8,
                                        height: 8,
                                        decoration: const BoxDecoration(color: Color(0xFF5B3AE6), shape: BoxShape.circle),
                                      ),
                                      const SizedBox(width: 6),
                                      const Text('UX4G Flutter', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF5B3AE6), fontSize: 13)),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 230,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 8,
                                        height: 8,
                                        decoration: const BoxDecoration(color: Color(0xFF7952B3), shape: BoxShape.circle),
                                      ),
                                      const SizedBox(width: 6),
                                      const Text('Flutter M3 Equivalent', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF7952B3), fontSize: 13)),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 210,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 8,
                                        height: 8,
                                        decoration: const BoxDecoration(color: Color(0xFF0284C7), shape: BoxShape.circle),
                                      ),
                                      const SizedBox(width: 6),
                                      const Text('Cupertino', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF0284C7), fontSize: 13)),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text('Notes & Parity', style: TextStyle(fontWeight: FontWeight.bold, color: onSurface, fontSize: 13)),
                              ),
                            ],
                          ),
                        ),

                        // Desktop Table Rows
                        for (int i = 0; i < filtered.length; i++) ...[
                          if (i > 0) Divider(height: 1, color: borderColor),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 44,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 2),
                                    child: Text('${filtered[i].id}', style: TextStyle(fontSize: 13, color: subColor, fontWeight: FontWeight.w600)),
                                  ),
                                ),
                                SizedBox(
                                  width: 190,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(filtered[i].name, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13.5, color: onSurface)),
                                        const SizedBox(height: 4),
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                                          decoration: BoxDecoration(
                                            color: isDark ? const Color(0xFF334155) : const Color(0xFFF1F5F9),
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                          child: Text(filtered[i].category, style: TextStyle(fontSize: 10, color: subColor, fontWeight: FontWeight.w600)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 230,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: _buildStatusPill(
                                      filtered[i].ux4gTag,
                                      filtered[i].ux4gStatus,
                                      note: filtered[i].ux4gNote,
                                      isDark: isDark,
                                      accent: const Color(0xFF5B3AE6),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 230,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: _buildStatusPill(
                                      filtered[i].m3Name,
                                      filtered[i].m3Status,
                                      isDark: isDark,
                                      accent: const Color(0xFF7952B3),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 210,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: _buildStatusPill(
                                      filtered[i].cupertinoName,
                                      filtered[i].cupertinoStatus,
                                      isDark: isDark,
                                      accent: const Color(0xFF0284C7),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    filtered[i].notes,
                                    style: TextStyle(fontSize: 12, color: subColor, height: 1.45),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              );
            } else {
              // Mobile / Tablet Cards View (Zero horizontal scroll)
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filtered.length,
                separatorBuilder: (_, _) => const SizedBox(height: 12),
                itemBuilder: (context, idx) {
                  final item = filtered[idx];
                  return Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: cardBg,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: borderColor),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${item.id}. ${item.name}',
                              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15, color: onSurface),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: isDark ? const Color(0xFF334155) : const Color(0xFFF1F5F9),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(item.category, style: TextStyle(fontSize: 11, color: subColor, fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        _buildMobileFrameworkRow('UX4G', item.ux4gTag, item.ux4gStatus, isDark, const Color(0xFF5B3AE6), note: item.ux4gNote),
                        const SizedBox(height: 8),
                        _buildMobileFrameworkRow('M3', item.m3Name, item.m3Status, isDark, const Color(0xFF7952B3)),
                        const SizedBox(height: 8),
                        _buildMobileFrameworkRow('Cupertino', item.cupertinoName, item.cupertinoStatus, isDark, const Color(0xFF0284C7)),
                        const SizedBox(height: 12),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            item.notes,
                            style: TextStyle(fontSize: 12, color: subColor, height: 1.35),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ],
    );
  }

  Widget _buildSearchField(Color cardBg, Color borderColor, Color onSurface, Color subColor, ValueChanged<String> onChanged) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor),
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Search component name, framework, or category...',
          hintStyle: TextStyle(fontSize: 13, color: subColor),
          prefixIcon: Icon(Icons.search, size: 20, color: subColor),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 11),
        ),
        style: TextStyle(fontSize: 14, color: onSurface),
      ),
    );
  }

  Widget _buildCategoryDropdown(Color cardBg, Color borderColor, Color onSurface) {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _compFilter,
          dropdownColor: cardBg,
          items: const [
            DropdownMenuItem(value: 'all', child: Text('All Components')),
            DropdownMenuItem(value: 'has-ux4g', child: Text('Has UX4G')),
            DropdownMenuItem(value: 'has-m3', child: Text('Has Material 3 (M3)')),
            DropdownMenuItem(value: 'has-cupertino', child: Text('Has Cupertino')),
            DropdownMenuItem(value: 'all-three', child: Text('In All 3 Libraries')),
            DropdownMenuItem(value: 'ux4g-only', child: Text('UX4G Exclusive / Gov')),
            DropdownMenuItem(value: 'only-material', child: Text('Only Material 3 (No Cupertino)')),
            DropdownMenuItem(value: 'only-cupertino', child: Text('Only Cupertino (No M3)')),
          ],
          onChanged: (v) => setState(() => _compFilter = v ?? 'all'),
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: onSurface),
        ),
      ),
    );
  }

  Widget _buildStatusPill(String text, StatusParity status, {String note = '', required bool isDark, required Color accent}) {
    Color iconColor;
    IconData icon;

    switch (status) {
      case StatusParity.yes:
        iconColor = const Color(0xFF10B981);
        icon = Icons.check_circle;
        break;
      case StatusParity.partial:
        iconColor = const Color(0xFFF59E0B);
        icon = Icons.info_outline;
        break;
      case StatusParity.no:
        iconColor = const Color(0xFFF43F5E);
        icon = Icons.cancel;
        break;
    }

    final parts = text.contains('/')
        ? text.split('/').map((s) => s.trim()).toList()
        : [text];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Icon(icon, size: 15, color: iconColor),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Wrap(
                spacing: 4,
                runSpacing: 4,
                children: parts.map((p) {
                  final isNo = status == StatusParity.no;
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                    decoration: BoxDecoration(
                      color: isNo
                          ? (isDark ? const Color(0xFF1E293B) : const Color(0xFFF1F5F9))
                          : (isDark ? accent.withValues(alpha: 0.15) : accent.withValues(alpha: 0.08)),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: isNo
                            ? (isDark ? const Color(0xFF334155) : const Color(0xFFCBD5E1))
                            : accent.withValues(alpha: isDark ? 0.35 : 0.25),
                      ),
                    ),
                    child: Text(
                      p,
                      style: TextStyle(
                        fontSize: 11.5,
                        fontFamily: 'monospace',
                        fontWeight: FontWeight.w600,
                        color: isNo
                            ? (isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B))
                            : accent,
                        height: 1.25,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        if (note.isNotEmpty) ...[
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 21),
            child: Text(
              note,
              style: TextStyle(
                fontSize: 10.5,
                color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildMobileFrameworkRow(
    String frameworkLabel,
    String text,
    StatusParity status,
    bool isDark,
    Color accent, {
    String note = '',
  }) {
    Color iconColor;
    IconData icon;

    switch (status) {
      case StatusParity.yes:
        iconColor = const Color(0xFF10B981);
        icon = Icons.check_circle;
        break;
      case StatusParity.partial:
        iconColor = const Color(0xFFF59E0B);
        icon = Icons.info_outline;
        break;
      case StatusParity.no:
        iconColor = const Color(0xFFF43F5E);
        icon = Icons.cancel;
        break;
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 76,
          child: Text(
            frameworkLabel,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF475569)),
          ),
        ),
        Icon(icon, size: 15, color: iconColor),
        const SizedBox(width: 6),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 11,
                fontFamily: 'monospace',
                fontWeight: FontWeight.w600,
                color: status == StatusParity.no
                    ? (isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B))
                    : accent,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ── TAB 2: Props & API Mapping ─────────────────────────────────────────────

  Widget _buildPropsTab(
    bool isDark,
    Color cardBg,
    Color borderColor,
    Color onSurface,
    Color subColor,
    Color primary,
  ) {
    final uniqueComponents = kFlutterPropsMappingData.map((p) => p.component).toSet().toList()..sort();

    final filtered = kFlutterPropsMappingData.where((p) {
      if (_selectedPropComp != 'all' && p.component != _selectedPropComp) return false;
      final s = _propSearch.toLowerCase().trim();
      if (s.isEmpty) return true;
      final matchText =
          '${p.component} ${p.propGroup} ${p.ux4gProp} ${p.m3Prop} ${p.cupertinoProp} ${p.description}'
              .toLowerCase();
      return matchText.contains(s);
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 16,
          runSpacing: 8,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Props & API Migration Mapping',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: onSurface),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                        color: isDark ? const Color(0xFF1E3A8A).withValues(alpha: 0.5) : const Color(0xFFEFF6FF),
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: isDark ? const Color(0xFF3B82F6).withValues(alpha: 0.4) : const Color(0xFFBFDBFE),
                        ),
                      ),
                      child: Text(
                        '${filtered.length} of ${kFlutterPropsMappingData.length} Props (${uniqueComponents.length} Components)',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: isDark ? const Color(0xFF93C5FD) : const Color(0xFF2563EB),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'Direct prop translation reference between Flutter Material 3, Cupertino, and UX4G Flutter components.',
                  style: TextStyle(fontSize: 14, color: subColor),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),

        // Component Filter Pills Toolbar
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1E293B) : const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: borderColor),
          ),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildPillButton(
                'All Components (${kFlutterPropsMappingData.length})',
                _selectedPropComp == 'all',
                () => setState(() => _selectedPropComp = 'all'),
                isDark,
                primary,
              ),
              ...uniqueComponents.map((comp) {
                final count = kFlutterPropsMappingData.where((p) => p.component == comp).length;
                final isSelected = _selectedPropComp == comp;
                return _buildPillButton(
                  '$comp ($count)',
                  isSelected,
                  () => setState(() => _selectedPropComp = comp),
                  isDark,
                  primary,
                );
              }),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Live Search Input
        Container(
          height: 44,
          decoration: BoxDecoration(
            color: cardBg,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: borderColor),
          ),
          child: TextField(
            onChanged: (val) => setState(() => _propSearch = val),
            decoration: InputDecoration(
              hintText: 'Search prop name, component, or description...',
              hintStyle: TextStyle(fontSize: 13, color: subColor),
              prefixIcon: Icon(Icons.search, size: 20, color: subColor),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 11),
            ),
            style: TextStyle(fontSize: 14, color: onSurface),
          ),
        ),
        const SizedBox(height: 20),

        // Responsive Cards List (100% Horizontal-Scroll Free)
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: filtered.length,
          separatorBuilder: (_, _) => const SizedBox(height: 16),
          itemBuilder: (context, idx) {
            final item = filtered[idx];
            return Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: cardBg,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: borderColor),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.02),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Row: Component + Prop Group
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: primary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Icon(Icons.code, size: 16, color: primary),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            item.component,
                            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16, color: onSurface),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: isDark ? const Color(0xFF1E3A8A).withValues(alpha: 0.4) : const Color(0xFFEFF6FF),
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: isDark ? const Color(0xFF3B82F6).withValues(alpha: 0.4) : const Color(0xFFBFDBFE),
                          ),
                        ),
                        child: Text(
                          item.propGroup,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: isDark ? const Color(0xFF93C5FD) : const Color(0xFF2563EB),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),

                  // 3 Comparative Framework Boxes
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final isWide = constraints.maxWidth >= 760;

                      final ux4gBox = _buildFrameworkPropBox(
                        'UX4G Flutter Prop',
                        item.ux4gProp,
                        const Color(0xFF5B3AE6),
                        isDark,
                      );
                      final m3Box = _buildFrameworkPropBox(
                        'Material 3 Equivalent',
                        item.m3Prop,
                        const Color(0xFF7952B3),
                        isDark,
                      );
                      final cupertinoBox = _buildFrameworkPropBox(
                        'Cupertino Equivalent',
                        item.cupertinoProp,
                        const Color(0xFF0284C7),
                        isDark,
                      );

                      if (isWide) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: ux4gBox),
                            const SizedBox(width: 12),
                            Expanded(child: m3Box),
                            const SizedBox(width: 12),
                            Expanded(child: cupertinoBox),
                          ],
                        );
                      } else {
                        return Column(
                          children: [
                            ux4gBox,
                            const SizedBox(height: 10),
                            m3Box,
                            const SizedBox(height: 10),
                            cupertinoBox,
                          ],
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 12),

                  // Description Bar
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: borderColor),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.info_outline, size: 16, color: Color(0xFF10B981)),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            item.description,
                            style: TextStyle(fontSize: 12, color: subColor, height: 1.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildFrameworkPropBox(String label, String code, Color accent, bool isDark) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: accent.withValues(alpha: isDark ? 0.35 : 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(color: accent, shape: BoxShape.circle),
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: accent),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            code,
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'monospace',
              color: isDark ? const Color(0xFFE2E8F0) : const Color(0xFF1E293B),
              height: 1.35,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPillButton(String text, bool isSelected, VoidCallback onTap, bool isDark, Color primary) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected
              ? primary
              : (isDark ? const Color(0xFF0F172A) : Colors.white),
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: isSelected ? primary : (isDark ? const Color(0xFF334155) : const Color(0xFFCBD5E1)),
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: primary.withValues(alpha: 0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            color: isSelected ? Colors.white : (isDark ? const Color(0xFF94A3B8) : const Color(0xFF475569)),
          ),
        ),
      ),
    );
  }

  // ── TAB 3: Tokens & Theming ────────────────────────────────────────────────

  Widget _buildTokensTab(
    bool isDark,
    Color cardBg,
    Color borderColor,
    Color onSurface,
    Color subColor,
    Color primary,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          'Tokens & Theming Parity',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: onSurface),
        ),
        const SizedBox(height: 4),
        Text(
          'Complete design tokens calibration for Flutter: Colors, Typography Scale, Dimensions/Spacing, and WCAG AA contrast.',
          style: TextStyle(fontSize: 14, color: subColor),
        ),
        const SizedBox(height: 24),

        // Stat Cards Dashboard
        LayoutBuilder(
          builder: (context, constraints) {
            final cardWidth = (constraints.maxWidth - 36) / 4;
            final isWrap = constraints.maxWidth < 800;

            final stats = [
              {
                'title': 'Flutter M3 Parity',
                'pct': '98%',
                'label': 'High Direct Compatibility',
                'desc': 'Near 1:1 prop match with Material 3 component interfaces.',
                'progress': 0.98,
                'icon': Icons.layers_outlined,
              },
              {
                'title': 'Cupertino Parity',
                'pct': '94%',
                'label': 'Cross-Platform Matching',
                'desc': 'Cohesive iOS Cupertino fallback styles and behaviors.',
                'progress': 0.94,
                'icon': Icons.phone_iphone_outlined,
              },
              {
                'title': 'Gov Accessibility',
                'pct': '100%',
                'label': 'WCAG 2.1 AA Compliant',
                'desc': 'Contrast ratios >= 4.5:1 built directly into theme tokens.',
                'progress': 1.0,
                'icon': Icons.accessibility_new_outlined,
              },
              {
                'title': 'Indian Script Scaling',
                'pct': '100%',
                'label': '22 Scheduled Languages',
                'desc': 'Devanagari, Tamil, Telugu, and multilingual text layout support.',
                'progress': 1.0,
                'icon': Icons.translate_outlined,
              },
            ];

            return Wrap(
              spacing: 12,
              runSpacing: 12,
              children: stats.map((st) {
                return Container(
                  width: isWrap ? (constraints.maxWidth - 12) / 2 : cardWidth,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: cardBg,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: borderColor),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(st['title'] as String, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: subColor)),
                          Icon(st['icon'] as IconData, size: 20, color: primary),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        st['pct'] as String,
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: onSurface),
                      ),
                      Text(
                        st['label'] as String,
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xFF10B981)),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        st['desc'] as String,
                        style: TextStyle(fontSize: 11, color: subColor),
                      ),
                      const SizedBox(height: 12),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: LinearProgressIndicator(
                          value: st['progress'] as double,
                          minHeight: 6,
                          backgroundColor: isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0),
                          valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF10B981)),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            );
          },
        ),
        const SizedBox(height: 32),

        // Color Tokens Section
        Text(
          '1. Color Palette Tokens (Ux4gColors.*)',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: onSurface),
        ),
        const SizedBox(height: 12),
        _buildColorTokenTable(isDark, cardBg, borderColor, onSurface, subColor),
        const SizedBox(height: 32),

        // Typography Scale Section
        Text(
          '2. Typography Scale (Ux4gTypography.*)',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: onSurface),
        ),
        const SizedBox(height: 12),
        _buildTypographyTokenTable(isDark, cardBg, borderColor, onSurface, subColor),
      ],
    );
  }

  Widget _buildColorTokenTable(bool isDark, Color cardBg, Color borderColor, Color onSurface, Color subColor) {
    final colors = [
      {'token': 'Ux4gColors.primary', 'm3': 'colorScheme.primary', 'hex': '#5B3AE6', 'role': 'Primary brand actions, buttons, and app bar.'},
      {'token': 'Ux4gColors.secondary', 'm3': 'colorScheme.secondary', 'hex': '#0284C7', 'role': 'Secondary actions, chips, and links.'},
      {'token': 'Ux4gColors.success', 'm3': 'Custom (Color(0xFF10B981))', 'hex': '#10B981', 'role': 'Approved status, verified badges, success toasts.'},
      {'token': 'Ux4gColors.warning', 'm3': 'Custom (Color(0xFFF59E0B))', 'hex': '#F59E0B', 'role': 'Pending review, draft alerts, action required.'},
      {'token': 'Ux4gColors.error', 'm3': 'colorScheme.error', 'hex': '#F43F5E', 'role': 'Validation errors, rejected status, destructive triggers.'},
      {'token': 'Ux4gColors.neutral', 'm3': 'colorScheme.surface', 'hex': '#F8FAFC', 'role': 'Surface backgrounds, card tiles, borders.'},
    ];

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
              border: Border(bottom: BorderSide(color: borderColor)),
            ),
            child: Row(
              children: [
                Expanded(flex: 3, child: Text('UX4G Flutter Token', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: onSurface))),
                Expanded(flex: 2, child: Text('M3 Equivalent', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: subColor))),
                Expanded(flex: 2, child: Text('Hex Preview', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: onSurface))),
                Expanded(flex: 3, child: Text('Role', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: subColor))),
              ],
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: colors.length,
            separatorBuilder: (_, _) => Divider(height: 1, color: borderColor),
            itemBuilder: (context, idx) {
              final c = colors[idx];
              final hex = c['hex'] as String;
              final colorVal = Color(int.parse(hex.replaceFirst('#', '0xFF')));

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        c['token'] as String,
                        style: const TextStyle(fontFamily: 'monospace', fontWeight: FontWeight.bold, fontSize: 12, color: Color(0xFF5B3AE6)),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(c['m3'] as String, style: TextStyle(fontSize: 12, color: subColor)),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Container(
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(
                              color: colorVal,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: Colors.black26),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(hex, style: const TextStyle(fontSize: 12, fontFamily: 'monospace')),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(c['role'] as String, style: TextStyle(fontSize: 12, color: subColor)),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTypographyTokenTable(bool isDark, Color cardBg, Color borderColor, Color onSurface, Color subColor) {
    final styles = [
      {'token': 'Ux4gTypography.displayLarge', 'size': '48px', 'weight': '900 Bold', 'm3': 'textTheme.displayLarge'},
      {'token': 'Ux4gTypography.headlineMedium', 'size': '28px', 'weight': '700 Bold', 'm3': 'textTheme.headlineMedium'},
      {'token': 'Ux4gTypography.titleLarge', 'size': '20px', 'weight': '600 SemiBold', 'm3': 'textTheme.titleLarge'},
      {'token': 'Ux4gTypography.bodyMedium', 'size': '14px', 'weight': '400 Regular', 'm3': 'textTheme.bodyMedium'},
      {'token': 'Ux4gTypography.labelSmall', 'size': '11px', 'weight': '700 Bold', 'm3': 'textTheme.labelSmall'},
    ];

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
              border: Border(bottom: BorderSide(color: borderColor)),
            ),
            child: Row(
              children: [
                Expanded(flex: 3, child: Text('UX4G Typography Token', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: onSurface))),
                Expanded(flex: 2, child: Text('Font Size', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: subColor))),
                Expanded(flex: 2, child: Text('Weight', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: subColor))),
                Expanded(flex: 3, child: Text('Material 3 TextTheme', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: onSurface))),
              ],
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: styles.length,
            separatorBuilder: (_, _) => Divider(height: 1, color: borderColor),
            itemBuilder: (context, idx) {
              final s = styles[idx];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        s['token'] as String,
                        style: const TextStyle(fontFamily: 'monospace', fontWeight: FontWeight.bold, fontSize: 12, color: Color(0xFF5B3AE6)),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(s['size'] as String, style: TextStyle(fontSize: 12, color: onSurface, fontWeight: FontWeight.w600)),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(s['weight'] as String, style: TextStyle(fontSize: 12, color: subColor)),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(s['m3'] as String, style: TextStyle(fontSize: 12, color: subColor)),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // ── TAB 4: Gov-Exclusive Modules ───────────────────────────────────────────

  Widget _buildGovExclusiveTab(
    bool isDark,
    Color cardBg,
    Color borderColor,
    Color onSurface,
    Color subColor,
    Color primary,
  ) {
    final modules = [
      {
        'title': 'Aadhaar Verhoeff Checksum',
        'widget': '<Ux4gAadhaarInputField />',
        'desc': 'Auto-formatting 12 digits (XXXX XXXX XXXX) with UIDAI-compliant Verhoeff checksum algorithm.',
        'icon': Icons.fingerprint,
      },
      {
        'title': 'Income Tax PAN Formatter',
        'widget': '<Ux4gPanInputField />',
        'desc': 'Alphanumeric 10-character ITD PAN card validator with auto-capitalization and regex verification.',
        'icon': Icons.badge_outlined,
      },
      {
        'title': 'Segmented OTP Input',
        'widget': '<Ux4gOtpInput />',
        'desc': 'Segmented 4/6-digit OTP boxes with auto-focus, paste listener, countdown resend timer, and error shake.',
        'icon': Icons.pin_outlined,
      },
      {
        'title': 'Citizen Journey Timeline',
        'widget': '<Ux4gJourneyTimeline />',
        'desc': 'Multi-stage citizen application tracker (Submitted -> Verified -> Approved) with timestamps and badges.',
        'icon': Icons.timeline,
      },
      {
        'title': 'Seva Kendra Slot Grid',
        'widget': '<Ux4gTimeslot />',
        'desc': 'Appointment booking grid (Available, Selected, Booked, Inactive) for citizen kiosk service centres.',
        'icon': Icons.grid_view,
      },
      {
        'title': 'Gov Status Banner',
        'widget': '<Ux4gStatusBanner />',
        'desc': 'Application status alert banner with action triggers (Draft saved, Under review, Action required).',
        'icon': Icons.campaign_outlined,
      },
      {
        'title': 'Citizen Feedback Forms',
        'widget': '<Ux4gFeedbackFormStar />',
        'desc': 'Satisfaction rating widgets with 1-5 Star, CSAT emoji faces, and 0-10 NPS citizen scorecards.',
        'icon': Icons.rate_review_outlined,
      },
      {
        'title': 'Speedometer Gauge Meter',
        'widget': '<Ux4gHalfCircleProgress />',
        'desc': 'Half-circle speedometer gauge for quota utilization, service SLA targets, and citizen metrics.',
        'icon': Icons.speed,
      },
      {
        'title': 'Citizen Document Upload',
        'widget': '<Ux4gFileUpload />',
        'desc': 'Government document upload box with file size validation, mime constraints, and upload progress states.',
        'icon': Icons.upload_file_outlined,
      },
      {
        'title': 'Dotted Pagination Carousel',
        'widget': '<Ux4gPaginationDotted />',
        'desc': 'Compact dotted carousel pagination indicator for mobile onboarding and citizen service awareness.',
        'icon': Icons.more_horiz,
      },
      {
        'title': 'Workflow Status Pipeline',
        'widget': '<Ux4gStatusPipeline />',
        'desc': 'Horizontal and vertical citizen workflow pipeline (Pending -> Processing -> Completed).',
        'icon': Icons.alt_route,
      },
      {
        'title': 'Service Result Row & List',
        'widget': '<Ux4gResultList />',
        'desc': 'Structured government service search results with metadata chips, badges, and quick CTA links.',
        'icon': Icons.list_alt,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Row(
          children: [
            Text(
              'Gov-Exclusive Specialized Modules',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: onSurface),
            ),
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              decoration: BoxDecoration(
                color: const Color(0xFFEFF6FF),
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: const Color(0xFFBFDBFE)),
              ),
              child: Text(
                '${modules.length} Specialized Modules',
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xFF2563EB)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          'Specialized UI widgets engineered for Indian e-Governance workflows with zero external dependencies.',
          style: TextStyle(fontSize: 14, color: subColor),
        ),
        const SizedBox(height: 24),

        // Grid of Modules
        LayoutBuilder(
          builder: (context, constraints) {
            final isDesktop = constraints.maxWidth >= 900;
            final isTablet = constraints.maxWidth >= 600 && !isDesktop;
            final cardW = isDesktop
                ? (constraints.maxWidth - 32) / 3
                : (isTablet ? (constraints.maxWidth - 16) / 2 : constraints.maxWidth);

            return Wrap(
              spacing: 16,
              runSpacing: 16,
              children: modules.map((m) {
                return Container(
                  width: cardW,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: cardBg,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: borderColor),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.03),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: isDark ? const Color(0xFF312E81) : const Color(0xFFEEF2FF),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(m['icon'] as IconData, size: 22, color: primary),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              m['title'] as String,
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: onSurface),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF1F5F9),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          m['widget'] as String,
                          style: TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: primary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        m['desc'] as String,
                        style: TextStyle(fontSize: 13, color: subColor, height: 1.4),
                      ),
                    ],
                  ),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }
}
