@echo off
echo Building Widgetbook Web Release without Icon Tree Shaking...
flutter clean
flutter pub get
flutter build web -t lib/widgetbook.dart --no-tree-shake-icons --release
echo Build Complete! Output folder: build\web
pause
