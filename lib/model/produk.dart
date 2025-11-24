class Produk {
  String? id;
  String? kodeProduk;
  String? namaProduk;
  var hargaProduk;
  
  Produk({this.id, this.kodeProduk, this.namaProduk, this.hargaProduk});
  
  factory Produk.fromJson(Map<String, dynamic> json) {
    return Produk(
      id: json['id'].toString(),
      kodeProduk: json['kode_produk'],
      namaProduk: json['nama_produk'],
      hargaProduk: json['harga'],
    );
  }
}