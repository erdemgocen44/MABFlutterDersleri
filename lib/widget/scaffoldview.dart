import 'package:emulator/widget/alert_ve_textfield.dart';
import 'package:emulator/widget/degisenwidget.dart';
import 'package:emulator/widget/imageview.dart';
import 'package:emulator/widget/shadowBox.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'formview.dart';

class ScaffoldView extends StatelessWidget {
  const ScaffoldView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String resimImage = "https://via.placeholder.com/600/92c952";
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
      backgroundColor: Colors.white,
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
            "CullAir",
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
                Navigator.pushNamed(context, "/elfeneri");
              },
              child: Card(
                child: gridViewContainer(
                  "El Feneri sayfasına git",
                  Colors.orange,
                  const NetworkImage(resimImage),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const FormView()));
              },
              child: Card(
                child: gridViewContainer(
                  """Tek Tıklama\nform sayfasına git""",
                  Colors.orange,
                  const NetworkImage(resimImage),
                ),
              ),
            ),
            GestureDetector(
              onDoubleTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DegisenWidget()));
              },
              child: Card(
                child: gridViewContainer(
                  """Çift Tıklama\nHelloWorld sayfasına git""",
                  Colors.blue,
                  const NetworkImage(resimImage),
                ),
              ),
            ),
            GestureDetector(
              onLongPress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ImageView()));
              },
              child: Card(
                child: gridViewContainer(
                  """Uzun Basma\nImageView sayfasına git""",
                  Colors.greenAccent,
                  const NetworkImage(resimImage),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Fluttertoast.showToast(
                  msg: "Bu öğeye bir defa tıkladınız!",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.grey,
                  textColor: Colors.white,
                );
              },
              onDoubleTap: () {
                Fluttertoast.showToast(
                  msg: "Bu öğeye iki defa tıkladınız!",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.white,
                  textColor: Colors.redAccent,
                );
              },
              onLongPress: () {
                Fluttertoast.showToast(
                  msg: "Bu öğeye uzun bastınız!",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.purple,
                  textColor: Colors.amber,
                );
              },
              child: Card(
                child: gridViewContainer(
                  """Toast Mesajı Kullanma""",
                  Colors.redAccent,
                  const NetworkImage(resimImage),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AlertVeTextField()));
              },
              child: Card(
                child: gridViewContainer(
                  """TextField Sayfası \nAlert View Sayfasına git""",
                  Colors.blueGrey,
                  const NetworkImage(resimImage),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                debugPrint("Shared Sayfasına Gidiliyor");
                Navigator.pushNamed(context, "/shared");
              },
              child: Card(
                child: gridViewContainer(
                  "Shared Preferences\nKullanımı sayfasına git",
                  Colors.pinkAccent,
                  const NetworkImage(resimImage),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                debugPrint("Dosya Sayfasına Gidiliyor");
                Navigator.pushNamed(context, "/dosyakonusu");
              },
              child: ShadowWidget(
                color: Colors.purpleAccent,
                elevation: 25,
                child: Card(
                  child: gridViewContainer(
                    "Dosya Sayfasına Gidiliyor",
                    Colors.blueAccent,
                    const NetworkImage(resimImage),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                debugPrint("Basit Json Sayfasına Gidiliyor");
                Navigator.pushNamed(context, "/jsonkonusu");
              },
              child: ShadowWidget(
                color: Colors.black,
                elevation: 20,
                child: Card(
                  child: gridViewContainer(
                    "Basit Json Konusu",
                    Colors.orangeAccent,
                    const NetworkImage(resimImage),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                debugPrint("Local Json Sayfasına Gidiliyor");
                Navigator.pushNamed(context, "/localjsonkonusu");
              },
              child: ShadowWidget(
                color: Colors.black,
                elevation: 20,
                child: Card(
                  child: gridViewContainer(
                    "Local Json Konusu",
                    Colors.deepPurpleAccent,
                    const NetworkImage(resimImage),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                debugPrint("Basit Http Sayfasına Gidiliyor");
                Navigator.pushNamed(context, "/basithttp");
              },
              child: ShadowWidget(
                color: Colors.black,
                elevation: 20,
                child: Card(
                  child: gridViewContainer(
                    "Basit Http Konusu",
                    Colors.greenAccent,
                    const NetworkImage(resimImage),
                  ),
                ),
              ),
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
        padding: const EdgeInsets.all(8),
        color: const Color(0xaaFFFFFF),
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
