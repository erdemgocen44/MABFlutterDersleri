import 'package:emulator/widget/scaffoldview.dart';
import 'package:flutter/material.dart';

class AnaCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const FormView()));
              },
              child: Card(
                child: gridViewContainer(
                  """Tek Tıklama\nform sayfasına git""",
                  Colors.orange,
                
                ),
              ),
            ),
  }
}
