import 'package:flutter/material.dart';

import 'formView.dart';

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
            gridViewContainer("He'd have you fun!", Colors.orangeAccent),
            gridViewContainer("Oldu mu şimdi?!", Colors.blueAccent),
            gridViewContainer("Napcaz şimdi!", Colors.greenAccent),
            gridViewContainer("Dere boyu kavaklar!", Colors.pinkAccent),
            gridViewContainer("Açtı yeşil yapraklar!", Colors.purpleAccent),
            gridViewContainer("Ben o yare doymadım!", Colors.cyanAccent),
          ],
        ),
        // child: Text(
        //   'Merhaba Scaffold',
        //   textDirection: TextDirection.ltr,
        // ),
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
            Icons.change_history,
          ),
          title: const Text(
            "Change History",
          ),
          onTap: () {
            Navigator.pop(context);
            debugPrint("yanMenu öğesine tıkladınız");
          },
        ),
      ),
    );
  }
}

Container gridViewContainer(String yazi, Color renk) {
  return Container(
    decoration: BoxDecoration(
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
    alignment: Alignment.center,
    padding: const EdgeInsets.all(8),
    child: Text(
      yazi,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
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
