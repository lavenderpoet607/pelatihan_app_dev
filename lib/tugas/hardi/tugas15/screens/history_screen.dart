import 'package:flutter/material.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas15/models/absen_model.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas15/screens/map_detail_screen.dart';
import 'package:pelatihan_app_dev/tugas/hardi/tugas15/services/api_service.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final ApiService _apiService = ApiService();

  List<AbsenModel> _history = const [];
  bool _isLoading = true;
  String? _errorMessage;
  String _filter = 'semua';

  static const List<Map<String, String>> _filterOptions = [
    {'key': 'semua', 'label': 'Semua'},
    {'key': 'masuk', 'label': 'Masuk'},
    {'key': 'izin', 'label': 'Izin'},
    {'key': 'selesai', 'label': 'Selesai'},
  ];

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final data = await _apiService.getHistory();
      data.sort((a, b) {
        final ka = a.createdAt ?? '';
        final kb = b.createdAt ?? '';
        return kb.compareTo(ka);
      });
      if (mounted) {
        setState(() {
          _history = data;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = e.toString().replaceFirst('Exception: ', '');
          _isLoading = false;
        });
      }
    }
  }

  List<AbsenModel> get _filtered {
    if (_filter == 'semua') return _history;
    if (_filter == 'masuk') {
      return _history.where((a) => !a.isIzin && !a.sudahPulang).toList();
    }
    if (_filter == 'izin') {
      return _history.where((a) => a.isIzin).toList();
    }
    if (_filter == 'selesai') {
      return _history.where((a) => a.sudahPulang).toList();
    }
    return _history;
  }

  int _hitung(String status) {
    if (status == 'masuk') {
      return _history.where((a) => !a.isIzin && !a.sudahPulang).length;
    }
    if (status == 'izin') {
      return _history.where((a) => a.isIzin).length;
    }
    return _history.where((a) => a.sudahPulang).length;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return RefreshIndicator(
      onRefresh: _loadHistory,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          Row(
            children: [
              Expanded(
                child: _kartuRingkasan(
                  label: 'Masuk',
                  nilai: _hitung('masuk'),
                  warna: const Color(0xFF059669),
                  isDark: isDark,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _kartuRingkasan(
                  label: 'Izin',
                  nilai: _hitung('izin'),
                  warna: const Color(0xFFD97706),
                  isDark: isDark,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _kartuRingkasan(
                  label: 'Selesai',
                  nilai: _hitung('selesai'),
                  warna: const Color(0xFF2563EB),
                  isDark: isDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          SizedBox(
            height: 36,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _filterOptions.length,
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final opsi = _filterOptions[index];
                final aktif = _filter == opsi['key'];
                return ChoiceChip(
                  label: Text(opsi['label'] ?? ''),
                  selected: aktif,
                  onSelected: (_) {
                    setState(() {
                      _filter = opsi['key'] ?? 'semua';
                    });
                  },
                  labelStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: aktif ? FontWeight.bold : FontWeight.normal,
                    color: aktif ? Colors.white : null,
                  ),
                  selectedColor: const Color(0xFF4F46E5),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total ${_filtered.length} catatan',
                style: TextStyle(
                  fontSize: 12,
                  color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
                ),
              ),
              IconButton(
                onPressed: _isLoading ? null : _loadHistory,
                icon: const Icon(Icons.refresh_rounded, size: 20),
                tooltip: 'Muat ulang',
              ),
            ],
          ),
          const SizedBox(height: 4),
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 48),
              child: Center(child: CircularProgressIndicator()),
            )
          else if (_errorMessage != null)
            _kondisiKosong(
              icon: Icons.error_outline_rounded,
              warna: Colors.red,
              judul: 'Gagal memuat riwayat',
              pesan: _errorMessage!,
              aksi: _loadHistory,
              isDark: isDark,
            )
          else if (_filtered.isEmpty)
            _kondisiKosong(
              icon: Icons.inbox_outlined,
              warna: Colors.grey,
              judul: 'Belum ada data',
              pesan:
                  'Riwayat absensi akan muncul setelah Anda melakukan presensi.',
              isDark: isDark,
            )
          else
            ..._filtered.map((absen) => _kartuRiwayat(absen, isDark)),
        ],
      ),
    );
  }

  Widget _kartuRingkasan({
    required String label,
    required int nilai,
    required Color warna,
    required bool isDark,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E293B) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: warna.withValues(alpha: 0.35)),
      ),
      child: Column(
        children: [
          Text(
            '$nilai',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: warna,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(fontSize: 11, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _kartuRiwayat(AbsenModel absen, bool isDark) {
    final warna = absen.isIzin
        ? const Color(0xFFD97706)
        : absen.sudahPulang
            ? const Color(0xFF2563EB)
            : const Color(0xFF059669);

    final ikon = absen.isIzin
        ? Icons.note_alt_outlined
        : absen.sudahPulang
            ? Icons.check_circle_outline_rounded
            : Icons.login_rounded;

    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        leading: CircleAvatar(
          backgroundColor: warna.withValues(alpha: 0.15),
          foregroundColor: warna,
          child: Icon(ikon, size: 20),
        ),
        title: Text(
          '${absen.tanggalFormatted} - ${absen.statusLabel}',
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              'Masuk: ${absen.checkIn ?? '-'}  |  Pulang: ${absen.checkOut ?? '-'}',
              style: const TextStyle(fontSize: 11),
            ),
            const SizedBox(height: 2),
            Text(
              absen.address,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 11,
                color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
              ),
            ),
          ],
        ),
        trailing: const Icon(Icons.chevron_right_rounded, size: 20),
        onTap: () => _bukaDetail(absen),
      ),
    );
  }

  void _bukaDetail(AbsenModel absen) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        final isDark = Theme.of(context).brightness == Brightness.dark;
        final warna = absen.isIzin
            ? const Color(0xFFD97706)
            : absen.sudahPulang
                ? const Color(0xFF2563EB)
                : const Color(0xFF059669);

        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 42,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: warna.withValues(alpha: 0.15),
                    foregroundColor: warna,
                    child: Icon(
                      absen.isIzin
                          ? Icons.note_alt_outlined
                          : Icons.fact_check_outlined,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Detail Absensi',
                          style: TextStyle(
                            fontSize: 11,
                            color: isDark
                                ? Colors.grey.shade400
                                : Colors.grey.shade600,
                          ),
                        ),
                        Text(
                          '${absen.tanggalFormatted} - ${absen.statusLabel}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              _barisDetail(
                icon: Icons.login_rounded,
                label: 'Jam Masuk',
                value: absen.checkIn ?? '-',
                isDark: isDark,
              ),
              _barisDetail(
                icon: Icons.logout_rounded,
                label: 'Jam Pulang',
                value: absen.checkOut ?? '-',
                isDark: isDark,
              ),
              _barisDetail(
                icon: Icons.my_location_outlined,
                label: 'Koordinat',
                value:
                    '${absen.latitude.toStringAsFixed(6)}, ${absen.longitude.toStringAsFixed(6)}',
                isDark: isDark,
              ),
              _barisDetail(
                icon: Icons.location_on_outlined,
                label: 'Alamat',
                value: absen.address,
                isDark: isDark,
              ),
              if (absen.alasanIzin != null)
                _barisDetail(
                  icon: Icons.description_outlined,
                  label: 'Alasan Izin',
                  value: absen.alasanIzin!,
                  isDark: isDark,
                ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    final nav = Navigator.of(this.context);
                    Navigator.pop(context);
                    nav.push(
                      MaterialPageRoute(
                        builder: (_) => MapDetailScreen(
                          latitude: absen.latitude,
                          longitude: absen.longitude,
                          title: 'Lokasi Absensi',
                          address: absen.address,
                          time:
                              '${absen.tanggalFormatted} ${absen.jamFormatted}',
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.map_outlined, size: 18),
                  label: const Text('Lihat Peta Lokasi'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4F46E5),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _barisDetail({
    required IconData icon,
    required String label,
    required String value,
    required bool isDark,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 17, color: const Color(0xFF4F46E5)),
          const SizedBox(width: 10),
          SizedBox(
            width: 90,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _kondisiKosong({
    required IconData icon,
    required Color warna,
    required String judul,
    required String pesan,
    required bool isDark,
    Future<void> Function()? aksi,
  }) {    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E293B) : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, size: 42, color: warna),
          const SizedBox(height: 12),
          Text(
            judul,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(
            pesan,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          if (aksi != null) ...[
            const SizedBox(height: 14),
            OutlinedButton.icon(
              onPressed: () => aksi(),
              icon: const Icon(Icons.refresh_rounded, size: 18),
              label: const Text('Coba Lagi'),
            ),
          ],
        ],
      ),
    );
  }
}
