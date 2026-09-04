import 'package:flutter/material.dart';
import 'keranjang_item.dart';

class BarangCard extends StatelessWidget {
  final String nama;
  final int hargaAnggota;
  final int stok;
  final String kategori;
  final bool sorot;

  const BarangCard({
    super.key,
    required this.nama,
    required this.hargaAnggota,
    required this.stok,
    required this.kategori,
    this.sorot = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      color: sorot ? Colors.yellow[50] : null,
      child: ListTile(
        leading: const Icon(Icons.edit),
        title: Text(nama, maxLines: 1, overflow: TextOverflow.ellipsis),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Angggota Rp$hargaAnggota'),
            Text(
              kategori,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        trailing: KeranjangItem(stok: stok, hargaAnggota: hargaAnggota),
        isThreeLine: true,
      ),
    );
  }
}
