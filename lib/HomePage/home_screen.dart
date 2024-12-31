import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../audio_player/main_page_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const List<String> _titles = <String>[
    "LOVE IS LOUIS",
    "BROOKLYN WILSON",
    "JAMES BROWN",
    "ROBERTA FLACK",
    "JAMES BROWN",
    "ROBERTA FLACK"
  ];

  static const List<String> _subtitles = <String>[
    "Discover 71 Songs",
    "Discover 82 Songs",
    "Discover 55 Songs",
    "Discover 41 Songs",
    "Discover 89 Songs",
    "Discover 64 Songs"
  ];

  static const List<String> _artis = <String>[
    "pocaco",
    "Maron_Six",
    "leonardo",
    "Park_Han_Su",
    "Goromeo",
    "zorru",
  ];

  static const List<String> _song = <String>[
    "clasic",
    "hiphop",
    "pop",
    "rock",
  ];

  static const List<String> _singASongArtist = <String>[
    "Franz Joseph Haydn, Wolfgang Amadeus Mozart",
    "Eminem,snopDog, 50Cent",
    "Aretha Franklin, Michael Jackson",
    "Elvis Presley, Mick Jagger",
  ];

  static const List<String> _album = <String>[
    "clasic",
    "hiphop",
    "headphone",
    "rock",
  ];
  // Fungsi untuk menghasilkan warna acak
  Color _randomColor() {
    return Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        // Menggunakan ListView untuk menggantikan SingleChildScrollView utama
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildTemplateText(
                        "Have a nice day", 20, FontWeight.w400, Colors.black54),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("img/person.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.search),
                  label: const Text(
                    "Search",
                    style: TextStyle(fontSize: 15),
                  ),
                  style: ElevatedButton.styleFrom(
                    alignment: Alignment.centerLeft,
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                    ),
                    side: const BorderSide(color: Colors.black, width: 1),
                    fixedSize: const Size(400, 40),
                    padding: const EdgeInsets.all(8),
                  ),
                ),
                const SizedBox(height: 15),
                // ListView.builder untuk scroll horizontal
                Container(
                  alignment: Alignment.centerLeft,
                  height: 150,
                  color: Colors.transparent,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal, // Scroll horizontal
                    itemCount: _titles.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          _buildRecomentSong(context, index: index),
                          const SizedBox(width: 20), // Jarak antar card
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                _buildArtisTop(),
                const SizedBox(height: 20),
                _buildTemplateText(
                    "Artists", 18, FontWeight.w700, Colors.black54),
                // ListView.builder untuk artis horizontal
                SizedBox(
                  height: 80, // Atur tinggi sesuai kebutuhan
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _titles.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(8), // Kurangi margin
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                                "img/${_artis[index % _artis.length]}.png"),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                // ListView.builder untuk area lainnya (scroll horizontal)
                _buildTemplateText(
                    "Made for you", 20, FontWeight.w700, Colors.black54),
                SizedBox(
                  height: 200, // Sesuaikan dengan tinggi yang diinginkan
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4, // Jumlah item yang diinginkan
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: _buildMadeForYou(index),
                      );
                    },
                  ),
                ),
                _buildTemplateText(
                    "Recently Played", 20, FontWeight.w700, Colors.black54),
                SizedBox(
                  height: 200, // Sesuaikan dengan tinggi yang diinginkan
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4, // Jumlah item yang diinginkan
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: _buildRecentlyPlayed(index),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  GridView _buildArtisTop() {
    return GridView(
      padding: const EdgeInsets.all(10),

      physics: const NeverScrollableScrollPhysics(), // Nonaktifkan scroll
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 50,
        mainAxisSpacing: 10,
        childAspectRatio: 3.5,
      ),
      shrinkWrap: true, // Batasi tinggi sesuai dengan isi
      children: List.generate(_artis.length, (index) {
        return Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage("img/${_artis[index]}.png"),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                gradient: LinearGradient(
                  colors: [Colors.teal, Colors.tealAccent],
                  stops: const [
                    0.5,
                    1.0,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Center(
                child: _buildTemplateText(
                    _artis[index], 15, FontWeight.w400, Colors.white),
              ),
            ),
          ],
        );
      }),
    );
  }

  Stack _buildRecomentSong(BuildContext context, {required int index}) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 100,
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
            color: _randomColor(),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              // mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildTemplateText(
                    _titles[index % _titles.length], // Gunakan indeks modulus
                    23,
                    FontWeight.w700,
                    Colors.white),
                _buildTemplateText(
                    _subtitles[
                        index % _subtitles.length], // Gunakan indeks modulus
                    15,
                    FontWeight.w300,
                    Colors.white),
              ],
            ),
          ),
        ),
        Positioned(
          top: -20,
          right: -12,
          child: Container(
            height: 120,
            width: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(
                  "img/${_artis[index % _artis.length]}.png", // Gunakan indeks modulus
                ),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
      ],
    );
  }

// ElevatedButton.icon(
//               onPressed: () async {
//                 final player = AudioPlayer();
//                 await player.play(DeviceFileSource('assets/music.mp3'));
//               },
//               icon: Icon(Icons.play_arrow),
//               label: Text('Play Local Music'),
//               style: ElevatedButton.styleFrom(
//                 foregroundColor: Colors.white,
//                 backgroundColor: Colors.green,
//               ),
//             ),
  _buildRecentlyPlayed(index) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyWidget())),
          // onTap: () async {
          //   final player = AudioPlayer();
          //   await player.play(DeviceFileSource('music/snoopdog.mp3'));

          // },
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("recent_song_image/${_album[index]}.png"),
              ),
            ),
          ),
        )
      ],
    );
  }

  _buildMadeForYou(int index) {
    return Column(
      children: [
        Stack(
          children: [
            // Background merah
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                color: _randomColor(),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            // Teks di tengah (menggunakan Positioned untuk meletakkan teks di tengah)
            Positioned.fill(
              top: 5,
              child: Align(
                alignment: Alignment.topCenter,
                child: _buildTemplateText(
                  _song[index],
                  18,
                  FontWeight.w600,
                  Colors.black,
                ),
              ),
            ),
            // Layer biru di atas
            Positioned(
              top: 40,
              child: Container(
                height: 110,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  image: DecorationImage(
                    image: AssetImage("img/${_song[index]}.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        _buildTemplateText(
            _singASongArtist[index], 13, FontWeight.w500, Colors.black),
      ],
    );
  }

  Widget _buildTemplateText(
      String title, double size, FontWeight weight, Color color) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 150), // Maksimal lebar teks
      child: Text(
        title,
        style: TextStyle(
          fontSize: size,
          fontWeight: weight,
          color: color,
          overflow: TextOverflow.ellipsis,
        ),
        maxLines: 1, // Batasi teks ke satu baris
        textAlign: TextAlign.center,
      ),
    );
  }
}
