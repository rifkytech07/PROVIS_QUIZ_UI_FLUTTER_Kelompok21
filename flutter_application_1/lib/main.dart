import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz UI Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Quiz UI Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Nomor Kelompok:  [Kelompok 21]',
            ),
            const Text(
              'Mhs 1:  [2202346, Muhammad Rifky Afandi]',
            ),
            const Text(
              'Mhs 2:  [2316850, indra aldi]',
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return soalNo1();
                  }));
                },
                child: const Text('   Jawaban No 1   '),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return soalNo2();
                  }));
                },
                child: const Text('   Jawaban No 2   '),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //jaawaban no 1
  Widget soalNo1() {
    TextEditingController _dateController = TextEditingController();
    DateTime _selectedDate = DateTime
        .now(); // Tambahkan variabel untuk menyimpan tanggal yang dipilih
    String _selectedGender =
        'Laki-laki'; // Tambahkan variabel untuk menyimpan gender yang dipilih

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ubah Profil',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.yellow, Colors.white],
            stops: [
              0.5,
              0.5
            ], // Untuk membagi latar belakang menjadi dua bagian
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20), // Tambahkan padding keseluruhan
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Budi Martami', // Nama pengguna
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  IconButton(
                    icon: Icon(Icons.account_circle), // Icon profil
                    onPressed: () {
                      // Handle action ketika ikon profil ditekan
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  width: 300, // Atur lebar kontainer
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(10), // Membuat sudut kotak
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(
                            0, 3), // Shadow position, disebut juga offset
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(
                        20), // Tambahkan padding untuk memisahkan elemen-elemen di dalam kotak
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Ubah Profil",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Nama Depan',
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Nama Belakang',
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 1,
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  labelText: 'Gender',
                                ),
                                value: _selectedGender,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedGender = newValue!;
                                  });
                                },
                                items: <String>[
                                  'Laki-laki',
                                  'Perempuan'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                            SizedBox(width: 10),
                            Flexible(
                              flex: 1,
                              child: InkWell(
                                onTap: () async {
                                  final DateTime? picked = await showDatePicker(
                                    context: context,
                                    initialDate: _selectedDate,
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2101),
                                  );
                                  if (picked != null) {
                                    setState(() {
                                      _selectedDate = picked;
                                      _dateController.text =
                                          "${picked.day}/${picked.month}/${picked.year}"; // Format sesuai kebutuhan
                                    });
                                  }
                                },
                                child: IgnorePointer(
                                  child: TextFormField(
                                    controller: _dateController,
                                    decoration: InputDecoration(
                                      labelText: 'Tanggal Lahir',
                                      suffixIcon: Icon(Icons
                                          .calendar_today), // Menambahkan ikon kalender
                                    ),
                                    keyboardType: TextInputType.datetime,
                                    readOnly:
                                        true, // Tambahkan atribut readOnly
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Alamat',
                          ),
                          keyboardType: TextInputType.streetAddress,
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            // Handle action saat tombol "Simpan" ditekan
                          },
                          child: Text(
                            'Simpan',
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.yellow, // Warna latar belakang kuning
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //jaawaban no 2

  Widget soalNo2() {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height *
                1 /
                3, // Ukuran background gambar tetap 1/3 dari tinggi layar
            child: Stack(
              children: [
                // Background image
                Image.asset(
                  'assets/bgimages.jpg',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                // Kolom pencarian di atas gambar
                Positioned(
                  top: 20,
                  left: 20,
                  right: 20,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    color: Colors.white.withOpacity(0.7),
                    child: Row(
                      // Menggunakan Row untuk kontainer pencarian
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Cari...',
                              hintStyle: TextStyle(color: Colors.black54),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              fillColor: Colors.grey[200],
                              prefixIcon:
                                  Icon(Icons.search, color: const Color.fromARGB(137, 7, 6, 6)),
                            ),
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.shopping_cart, color: Colors.black),
                        SizedBox(width: 10),
                        Icon(Icons.notifications, color: Colors.black),
                        SizedBox(width: 10),
                        Icon(Icons.comment, color: Colors.black),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Kalimat "Halo, Budi!"
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Text(
                  'Halo, Budi!',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Informasi store kredit, reward point, dan kupon di bawah gambar
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              // Menambahkan dekorasi untuk garis tepi dan warna kuning
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200], // Warna kuning
            ),
            child: Column(
              // Menggunakan Column untuk kontainer informasi
              children: [
                Row(
                  // Menggunakan Row untuk kontainer informasi
                  mainAxisAlignment: MainAxisAlignment
                      .spaceEvenly, // Untuk memusatkan kontainer informasi secara horizontal
                  children: [
                    Column(
                      children: [
                        Icon(Icons.monetization_on,
                            color: Colors.black), // Ikona di samping kiri teks
                        SizedBox(height: 10),
                        Text(
                          'Store Kredit:',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$100',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.star,
                            color: Colors.black), // Ikona di samping kiri teks
                        SizedBox(height: 10),
                        Text(
                          'Reward Point:',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '500',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.card_giftcard,
                            color: Colors.black), // Ikona di samping kiri teks
                        SizedBox(height: 10),
                        Text(
                          'Kupon Saya:',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '3',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Ikon "store", "fire", "hangar", dan "face"
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(Icons.store, color: Colors.black),
                    SizedBox(height: 10),
                    Text(
                      'Store',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.local_fire_department, color: Colors.red),
                    SizedBox(height: 10),
                    Text(
                      'Fire',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.checkroom_outlined, color: Colors.black),
                    SizedBox(height: 10),
                    Text(
                      'Hangar',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.face, color: Colors.black),
                    SizedBox(height: 10),
                    Text(
                      'Face',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Carousel Slider
          Expanded(
            child: CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
              items: [
                Image.asset(
                  'assets/images2.jpg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images3.jpg',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Kategori',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'List Belanja',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Akun',
          ),
        ],
        selectedItemColor: Colors.blue, // Atur warna ikon terpilih
        unselectedItemColor:
            Color.fromARGB(255, 14, 13, 13), // Atur warna ikon tidak terpilih
        showSelectedLabels: true, // Tampilkan label terpilih
        showUnselectedLabels: true, // Tampilkan label tidak terpilih
        // currentIndex: _selectedIndex, // Ganti nilai ini dengan indeks terpilih
        // onTap: _onItemTapped, // Tambahkan fungsi ini untuk menangani ketika item dipilih
      ),
    );
  }
}
