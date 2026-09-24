import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pelatihan_app_dev/penjelasan/halaman_penjelasan.dart';
import 'package:pelatihan_app_dev/penjelasan/penjelasan_data.dart';

class LatihanGoogleMaps extends StatefulWidget {
  const LatihanGoogleMaps({super.key});

  @override
  State<LatihanGoogleMaps> createState() => _LatihanGoogleMapsState();
}

class _LatihanGoogleMapsState extends State<LatihanGoogleMaps> {
  GoogleMapController? _mapController;
  MapType _currentMapType = MapType.normal;
  bool _trafficEnabled = false;
  Map<String, dynamic>? _selectedPlace;

  static const LatLng _monasPos = LatLng(-6.175392, 106.827153);
  static const LatLng _istiqlalPos = LatLng(-6.1702, 106.8315);
  static const LatLng _kotaTuaPos = LatLng(-6.1376, 106.8126);
  static const LatLng _gbkPos = LatLng(-6.2183, 106.8026);
  static const LatLng _bundaranHiPos = LatLng(-6.1950, 106.8230);

  final List<Map<String, dynamic>> _places = [
    {
      'id': 'monas',
      'name': 'Monumen Nasional (Monas)',
      'category': 'Ikon Bersejarah',
      'latLng': _monasPos,
      'hue': BitmapDescriptor.hueRed,
      'description': 'Monumen peringatan setinggi 132 meter yang didirikan untuk mengenang perlawanan dan perjuangan rakyat Indonesia.',
      'icon': Icons.account_balance_rounded,
    },
    {
      'id': 'istiqlal',
      'name': 'Masjid Istiqlal',
      'category': 'Tempat Ibadah & Wisata',
      'latLng': _istiqlalPos,
      'hue': BitmapDescriptor.hueGreen,
      'description': 'Masjid terbesar di Asia Tenggara dan masjid ke-6 terbesar di dunia yang berdiri megah di pusat Jakarta.',
      'icon': Icons.mosque_rounded,
    },
    {
      'id': 'kota_tua',
      'name': 'Kota Tua Jakarta',
      'category': 'Cagar Budaya & Museum',
      'latLng': _kotaTuaPos,
      'hue': BitmapDescriptor.hueOrange,
      'description': 'Kawasan bersejarah bernuansa kolonial dengan berbagai museum terkemuka seperti Museum Fatahillah.',
      'icon': Icons.museum_rounded,
    },
    {
      'id': 'gbk',
      'name': 'Stadion Utama Gelora Bung Karno',
      'category': 'Pusat Olahraga Nasional',
      'latLng': _gbkPos,
      'hue': BitmapDescriptor.hueViolet,
      'description': 'Kompleks gelanggang olahraga serbaguna terbesar di Indonesia yang kerap menjadi saksi ajang internasional.',
      'icon': Icons.sports_soccer_rounded,
    },
    {
      'id': 'bundaran_hi',
      'name': 'Bundaran Hotel Indonesia',
      'category': 'Monumen & Landmark Kota',
      'latLng': _bundaranHiPos,
      'hue': BitmapDescriptor.hueAzure,
      'description': 'Pusat kegiatan perkotaan Jakarta yang dikelilingi gedung pencakar langit dan Monumen Selamat Datang.',
      'icon': Icons.location_city_rounded,
    },
  ];

  late final Set<Marker> _markers;
  late final Set<Circle> _circles;
  late final Set<Polyline> _polylines;

  @override
  void initState() {
    super.initState();
    _initMapElements();
  }

