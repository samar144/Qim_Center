// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gal/gal.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:qim_center/navigate.dart';
import 'package:qim_center/pages/Screens/profile.dart';

import 'package:dio/dio.dart';

class certificate extends StatelessWidget {
  bool toAlbum = false;
  final navigatorKey = GlobalKey<NavigatorState>();

  get path => null;

  void saveimage() async {
    ByteData byteData = await rootBundle.load('assets/images/img_4.png');
    File file = await File(
            '/storage/emulated/0/Android/media/<qim_center>/<Qim_Center/folder>/img_4.png')
        .create(recursive: true);
    await Gal.putImageBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    showSnackbar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        actions: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 13),
                child: Text(
                  'شهاداتي       ',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
              // SizedBox(
              //   width: 5,
              // ),
              // IconButton(
              //   icon: Icon(Icons.keyboard_arrow_right_outlined),
              //   color: Colors.black87,
              //   iconSize: 30,
              //   onPressed: () {
              //     navigateAndFinish(context, profile());
              //   },
              // ),
            ],
          ),
        ],
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        )),
        shadowColor: Colors.grey,
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        color: Colors.grey[50],
        child: ListView.separated(
          //...........
          itemCount: 50,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: ListTile(
                title: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    //.........
                    'شهادة دورة أرزاق',
                  ),
                ),
                subtitle: Text(
                  //........
                  '50,4 KB PFF',
                  style: TextStyle(fontSize: 10),
                ),
                onTap: () {},
                leading: IconButton(
                  icon: Icon(Icons.file_download_outlined),
                  onPressed: () {
                    saveimage();
                  },
                ),
                trailing: InstaImageViewer(
                  child: Image(
                    //................
                    image:

                        ///  NetworkImage(''),
                        AssetImage(
                      'assets/images/img_4.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                  // contentPadding: EdgeInsets.all(7),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => Divider(
            color: Colors.grey[50],
          ),
        ),
      ),
    );
  }

  String? get album => toAlbum ? 'Album' : null;

  void showSnackbar() {
    final context = navigatorKey.currentContext;
    if (context == null || !context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Saved! ✅'),
      action: SnackBarAction(
        label: 'Gallery ->',
        onPressed: () async => Gal.open(),
      ),
    ));
  }

  Future<String> getFilePath(String path) async {
    final byteData = await rootBundle.load(path);
    final file = await File(
            '${Directory.systemTemp.path}${path.replaceAll('assets', '')}')
        .create();
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    return file.path;
  }

  Future<Uint8List> getBytesData(String path) async {
    final byteData = await rootBundle.load(path);
    final uint8List = byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
    return Uint8List.fromList(uint8List);
  }
}
