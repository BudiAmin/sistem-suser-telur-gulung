import 'package:flutter/material.dart';
import '../services/sholat_service.dart';
import '../models/sholat_model.dart';

class SholatScreen extends StatefulWidget {
  @override
  State<SholatScreen> createState() => _SholatScreenState();
}

class _SholatScreenState extends State<SholatScreen> {
  final SholatService _sholatService = SholatService();
  JadwalSholatModel? _jadwal;
  bool _loading = true;

  // Default: Jakarta
  String _currentCityName = "Kota Jakarta";
  String _currentCityId = "1301";

  @override
  void initState() {
    super.initState();
    _loadJadwal();
  }

  Future<void> _loadJadwal() async {
    setState(() => _loading = true);
    final now = DateTime.now();
    final datePath = "${now.year}/${now.month}/${now.day}";

    final data =
        await _sholatService.fetchJadwalSholat(_currentCityId, datePath);

    if (data != null && data['jadwal'] != null) {
      setState(() {
        _jadwal = JadwalSholatModel.fromJson(data['jadwal']);
        _loading = false;
      });
    }
  }

  // Fungsi untuk menampilkan dialog pencarian kota
  void _showSearchDialog() {
    TextEditingController _searchController = TextEditingController();
    List<dynamic> _searchResults = [];
    bool _isSearching = false;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                  left: 20,
                  right: 20,
                  top: 20),
              height: 500,
              child: Column(
                children: [
                  TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: "Cari nama kota (contoh: Bandung)",
                      prefixIcon: Icon(Icons.search, color: Colors.blue),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    onSubmitted: (value) async {
                      setModalState(() => _isSearching = true);
                      final results = await _sholatService.cariKota(value);
                      setModalState(() {
                        _searchResults = results;
                        _isSearching = false;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  _isSearching
                      ? LinearProgressIndicator(color: Colors.blue)
                      : Expanded(
                          child: ListView.builder(
                            itemCount: _searchResults.length,
                            itemBuilder: (context, index) {
                              final kota = _searchResults[index];
                              return ListTile(
                                title: Text(kota['lokasi']),
                                onTap: () {
                                  setState(() {
                                    _currentCityId = kota['id'];
                                    _currentCityName = kota['lokasi'];
                                  });
                                  _loadJadwal();
                                  Navigator.pop(context);
                                },
                              );
                            },
                          ),
                        ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.blue.shade400, Colors.blue.shade50],
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: _loading
                    ? const Center(
                        child: CircularProgressIndicator(color: Colors.blue))
                    : _buildJadwalList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Jadwal Sholat',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.white, size: 16),
                    SizedBox(width: 4),
                    Text(_currentCityName,
                        style: TextStyle(color: Colors.white70, fontSize: 16)),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: _showSearchDialog,
            icon: Container(
              padding: EdgeInsets.all(8),
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: Icon(Icons.search, color: Colors.blue),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildJadwalList() {
    if (_jadwal == null)
      return const Center(child: Text("Gagal memuat jadwal"));

    final times = {
      'Imsak': _jadwal!.imsak,
      'Subuh': _jadwal!.subuh,
      'Terbit': _jadwal!.terbit,
      'Dzuhur': _jadwal!.dzuhur,
      'Ashar': _jadwal!.ashar,
      'Maghrib': _jadwal!.maghrib,
      'Isya': _jadwal!.isya,
    };

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Center(
            child: Text(_jadwal!.tanggal,
                style: TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.bold))),
        SizedBox(height: 15),
        ...times.entries.map((e) => _buildSholatCard(e.key, e.value)).toList(),
        SizedBox(height: 80), // Beri ruang untuk Navbar
      ],
    );
  }

  Widget _buildSholatCard(String nama, String waktu) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, 4))
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(nama,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          Text(waktu,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade700)),
        ],
      ),
    );
  }
}
