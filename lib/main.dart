import 'package:flutter/material.dart';
import 'barang_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({super.key});
  int stok = 40;
  String kategori = "ATK";

  // FUNGSI UNTUK MEMILIH ICON OTOMATIS
  IconData getIconByKategori(String kategori) {
    switch (kategori) {
      case 'ATK':
        return Icons.edit;
      case 'Makanan':
        return Icons.fastfood;
      case 'Minuman':
        return Icons.local_drink;
      default:
        return Icons.inventory_2; // ikon default kalau kategori tidak dikenali
    }
  }

  final List<Map<String, dynamic>> daftarBarang = [
    {
      'nama': 'Buku Tulis',
      'kategori': 'ATK',
      'harga_anggota': 3000,
      'harga_umum': 3500,
      'stok': 7,
    },
    {
      'nama': 'Pensil',
      'kategori': 'ATK',
      'harga_anggota': 1000,
      'harga_umum': 1500,
      'stok': 90,
    },
    {
      'nama': 'Penghapus',
      'kategori': 'ATK',
      'harga_anggota': 500,
      'harga_umum': 700,
      'stok': 30,
    },
    {
      'nama': 'Roti',
      'kategori': 'Makanan',
      'harga_anggota': 2000,
      'harga_umum': 2500,
      'stok': 9,
    },
    {
      'nama': 'Air Mineral',
      'kategori': 'Minuman',
      'harga_anggota': 1500,
      'harga_umum': 2000,
      'stok': 25,
    },
    {
      'nama': 'Pensil Warna',
      'kategori': 'ATK',
      'harga_anggota': 5000,
      'harga_umum': 6000,
      'stok': 15,
    },
    {
      'nama': 'Penggaris',
      'kategori': 'ATK',
      'harga_anggota': 2000,
      'harga_umum': 2500,
      'stok': 16,
    },
    {
      'nama': 'Snack',
      'kategori': 'Makanan',
      'harga_anggota': 3000,
      'harga_umum': 3500,
      'stok': 2,
    },
    {
      'nama': 'Teh Botol',
      'kategori': 'Minuman',
      'harga_anggota': 2500,
      'harga_umum': 3000,
      'stok': 20,
    },
    {
      'nama': 'Pulpen',
      'kategori': 'ATK',
      'harga_anggota': 1500,
      'harga_umum': 2000,
      'stok': 35,
    },
  ];

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TextEditingController _controller;
  String kataCari = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasilCari = widget.daftarBarang
        .where(
          (barang) =>
              barang['stok'] > 0 &&
              barang['nama'].toString().toLowerCase().contains(kataCari),
        )
        .toList();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Koperasi Sekolah')),
        body: Column(
          children: [
            Text(
              'lebar layar: ' +
                  MediaQuery.of(context).size.width.toStringAsFixed(0),
            ),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Cari Barang',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (nilai) {
                setState(() {
                  kataCari = nilai.toLowerCase();
                });
              },

              //expanded
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraint) {
                  int kolom;
                  if (constraint.maxWidth < 600) {
                    kolom = 1;
                  } else if (constraint.maxWidth < 900) {
                    kolom = 2;
                  } else {
                    kolom = 3;
                  }
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: kolom,
                      childAspectRatio: 3,
                    ),
                    itemCount: hasilCari.length,
                    itemBuilder: (context, index) {
                      final barang = hasilCari[index];
                      return BarangCard(
                        nama: barang['nama'],
                        hargaAnggota: barang['harga_anggota'],
                        stok: barang['stok'],
                        kategori: barang['kategori'],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ), // scaffold
    ); // material app
  }
}
