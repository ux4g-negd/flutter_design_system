// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:convert';

void downloadMarkdownFile(String filename, String content) {
  try {
    final bytes = utf8.encode(content);
    final blob = html.Blob([bytes], 'text/markdown;charset=utf-8');
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', filename)
      ..style.display = 'none';
    
    html.document.body?.children.add(anchor);
    anchor.click();
    html.document.body?.children.remove(anchor);
    html.Url.revokeObjectUrl(url);
  } catch (e) {
    // fallback
  }
}