  void _initMapElements() {
    _markers = _places.map((place) {
      final LatLng pos = place['latLng'] as LatLng;
      final String name = place['name'] as String;
      final String cat = place['category'] as String;
      final double hue = place['hue'] as double;

      return Marker(
        markerId: MarkerId(place['id'] as String),
        position: pos,
        icon: BitmapDescriptor.defaultMarkerWithHue(hue),
        infoWindow: InfoWindow(
          title: name,
          snippet: cat,
          onTap: () {
            _onSelectPlace(place);
          },
        ),
        onTap: () {
          _onSelectPlace(place);
        },
      );
    }).toSet();

    _circles = {
      Circle(
        circleId: const CircleId('monas_radius'),
        center: _monasPos,
        radius: 400,
        fillColor: Colors.redAccent.withValues(alpha: 0.15),
        strokeColor: Colors.redAccent,
        strokeWidth: 2,
      ),
    };

    _polylines = {
      Polyline(
        polylineId: const PolylineId('rute_monas_hi'),
        points: const [
          _monasPos,
          LatLng(-6.1820, 106.8240),
          LatLng(-6.1880, 106.8235),
          _bundaranHiPos,
        ],
        color: Colors.blueAccent,
        width: 4,
        patterns: [PatternItem.dash(20), PatternItem.gap(10)],
      ),
    };
  }

