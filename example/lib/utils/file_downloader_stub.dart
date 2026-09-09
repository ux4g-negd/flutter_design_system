import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

void downloadMarkdownFile(String filename, String content) async {
  try {
    final uri = Uri.dataFromString(
      content,
      mimeType: 'text/markdown',
      encoding: utf8,
    );
    await launchUrl(uri);
  } catch (e) {
    // fallback
  }
}
