import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_scanner/components/bottom_nav_bar.dart';
import 'package:food_scanner/features/scanning/model/ingredient.dart';
import 'package:food_scanner/features/scanning/ui/ingredient_screen.dart';
import 'package:provider/provider.dart';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    void scanPicture() {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Dialog(
                child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(color: Colors.blue[200], borderRadius: BorderRadius.circular(10.0)),
                  width: 300.0,
                  height: 200.0,
                  alignment: AlignmentDirectional.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Center(
                        child: SizedBox(
                          height: 50.0,
                          width: 50.0,
                          child: CircularProgressIndicator(
                            value: null,
                            strokeWidth: 7.0,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 25.0),
                        child: const Center(
                          child: Text(
                            "scanning...",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ));
          });
      Future.delayed(const Duration(seconds: 3), () {
        context.read<IngredientListModel>().scan();
        Navigator.pop(context);
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const IngredientScreen()));
      });
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Review')),
      bottomNavigationBar: BottomNavBar(),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: SafeArea(child: SizedBox(height: double.maxFinite, child: Image.file(File(imagePath)))),
      floatingActionButton: FloatingActionButton(
        onPressed: scanPicture,
        child: const Text("Scan"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
