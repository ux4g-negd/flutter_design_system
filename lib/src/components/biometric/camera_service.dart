import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';

/// Service responsible for managing the device camera.
class CameraService {
  CameraController? _controller;
  List<CameraDescription>? _cameras;
  bool _isInitialized = false;
  bool _isStreaming = false;
  bool _isDisposed = false;

  CameraController? get controller => _controller;
  bool get isInitialized => _isInitialized && !_isDisposed;
  bool get isStreaming => _isStreaming && !_isDisposed;
  bool get isDisposed => _isDisposed;

  /// Discover available cameras and find the front camera.
  Future<CameraDescription?> _getFrontCamera() async {
    if (_isDisposed) return null;
    _cameras ??= await availableCameras();
    if (_cameras == null || _cameras!.isEmpty || _isDisposed) return null;
    try {
      return _cameras!.firstWhere(
        (c) => c.lensDirection == CameraLensDirection.front,
      );
    } catch (_) {
      return null;
    }
  }

  /// Check if a front camera is available.
  Future<bool> isCameraAvailable() async {
    if (_isDisposed) return false;
    final cam = await _getFrontCamera();
    return cam != null && !_isDisposed;
  }

  /// Initialize the front camera.
  Future<void> initialize() async {
    if (_isDisposed) return;
    final cam = await _getFrontCamera();
    if (cam == null || _isDisposed) throw Exception('No front camera available');

    _controller = CameraController(
      cam,
      ResolutionPreset.medium,
      enableAudio: false,
      imageFormatGroup: defaultTargetPlatform == TargetPlatform.iOS
          ? ImageFormatGroup.bgra8888
          : ImageFormatGroup.nv21,
    );

    await _controller!.initialize();
    if (_isDisposed) {
      await _controller?.dispose();
      _controller = null;
      return;
    }
    _isInitialized = true;
  }

  /// Start the image stream. Callback receives each frame.
  void startImageStream(void Function(CameraImage image) onImage) {
    if (_isDisposed || _controller == null || !_isInitialized || _isStreaming) return;
    _controller!.startImageStream((image) {
      if (_isDisposed) return;
      onImage(image);
    });
    _isStreaming = true;
  }

  /// Stop the image stream.
  Future<void> stopImageStream() async {
    if (!_isStreaming || _controller == null) return;
    try {
      await _controller!.stopImageStream();
    } catch (_) {}
    _isStreaming = false;
  }

  /// Pause the camera preview stream.
  Future<void> pausePreview() async {
    if (_isDisposed || _controller == null || !_isInitialized) return;
    try {
      await _controller!.pausePreview();
    } catch (_) {}
  }

  /// Resume the camera preview stream.
  Future<void> resumePreview() async {
    if (_isDisposed || _controller == null || !_isInitialized) return;
    try {
      await _controller!.resumePreview();
    } catch (_) {}
  }

  /// Take a picture and return the bytes.
  Future<Uint8List?> captureImage() async {
    if (_isDisposed || _controller == null || !_isInitialized) return null;
    if (_isStreaming) await stopImageStream();
    if (_isDisposed || _controller == null) return null;
    final file = await _controller!.takePicture();
    return file.readAsBytes();
  }

  /// Dispose the camera controller.
  Future<void> dispose() async {
    if (_isDisposed) return;
    _isDisposed = true;
    _isInitialized = false;
    if (_isStreaming) {
      await stopImageStream();
    }
    try {
      await _controller?.dispose();
    } catch (_) {}
    _controller = null;
    _isStreaming = false;
  }
}
