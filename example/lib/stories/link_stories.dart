import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:widgetbook/widgetbook.dart';
import '../widgets/component_docs.dart';

// --- Helper for Widgetbook Examples ---
class _StoryLinkItem extends StatefulWidget {
  final String text;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final Color baseColor;

  const _StoryLinkItem({
    required this.text,
    this.leadingIcon,
    this.trailingIcon,
    required this.baseColor,
  });

  @override
  State<_StoryLinkItem> createState() => _StoryLinkItemState();
}

class _StoryLinkItemState extends State<_StoryLinkItem> {
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final color = _isPressed
        ? widget.baseColor.withOpacity(0.7)
        : widget.baseColor;
    
    final textStyle = TextStyle(
      color: color,
      fontWeight: FontWeight.w500,
      decoration: _isHovered ? TextDecoration.underline : TextDecoration.none,
      decorationColor: color,
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        child: Ux4gLink(
          url: 'https://ux4g.gov.in',
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.leadingIcon != null) ...[
                Icon(widget.leadingIcon, color: color, size: 16),
                const SizedBox(width: 4),
              ],
              Text(widget.text, style: textStyle),
              if (widget.trailingIcon != null) ...[
                const SizedBox(width: 4),
                Icon(widget.trailingIcon, color: color, size: 16),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// ----------------------------------------

final linkIntroductionComponent = WidgetbookComponent(
  name: 'Introduction',
  useCases: [
    WidgetbookUseCase(
      name: 'Introduction',
      builder: (context) {
        return ComponentDocs(
          name: 'Link',
          description:
              'A link is an interactive, clickable element, usually text or an icon, that directs users to another page, website, or a specific section within the same page, acting as a fundamental tool for navigation and accessing more information.',
          showPreview: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Example',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              const _StoryLinkItem(
                text: 'Visit UX4G',
                baseColor: Color(0xFF4F46E5), // Indigo
                trailingIcon: Icons.open_in_new,
              ),
            ],
          ),
        );
      },
    ),
  ],
);

const _linkProps = [
  PropRow(
    name: 'url',
    type: 'String',
    description: 'The URL to be opened in the browser.',
    required: true,
  ),
  PropRow(
    name: 'child',
    type: 'Widget',
    description: 'The widget that the user will tap on to open the link.',
    required: true,
  ),
];

final linkDefaultComponent = WidgetbookComponent(
  name: 'Default',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        return ComponentDocs(
          name: 'Link',
          description: 'A basic link wrapping text, which opens a URL when clicked.',
          code: '''Ux4gLink(
  url: 'https://ux4g.gov.in',
  child: Text(
    'Visit UX4G',
    style: TextStyle(
      color: Color(0xFF4F46E5),
      decoration: TextDecoration.underline,
    ),
  ),
);''',
          props: _linkProps,
          child: const _StoryLinkItem(
            text: 'Visit UX4G',
            baseColor: Color(0xFF4F46E5),
          ),
        );
      },
    ),
  ],
);

final linkVariantsComponent = WidgetbookComponent(
  name: 'Variants',
  useCases: [
    WidgetbookUseCase(
      name: 'Variants',
      builder: (context) {
        return ComponentDocs(
          name: 'Link Variants',
          description: 'Link states with various colors (Default, Neutral, Visited) and icon configurations.',
          code: '''// Example: Link with Trailing Icon
Ux4gLink(
  url: 'https://ux4g.gov.in',
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text('Link', style: TextStyle(color: Color(0xFF4F46E5))),
      SizedBox(width: 4),
      Icon(Icons.open_in_new, color: Color(0xFF4F46E5), size: 16),
    ],
  ),
);

// Example: Neutral Link with Leading Icon
Ux4gLink(
  url: 'https://ux4g.gov.in',
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.open_in_new, color: Color(0xFF4B5563), size: 16),
      SizedBox(width: 4),
      Text('Link', style: TextStyle(color: Color(0xFF4B5563))),
    ],
  ),
);''',
          child: Table(
            defaultColumnWidth: const IntrinsicColumnWidth(),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              _buildHeaderRow(),
              _buildVariantRows('Default', const Color(0xFF4F46E5)),
              _buildVariantRows('Neutral', const Color(0xFF4B5563)),
              _buildVariantRows('Visited', const Color(0xFF7C3AED)),
            ],
          ),
        );
      },
    ),
  ],
);

TableRow _buildHeaderRow() {
  return const TableRow(
    children: [
      Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('Examples', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    ],
  );
}

TableRow _buildVariantRows(String title, Color color) {
  return TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          spacing: 24,
          runSpacing: 16,
          children: [
            _StoryLinkItem(text: 'Link', baseColor: color),
            _StoryLinkItem(text: 'Link', trailingIcon: Icons.open_in_new, baseColor: color),
            _StoryLinkItem(text: 'Link', leadingIcon: Icons.open_in_new, baseColor: color),
            _StoryLinkItem(text: '...', baseColor: color),
          ],
        ),
      ),
    ],
  );
}