  void _onSelectPlace(Map<String, dynamic> place) {
    setState(() {
      _selectedPlace = place;
    });
    _mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: place['latLng'] as LatLng, zoom: 15.5, tilt: 45),
      ),
    );
  }

  void _zoomIn() {
    _mapController?.animateCamera(CameraUpdate.zoomIn());
  }

  void _zoomOut() {
    _mapController?.animateCamera(CameraUpdate.zoomOut());
  }

  void _resetCamera() {
    setState(() {
      _selectedPlace = null;
    });
    _mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        const CameraPosition(
          target: _monasPos,
          zoom: 14.0,
          tilt: 0,
          bearing: 0,
        ),
      ),
    );
  }

  void _changeMapType(MapType type) {
    setState(() {
      _currentMapType = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          'Latihan Google Maps',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal.shade700,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu_book_rounded),
            tooltip: 'Penjelasan Materi',
            onPressed: () {
              final item = cariPenjelasanItem('Latihan Google Maps');
              if (item != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HalamanPenjelasan(item: item),
                  ),
                );
              }
            },
          ),
          PopupMenuButton<MapType>(
            icon: const Icon(Icons.layers_rounded),
            tooltip: 'Tipe Peta',
            onSelected: _changeMapType,
            itemBuilder: (context) => [
              PopupMenuItem(
                value: MapType.normal,
                child: Row(
                  children: [
                    Icon(
                      Icons.map_rounded,
                      color: _currentMapType == MapType.normal
                          ? Colors.teal
                          : Colors.grey,
                    ),
                    const SizedBox(width: 8),
                    const Text('Normal'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: MapType.satellite,
                child: Row(
                  children: [
                    Icon(
                      Icons.satellite_alt_rounded,
                      color: _currentMapType == MapType.satellite
                          ? Colors.teal
                          : Colors.grey,
                    ),
                    const SizedBox(width: 8),
                    const Text('Satelit'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: MapType.terrain,
                child: Row(
                  children: [
                    Icon(
                      Icons.terrain_rounded,
                      color: _currentMapType == MapType.terrain
                          ? Colors.teal
                          : Colors.grey,
                    ),
                    const SizedBox(width: 8),
                    const Text('Terrain'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: MapType.hybrid,
                child: Row(
                  children: [
                    Icon(
                      Icons.public_rounded,
                      color: _currentMapType == MapType.hybrid
                          ? Colors.teal
                          : Colors.grey,
                    ),
                    const SizedBox(width: 8),
                    const Text('Hybrid'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: _monasPos,
              zoom: 14.0,
            ),
            mapType: _currentMapType,
            markers: _markers,
            circles: _circles,
            polylines: _polylines,
            trafficEnabled: _trafficEnabled,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            compassEnabled: true,
            mapToolbarEnabled: true,
            onMapCreated: (controller) {
              _mapController = controller;
            },
            onTap: (_) {
              if (_selectedPlace != null) {
                setState(() {
                  _selectedPlace = null;
                });
              }
            },
          ),
          Positioned(
            top: 12,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 42,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _places.length,
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final place = _places[index];
                  final isSelected = _selectedPlace?['id'] == place['id'];

                  return ActionChip(
                    avatar: Icon(
                      place['icon'] as IconData,
                      size: 18,
                      color: isSelected ? Colors.white : Colors.teal.shade800,
                    ),
                    label: Text(
                      place['name'] as String,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.w600,
                        color: isSelected ? Colors.white : Colors.black87,
                      ),
                    ),
                    backgroundColor: isSelected
                        ? Colors.teal.shade700
                        : Colors.white.withValues(alpha: 0.95),
                    elevation: 2,
                    pressElevation: 4,
                    shadowColor: Colors.black26,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: isSelected
                            ? Colors.teal.shade700
                            : Colors.grey.shade300,
                      ),
                    ),
                    onPressed: () => _onSelectPlace(place),
                  );
                },
              ),
            ),
          ),
          Positioned(
            right: 16,
            bottom: _selectedPlace != null ? 220 : 24,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton.small(
                  heroTag: 'fab_traffic',
                  backgroundColor: _trafficEnabled
                      ? Colors.orange.shade700
                      : Colors.white,
                  foregroundColor: _trafficEnabled
                      ? Colors.white
                      : Colors.grey.shade800,
                  tooltip: 'Trafik Lalu Lintas',
                  onPressed: () {
                    setState(() {
                      _trafficEnabled = !_trafficEnabled;
                    });
                  },
                  child: const Icon(Icons.traffic_rounded),
                ),
                const SizedBox(height: 8),
                FloatingActionButton.small(
                  heroTag: 'fab_center',
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.teal.shade800,
                  tooltip: 'Pusatkan ke Monas',
                  onPressed: _resetCamera,
                  child: const Icon(Icons.my_location_rounded),
                ),
                const SizedBox(height: 8),
                FloatingActionButton.small(
                  heroTag: 'fab_zoom_in',
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.grey.shade800,
                  tooltip: 'Perbesar',
                  onPressed: _zoomIn,
                  child: const Icon(Icons.add_rounded),
                ),
                const SizedBox(height: 4),
                FloatingActionButton.small(
                  heroTag: 'fab_zoom_out',
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.grey.shade800,
                  tooltip: 'Perkecil',
                  onPressed: _zoomOut,
                  child: const Icon(Icons.remove_rounded),
                ),
              ],
            ),
          ),
          if (_selectedPlace != null)
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.teal.shade50,
                            foregroundColor: Colors.teal.shade700,
                            child: Icon(_selectedPlace!['icon'] as IconData),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _selectedPlace!['name'] as String,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  _selectedPlace!['category'] as String,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.close_rounded, size: 20),
                            onPressed: () {
                              setState(() {
                                _selectedPlace = null;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _selectedPlace!['description'] as String,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade800,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Icon(
                            Icons.place_rounded,
                            size: 16,
                            color: Colors.grey.shade600,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              '${(_selectedPlace!['latLng'] as LatLng).latitude.toStringAsFixed(6)}, ${(_selectedPlace!['latLng'] as LatLng).longitude.toStringAsFixed(6)}',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey.shade600,
                                fontFamily: 'monospace',
                              ),
                            ),
                          ),
                          FilledButton.icon(
                            style: FilledButton.styleFrom(
                              backgroundColor: Colors.teal.shade700,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            icon: const Icon(Icons.explore_rounded, size: 16),
                            label: const Text(
                              'Fokus Lokasi',
                              style: TextStyle(fontSize: 12),
                            ),
                            onPressed: () {
                              _mapController?.animateCamera(
                                CameraUpdate.newCameraPosition(
                                  CameraPosition(
                                    target: _selectedPlace!['latLng'] as LatLng,
                                    zoom: 16.5,
                                    tilt: 50,
                                    bearing: 30,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
