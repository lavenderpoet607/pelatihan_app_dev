import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pelatihan_app_dev/main.dart';
import 'package:pelatihan_app_dev/tugas/tugas_code_repository.dart';

class HalamanScreenshotTugas extends StatefulWidget {
  final AppMenuItem item;
  final String namaSiswa;

  const HalamanScreenshotTugas({
    super.key,
    required this.item,
    this.namaSiswa = 'Ridho_Tawang',
  });

  @override
  State<HalamanScreenshotTugas> createState() => _HalamanScreenshotTugasState();
}

class _HalamanScreenshotTugasState extends State<HalamanScreenshotTugas> {
  final GlobalKey _captureKey = GlobalKey();
  int _selectedMode = 0;
  bool _isCapturing = false;
  Uint8List? _capturedBytes;
  String? _savedLocation;

  String get fileName {
    return TugasCodeRepository.getFileName(
      nomor: widget.item.nomorTugas ?? '00',
      pembuat: widget.item.pembuat ?? 'Hardi',
      namaSiswa: widget.namaSiswa,
    );
  }

  String get sourceCode {
    return TugasCodeRepository.getSourceCode(
      widget.item.nomorTugas ?? '00',
      widget.item.pembuat ?? 'Hardi',
    );
  }

  Future<void> _captureScreenshot() async {
    setState(() {
      _isCapturing = true;
    });

    try {
      await Future.delayed(const Duration(milliseconds: 300));
      final boundary =
          _captureKey.currentContext?.findRenderObject()
              as RenderRepaintBoundary?;

      if (boundary == null) {
        throw Exception('RenderRepaintBoundary tidak ditemukan.');
      }

      final ui.Image image = await boundary.toImage(pixelRatio: 2.0);
      final ByteData? byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );

      if (byteData == null) {
        throw Exception('Gagal mengonversi gambar ke PNG.');
      }

      final Uint8List bytes = byteData.buffer.asUint8List();
      _capturedBytes = bytes;

      final targetFileName = fileName;
      final List<String> candidateFolders = [
        '/storage/emulated/0/Download',
        '/sdcard/Download',
        '/storage/emulated/0/Pictures',
        '/sdcard/Pictures',
        Directory.systemTemp.path,
      ];

      String? successfulPath;
      for (final folder in candidateFolders) {
        try {
          final dir = Directory(folder);
          if (!dir.existsSync()) {
            dir.createSync(recursive: true);
          }
          final filePath = '$folder/$targetFileName';
          final file = File(filePath);
          await file.writeAsBytes(bytes);
          successfulPath = filePath;
          break;
        } catch (_) {}
      }

      _savedLocation = successfulPath ?? '/Download/$targetFileName';

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Screenshot tersimpan: $targetFileName'),
          backgroundColor: const Color(0xFF0D9488),
          behavior: SnackBarBehavior.floating,
          action: SnackBarAction(
            label: 'Lihat',
            textColor: Colors.white,
            onPressed: () => _showPreviewDialog(),
          ),
        ),
      );

      _showPreviewDialog();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal capture screenshot: $e'),
          backgroundColor: Colors.redAccent,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isCapturing = false;
        });
      }
    }
  }

  void _showPreviewDialog() {
    if (_capturedBytes == null) return;

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500, maxHeight: 650),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.check_circle_rounded,
                      color: Color(0xFF0D9488),
                      size: 26,
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        'Screenshot Berhasil Disimpan',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close_rounded),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F5F9),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Nama File Screenshot:',
                        style: TextStyle(fontSize: 11, color: Colors.blueGrey),
                      ),
                      const SizedBox(height: 2),
                      SelectableText(
                        fileName,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Lokasi: ${_savedLocation ?? ""}',
                        style: const TextStyle(
                          fontSize: 11,
                          color: Color(0xFF64748B),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      color: Colors.black12,
                      child: Image.memory(_capturedBytes!, fit: BoxFit.contain),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                ElevatedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.done_all_rounded),
                  label: const Text('Selesai'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0D9488),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: Text(
          'Screenshot: ${widget.item.title}',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF0F172A),
        elevation: 0.5,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: ElevatedButton.icon(
              onPressed: _isCapturing ? null : _captureScreenshot,
              icon: _isCapturing
                  ? const SizedBox(
                      width: 14,
                      height: 14,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Icon(Icons.camera_alt_rounded, size: 18),
              label: Text(
                _isCapturing ? 'Menyimpan...' : 'Screenshot Otomatis',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0D9488),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: SegmentedButton<int>(
                    segments: const [
                      ButtonSegment(
                        value: 0,
                        icon: Icon(Icons.dashboard_rounded, size: 16),
                        label: Text('Gabungan (UI + Kode)'),
                      ),
                      ButtonSegment(
                        value: 1,
                        icon: Icon(Icons.phone_android_rounded, size: 16),
                        label: Text('UI Saja'),
                      ),
                      ButtonSegment(
                        value: 2,
                        icon: Icon(Icons.code_rounded, size: 16),
                        label: Text('Kode Saja'),
                      ),
                    ],
                    selected: {_selectedMode},
                    onSelectionChanged: (set) {
                      setState(() {
                        _selectedMode = set.first;
                      });
                    },
                    style: ButtonStyle(
                      textStyle: WidgetStateProperty.all(
                        const TextStyle(fontSize: 11),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: const Color(0xFF0F172A),
            child: Row(
              children: [
                const Icon(
                  Icons.insert_drive_file_outlined,
                  size: 16,
                  color: Colors.tealAccent,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    fileName,
                    style: const TextStyle(
                      color: Colors.tealAccent,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'monospace',
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(20),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    'Format Standar Tugas',
                    style: TextStyle(color: Colors.white70, fontSize: 10),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: RepaintBoundary(
                  key: _captureKey,
                  child: _buildCaptureContent(),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _isCapturing ? null : _captureScreenshot,
        backgroundColor: const Color(0xFF0D9488),
        foregroundColor: Colors.white,
        icon: const Icon(Icons.camera_alt_rounded),
        label: Text(
          _isCapturing ? 'Memproses...' : 'Simpan: $fileName',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildCaptureContent() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 720),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF0B1120),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildSubmissionHeader(),
          const SizedBox(height: 20),
          if (_selectedMode == 0) ...[
            _buildUIFrame(),
            const SizedBox(height: 24),
            _buildCodeFrame(),
          ] else if (_selectedMode == 1) ...[
            _buildUIFrame(),
          ] else ...[
            _buildCodeFrame(),
          ],
          const SizedBox(height: 16),
          _buildSubmissionFooter(),
        ],
      ),
    );
  }

  Widget _buildSubmissionHeader() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withAlpha(25)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: widget.item.color.withAlpha(40),
            child: Icon(widget.item.icon, color: widget.item.color, size: 30),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: widget.item.color.withAlpha(30),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: widget.item.color.withAlpha(80),
                        ),
                      ),
                      child: Text(
                        'TUGAS ${widget.item.nomorTugas ?? "00"}',
                        style: TextStyle(
                          color: widget.item.color,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Lembar Pengumpulan Tugas',
                        style: TextStyle(
                          color: Colors.white.withAlpha(180),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  widget.item.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Wrap(
                  spacing: 12,
                  runSpacing: 4,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.person_rounded,
                          size: 14,
                          color: Colors.tealAccent,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Siswa: Ridho Dibaja Tawang',
                          style: TextStyle(
                            color: Colors.tealAccent,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.school_rounded,
                          size: 14,
                          color: Colors.white70,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Instruktur: ${widget.item.pembuat ?? "Hardi"}',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUIFrame() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF020617),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withAlpha(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFF0F172A),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(18),
              ),
              border: Border(
                bottom: BorderSide(color: Colors.white.withAlpha(15)),
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.phone_android_rounded,
                  color: Colors.tealAccent,
                  size: 16,
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'TAMPILAN UI APLIKASI (LIVE PREVIEW)',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.tealAccent.withAlpha(25),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Aktif / Live',
                    style: TextStyle(
                      color: Colors.tealAccent,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Container(
                width: 360,
                height: 600,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: const Color(0xFF334155), width: 3),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 18,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(21),
                  child: widget.item.page,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCodeFrame() {
    final code = sourceCode;
    final codeLines = code.split('\n');

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withAlpha(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFF252526),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(18),
              ),
              border: Border(
                bottom: BorderSide(color: Colors.white.withAlpha(15)),
              ),
            ),
            child: Row(
              children: [
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFF5F56),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFBD2E),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        color: Color(0xFF27C93F),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                const Icon(
                  Icons.terminal_rounded,
                  color: Colors.lightBlueAccent,
                  size: 16,
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'SELURUH KODE SUMBER (FULL SOURCE CODE)',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '${codeLines.length} Baris',
                  style: const TextStyle(color: Colors.white60, fontSize: 11),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < codeLines.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 44,
                          child: Text(
                            '${i + 1}',
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              color: Color(0xFF6E7681),
                              fontSize: 11,
                              fontFamily: 'monospace',
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Text(
                            codeLines[i].isEmpty ? ' ' : codeLines[i],
                            style: TextStyle(
                              color: _getCodeLineColor(codeLines[i]),
                              fontSize: 11,
                              fontFamily: 'monospace',
                              height: 1.3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getCodeLineColor(String line) {
    final trimmed = line.trim();
    if (trimmed.startsWith('import ') || trimmed.startsWith('export ')) {
      return const Color(0xFFC586C0);
    }
    if (trimmed.startsWith('class ') ||
        trimmed.startsWith('enum ') ||
        trimmed.startsWith('extension ')) {
      return const Color(0xFF4EC9B0);
    }
    if (trimmed.startsWith('@override')) {
      return const Color(0xFF9CDCFE);
    }
    if (trimmed.startsWith('return ') ||
        trimmed.startsWith('if ') ||
        trimmed.startsWith('else ') ||
        trimmed.startsWith('final ') ||
        trimmed.startsWith('const ')) {
      return const Color(0xFF569CD6);
    }
    if (trimmed.contains('TextStyle(') ||
        trimmed.contains('BoxDecoration(') ||
        trimmed.contains('BorderRadius.') ||
        trimmed.contains('EdgeInsets.')) {
      return const Color(0xFFDCDCAA);
    }
    return const Color(0xFFD4D4D4);
  }

  Widget _buildSubmissionFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withAlpha(15)),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.verified_user_rounded,
            size: 16,
            color: Colors.tealAccent,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Otomatis digenerate untuk: $fileName',
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 11,
                fontFamily: 'monospace',
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            DateTime.now().toString().substring(0, 19),
            style: const TextStyle(color: Colors.white38, fontSize: 11),
          ),
        ],
      ),
    );
  }
}
