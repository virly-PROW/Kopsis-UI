import 'package:flutter/material.dart';
import 'total_belanja.dart';

class KeranjangItem extends StatefulWidget {
  final int stok;
  final int hargaAnggota;

  const KeranjangItem({
    super.key,
    required this.stok,
    required this.hargaAnggota,
  });

  @override
  State<KeranjangItem> createState() => _KeranjangItemState();
}

class _KeranjangItemState extends State<KeranjangItem> {
  int jumlah = 1;

  @override
  void initState() {
    super.initState();
    print('initState dipanggil');
  }

  @override
  void dispose() {
    print('dispose dipanggil');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build dipanggil');
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {
            setState(() {
              if (jumlah > 1) jumlah--;
            });
          },
        ),
        Text(jumlah.toString()),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            if (jumlah < widget.stok) {
              setState(() {
                jumlah++;
              });
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Stok tidak mencukupi'),
                  duration: Duration(seconds: 2),
                ),
              );
            }
          },
        ),
        TotalBelanja(jumlah: jumlah, hargaSatuan: widget.hargaAnggota),
      ],
    );
  }
}
