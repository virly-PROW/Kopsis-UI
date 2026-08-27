import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
      'stok': 40,
    },
    {
      'nama': 'Pensil',
      'kategori': 'ATK',
      'harga_anggota': 1000,
      'harga_umum': 1500,
      'stok': 50,
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
      'stok': 20,
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
      'stok': 10,
    },
    {
      'nama': 'Snack',
      'kategori': 'Makanan',
      'harga_anggota': 3000,
      'harga_umum': 3500,
      'stok': 30,
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
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Koperasi Sekolah')),
        body: ListView.builder(
          itemCount: daftarBarang.length,
          itemBuilder: (context, index) {
            final barang = daftarBarang[index];
            return Card(
              child: ListTile(
                leading: const Icon(Icons.inventory_2),
                title: Text(barang['nama']),
                subtitle: Text(
                  'Anggota Rp' + barang['harga_anggota'].toString(),
                ),
                trailing: Text('Stok: ' + barang['stok'].toString()),
              ),
            );
          },
        ),
      ), // scaffold
    ); // material app
  }
}
