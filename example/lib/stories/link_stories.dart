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
  final double fontSize;
  final bool enabled;

  const _StoryLinkItem({
    super.key,
    required this.text,
    this.leadingIcon,
    this.trailingIcon,
    required this.baseColor,
    this.fontSize = 14.0,
    this.enabled = true,
  });

  @override
  State<_StoryLinkItem> createState() => _StoryLinkItemState();
}

class _StoryLinkItemState extends State<_StoryLinkItem> {
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) {
      final disabledColor = const Color(0xFFD1D5DB);
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.leadingIcon != null) ...[
            Icon(widget.leadingIcon, color: disabledColor, size: widget.fontSize + 2),
            const SizedBox(width: 4),
          ],
          Text(
            widget.text,
            style: TextStyle(
              color: disabledColor,
              fontSize: widget.fontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (widget.trailingIcon != null) ...[
            const SizedBox(width: 4),
            Icon(widget.trailingIcon, color: disabledColor, size: widget.fontSize + 2),
          ],
        ],
      );
    }

    final color = _isPressed
        ? widget.baseColor.withOpacity(0.7)
        : widget.baseColor;
    
    final textStyle = TextStyle(
      color: color,
      fontSize: widget.fontSize,
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
                Icon(widget.leadingIcon, color: color, size: widget.fontSize + 2),
                const SizedBox(width: 4),
              ],
              Text(widget.text, style: textStyle),
              if (widget.trailingIcon != null) ...[
                const SizedBox(width: 4),
                Icon(widget.trailingIcon, color: color, size: widget.fontSize + 2),
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
        const defaultColor = Color(0xFF7C3AED); // Purple
        const neutralColor = Color(0xFF4B5563); // Dark neutral grey

        return ComponentDocs(
          name: 'Link',
          description:
              'A link is an interactive, clickable element, usually text or an icon, that directs users to another page, website, or a specific section within the same page, acting as a fundamental tool for navigation and accessing more information.',
          showPreview: false,
          child: Container(
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: const Color(0xFFF9FAFB),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Visual Showcase',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Demonstration of default and neutral link styles with various sizes, icons, and states.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 24),

                // 1. Default Examples
                Text(
                  'Default Examples',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: const Color(0xFFE5E7EB)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.02),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Wrap(
                    spacing: 32,
                    runSpacing: 16,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      _StoryLinkItem(text: 'Medium Link', fontSize: 15, baseColor: defaultColor),
                      _StoryLinkItem(text: 'Small Link', fontSize: 13, baseColor: defaultColor),
                      _StoryLinkItem(text: 'Leading Icon', leadingIcon: Icons.open_in_new, fontSize: 15, baseColor: defaultColor),
                      _StoryLinkItem(text: 'Trailing Icon', trailingIcon: Icons.open_in_new, fontSize: 15, baseColor: defaultColor),
                      _StoryLinkItem(text: 'Default Link Disabled', enabled: false, fontSize: 15, baseColor: defaultColor),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // 2. Neutral Examples
                Text(
                  'Neutral Examples',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: const Color(0xFFE5E7EB)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.02),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Wrap(
                    spacing: 32,
                    runSpacing: 16,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      _StoryLinkItem(text: 'Neutral Medium', fontSize: 15, baseColor: neutralColor),
                      _StoryLinkItem(text: 'Neutral Small', fontSize: 13, baseColor: neutralColor),
                      _StoryLinkItem(text: 'Leading Icon', leadingIcon: Icons.open_in_new, fontSize: 15, baseColor: neutralColor),
                      _StoryLinkItem(text: 'Trailing Icon', trailingIcon: Icons.open_in_new, fontSize: 15, baseColor: neutralColor),
                      _StoryLinkItem(text: 'Neutral Link Disabled', enabled: false, fontSize: 15, baseColor: neutralColor),
                    ],
                  ),
                ),
              ],
            ),
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
