import 'package:flutter/material.dart';
import 'package:tokokita/model/produk.dart';
import 'package:tokokita/ui/produk_detail.dart';
import 'package:tokokita/ui/produk_form.dart';
import 'package:tokokita/ui/login_page.dart';

class ProdukPage extends StatefulWidget {
  const ProdukPage({Key? key}) : super(key: key);

  @override
  _ProdukPageState createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  // Data produk sementara (nanti diganti dengan data dari API)
  List<Produk> items = [
    Produk(
      id: "1",
      kodeProduk: "A001",
      namaProduk: "Kamera Amel",
      hargaProduk: 5000000,
    ),
    Produk(
      id: "2", 
      kodeProduk: "A002",
      namaProduk: "Kulkas Amel",
      hargaProduk: 2500000,
    ),
    Produk(
      id: "3",
      kodeProduk: "A003", 
      namaProduk: "Mesin Cuci Amel",
      hargaProduk: 2000000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Produk Amel'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              child: const Icon(Icons.add, size: 26.0),
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProdukForm()), // ← HAPUS CONST
                );
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Logout Amel'),
              trailing: const Icon(Icons.logout),
              onTap: () async {
                // TODO: Implement logout
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          ItemProduk(
            produk: Produk(
              id: "1",
              kodeProduk: "A001",
              namaProduk: "Kamera Amel",
              hargaProduk: 5000000,
            ),
          ),
          ItemProduk(
            produk: Produk(
              id: "2",
              kodeProduk: "A002", 
              namaProduk: "Kulkas Amel",
              hargaProduk: 2500000,
            ),
          ),
          ItemProduk(
            produk: Produk(
              id: "3",
              kodeProduk: "A003",
              namaProduk: "Mesin Cuci Amel", 
              hargaProduk: 2000000,
            ),
          ),
        ],
      ),
    );
  }
}

class ItemProduk extends StatelessWidget {
  final Produk produk;

  const ItemProduk({Key? key, required this.produk}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProdukDetail(
              produk: produk,
            ),
          ),
        );
      },
      child: Card(
        child: ListTile(
          title: Text(produk.namaProduk!),
          subtitle: Text("Rp. ${produk.hargaProduk.toString()}"),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}