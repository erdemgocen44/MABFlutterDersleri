import 'package:emulator/widget/degisenwidget.dart';
import 'package:emulator/widget/imageview.dart';
import 'package:flutter/material.dart';

import 'formview.dart';

class ScaffoldView extends StatelessWidget {
  const ScaffoldView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconButton appbarIconButton(String tool, Icon ikon) {
      return IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FormView()),
          );
        },
        tooltip: tool,
        icon: ikon,
      );
    }

    return Scaffold(
      backgroundColor: Colors.greenAccent.shade100,
      appBar: AppBar(
        actions: [
          appbarIconButton(
            "Air",
            const Icon(
              Icons.electric_bike_sharp,
            ),
          ),
          appbarIconButton(
            "BelAir",
            const Icon(
              Icons.qr_code,
            ),
          ),
          appbarIconButton(
            "Cull",
            const Icon(
              Icons.add_a_photo,
            ),
          ),
        ],
        title: const Text(
          'Scaffold',
        ),
      ),
      body: Center(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FormView()));
              },
              child: gridViewContainer(
                """Tek Tıklama\nform sayfasına git""",
                Colors.orangeAccent,
                NetworkImage("https://picsum.photos/150/150"),
              ),
            ),
            GestureDetector(
              onDoubleTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DegisenWidget()));
              },
              child: gridViewContainer(
                """Çift Tıklama\nHelloWorld sayfasına git""",
                Colors.blueAccent,
                NetworkImage("https://picsum.photos/150/150"),
              ),
            ),
            GestureDetector(
              onLongPress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ImageView()));
              },
              child: gridViewContainer(
                """Uzun Basma\nImageView sayfasına git""",
                Colors.greenAccent,
                NetworkImage("https://picsum.photos/150/150"),
              ),
            ),
            gridViewContainer(
              "Deneme",
              Colors.pinkAccent,
              NetworkImage("https://picsum.photos/150/150"),
            ),
            gridViewContainer(
              "Denemee",
              Colors.purpleAccent,
              NetworkImage("https://picsum.photos/150/150"),
            ),
            gridViewContainer(
              "Denemeee",
              Colors.cyanAccent,
              NetworkImage("https://picsum.photos/150/150"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          bottomNavigationBarItemOrnekleri(
            const Icon(
              Icons.access_alarm_outlined,
            ),
            "Arşiv",
          ),
          bottomNavigationBarItemOrnekleri(
            const Icon(
              Icons.aod_sharp,
            ),
            "Karışık",
          ),
          bottomNavigationBarItemOrnekleri(
            const Icon(
              Icons.tty,
            ),
            "Turşu",
          ),
        ],
        onTap: (int i) {
          switch (i) {
            case 0:
              debugPrint("Tıkladığınız buton Arşiv Butonudur");

              break;
            case 1:
              debugPrint("Tıkladığınız buton Karışık Butonudur");

              break;
            case 2:
              debugPrint("Tıkladığınız buton Turşu Butonudur");

              break;
            default:
          }
        },
      ),
      drawer: Drawer(
        child: ListTile(
          leading: const Icon(
            Icons.adb_sharp,
          ),
          title: const Text(
            "Change History",
          ),
          onTap: () {
            Navigator.pop(context);
            debugPrint("yan menu öğesine tıkladınız");
          },
        ),
      ),
    );
  }
}

Container gridViewContainer(String yazi, Color renk, NetworkImage resim) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: resim,
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.circular(25),
      boxShadow: [
        BoxShadow(
          color: renk,
          spreadRadius: 1,
          blurRadius: 1,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    alignment: Alignment.bottomCenter,
    padding: const EdgeInsets.all(8),
    child: Transform(
      alignment: Alignment.bottomCenter,
      transform: Matrix4.skewY(0.0)..rotateZ(0.0),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(8),
        color: Color(0xaaFFFFFF),
        child: Text(
          yazi,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

BottomNavigationBarItem bottomNavigationBarItemOrnekleri(
    Icon ikon, String altyazi) {
  return BottomNavigationBarItem(
    icon: ikon,
    label: altyazi,
  );
}
