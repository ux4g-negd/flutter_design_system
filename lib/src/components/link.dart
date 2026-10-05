import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// A component that wraps a given [child] widget and opens a [url]
/// in the device's browser when tapped.
class Ux4gLink extends StatelessWidget {
  /// The widget that the user will tap on to open the link.
  final Widget child;

  /// The URL to be opened in the browser.
  final String url;

  /// Accessibility label for the link.
  final String? semanticLabel;

  const Ux4gLink({
    super.key,
    required this.child,
    required this.url,
    this.semanticLabel,
  });

  Future<void> _launchUrl() async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      link: true,
      label: semanticLabel ?? url,
      child: GestureDetector(
        onTap: _launchUrl,
        behavior: HitTestBehavior.opaque,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: child,
        ),
      ),
    );
  }
}
