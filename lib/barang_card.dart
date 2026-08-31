import 'package:flutter/material.dart';
import 'keranjang_item.dart';

class BarangCard extends StatefulWidget {
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
  State<BarangCard> createState() => _BarangCardState();
}

class _BarangCardState extends State<BarangCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      color: widget.sorot ? Colors.yellow[50] : null,
      child: ListTile(
        leading: const Icon(Icons.edit),
        title: Text(widget.nama),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Angggota Rp' + widget.hargaAnggota.toString()),
            Text(
              widget.kategori,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        trailing: KeranjangItem(
          stok: widget.stok,
          hargaAnggota: widget.hargaAnggota,
        ),
        isThreeLine: true,
      ),
    );
  }
}
