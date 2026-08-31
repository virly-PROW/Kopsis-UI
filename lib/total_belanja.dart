import 'package:flutter/material.dart';

class TotalBelanja extends StatelessWidget {
  final int jumlah;
  final int hargaSatuan;

  const TotalBelanja({
    super.key,
    required this.jumlah,
    required this.hargaSatuan,
  });

  @override
  Widget build(BuildContext context) {
    final totalHarga = jumlah * hargaSatuan;
    return Text(
      'Rp$totalHarga',
      style: const TextStyle(fontSize: 11, color: Colors.green),
    );
  }
}
