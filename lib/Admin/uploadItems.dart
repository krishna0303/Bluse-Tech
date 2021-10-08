import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bluse/Admin/adminShiftOrders.dart';
import 'package:bluse/Authentication/authenication.dart';
import 'package:bluse/Widgets/loadingWidget.dart';
import 'package:bluse/main.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import 'package:image/image.dart' as ImD;

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage>
    with AutomaticKeepAliveClientMixin<UploadPage> {
  bool get wantKeepAlive => true;
  File file;
  TextEditingController _descriptionTextEditingController =
      TextEditingController();
  TextEditingController _priceTextEditingController = TextEditingController();
  TextEditingController _titleTextEditingController = TextEditingController();
  TextEditingController _shortInfoTextEditingController =
      TextEditingController();
  String productId = DateTime.now().millisecondsSinceEpoch.toString();
  bool uploading = false;
  bool isupload = false;
  File _image1;
  File _image2;
  File _image3;
  int imageCount = 0;
  String imageDownloadUrl1;
  String imageDownloadUrl2;
  String imageDownloadUrl3;

  @override
  Widget build(BuildContext context) {
    return isupload == false
        ? displayAdminHomeScreen()
        : displayAdminUploadFormScreen();
  }

  displayAdminHomeScreen() {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              // colors: [Colors.pink, Colors.lightGreenAccent],
              colors: [Colors.black, Colors.black],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.border_color,
            color: Colors.white,
          ),
          onPressed: () {
            Route route = MaterialPageRoute(builder: (c) => AdminShiftOrders());
            // Navigator.pushReplacement(context, route);
            Navigator.push(context, route);
          },
        ),
        actions: [
          FlatButton(
            child: Text(
              "Logout",
              style: TextStyle(
                color: Colors.pink,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              Route route = MaterialPageRoute(builder: (c) => SplashScreen());
              Navigator.pushReplacement(context, route);
              // Navigator.push(context, route);
            },
          ),
        ],
      ),
      body: getAdminHomeScreenBody(),
    );
  }

  getAdminHomeScreenBody() {
    return Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          // colors: [Colors.pink, Colors.lightGreenAccent],
          colors: [Colors.white, Colors.black],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shop_two,
              color: Colors.white,
              size: 200.0,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9.0)),
                child: Text(
                  "Add New Items",
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                color: Colors.green,
                // onPressed: () => takeImage(context),
                onPressed: () {
                  setState(() {
                    isupload = true;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  takeImage1(mContext) {
    return showDialog(
        context: mContext,
        builder: (con) {
          return SimpleDialog(
            title: Text(
              "Item Image",
              style:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
            children: [
              // SimpleDialogOption(
              //   child: Text("Capture with Camera",
              //       style: TextStyle(
              //         color: Colors.green,
              //       )),
              //   onPressed: capturePhotoWithCamera,
              // ),
              SimpleDialogOption(
                child: Text("Select from Gallery",
                    style: TextStyle(
                      color: Colors.green,
                    )),
                onPressed: pickPhotoFromGallery1,
              ),
              SimpleDialogOption(
                child: Text("Cancel",
                    style: TextStyle(
                      color: Colors.green,
                    )),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  takeImage2(mContext) {
    return showDialog(
        context: mContext,
        builder: (con) {
          return SimpleDialog(
            title: Text(
              "Item Image",
              style:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
            children: [
              // SimpleDialogOption(
              //   child: Text("Capture with Camera",
              //       style: TextStyle(
              //         color: Colors.green,
              //       )),
              //   onPressed: capturePhotoWithCamera,
              // ),
              SimpleDialogOption(
                child: Text("Select from Gallery",
                    style: TextStyle(
                      color: Colors.green,
                    )),
                onPressed: pickPhotoFromGallery2,
              ),
              SimpleDialogOption(
                child: Text("Cancel",
                    style: TextStyle(
                      color: Colors.green,
                    )),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  takeImage3(mContext) {
    return showDialog(
        context: mContext,
        builder: (con) {
          return SimpleDialog(
            title: Text(
              "Item Image",
              style:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
            children: [
              // SimpleDialogOption(
              //   child: Text("Capture with Camera",
              //       style: TextStyle(
              //         color: Colors.green,
              //       )),
              //   onPressed: capturePhotoWithCamera,
              // ),
              SimpleDialogOption(
                child: Text("Select from Gallery",
                    style: TextStyle(
                      color: Colors.green,
                    )),
                onPressed: pickPhotoFromGallery3,
              ),
              SimpleDialogOption(
                child: Text("Cancel",
                    style: TextStyle(
                      color: Colors.green,
                    )),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  // capturePhotoWithCamera() async {
  //   Navigator.pop(context);
  //   File imageFile = await ImagePicker.pickImage(
  //       source: ImageSource.camera, maxHeight: 680.0, maxWidth: 970.0);

  //   setState(() {
  //     file = imageFile;
  //   });
  // }

  pickPhotoFromGallery1() async {
    Navigator.pop(context);
    File imageFile = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    String url1 = await uploadItemImage1(imageFile);
    setState(() {
      _image1 = imageFile;
      imageDownloadUrl1 = url1;
    });
  }

  pickPhotoFromGallery2() async {
    Navigator.pop(context);
    File imageFile = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    String url2 = await uploadItemImage2(imageFile);

    setState(() {
      _image2 = imageFile;
      imageDownloadUrl2 = url2;
    });
  }

  pickPhotoFromGallery3() async {
    Navigator.pop(context);
    File imageFile = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );

    String url3 = await uploadItemImage3(imageFile);

    setState(() {
      _image3 = imageFile;
      imageDownloadUrl3 = url3;
    });
  }

  displayAdminUploadFormScreen() {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              // colors: [Colors.pink, Colors.lightGreenAccent],
              colors: [Colors.white, Colors.black],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: clearFormInfo),
        title: Text(
          "New Product",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          FlatButton(
            onPressed: uploading ? null : () => uploadImageAndSaveItemInfo(),
            child: Text(
              "Add",
              style: TextStyle(
                // color: Colors.pink,
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          uploading ? circularProgress() : Text(""),
          // Container(
          //   height: 230.0,
          //   width: MediaQuery.of(context).size.width * 0.8,
          //   child: Center(
          //     child: AspectRatio(
          //       aspectRatio: 16 / 9,
          //       child: Container(
          //         decoration: BoxDecoration(
          //             image: DecorationImage(
          //                 image: FileImage(file), fit: BoxFit.cover)),
          //       ),
          //     ),
          //   ),
          // ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlineButton(
                      borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.5), width: 2.5),
                      onPressed: () {
                        takeImage1(context);
                      },
                      child: _displayChild1()),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlineButton(
                      borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.5), width: 2.5),
                      onPressed: () {
                        takeImage2(context);
                      },
                      child: _displayChild2()),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlineButton(
                    borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.5), width: 2.5),
                    onPressed: () {
                      takeImage3(context);
                    },
                    child: _displayChild3(),
                  ),
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 12.0)),
          ListTile(
            leading: Icon(
              Icons.perm_device_information,
              color: Colors.black,
            ),
            title: Container(
              width: 250.0,
              child: TextField(
                style: TextStyle(color: Colors.deepPurpleAccent),
                controller: _shortInfoTextEditingController,
                decoration: InputDecoration(
                  hintText: "Short Info",
                  hintStyle: TextStyle(color: Colors.deepPurpleAccent),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.black,
          ),
          ListTile(
            leading: Icon(
              Icons.perm_device_information,
              color: Colors.black,
            ),
            title: Container(
              width: 250.0,
              child: TextField(
                style: TextStyle(color: Colors.deepPurpleAccent),
                controller: _titleTextEditingController,
                decoration: InputDecoration(
                  hintText: "Title",
                  hintStyle: TextStyle(color: Colors.deepPurpleAccent),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.black,
          ),
          ListTile(
            leading: Icon(
              Icons.perm_device_information,
              color: Colors.black,
            ),
            title: Container(
              width: 250.0,
              child: TextField(
                style: TextStyle(color: Colors.deepPurpleAccent),
                controller: _descriptionTextEditingController,
                decoration: InputDecoration(
                  hintText: "Description",
                  hintStyle: TextStyle(color: Colors.deepPurpleAccent),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.black,
          ),
          ListTile(
            leading: Icon(
              Icons.perm_device_information,
              color: Colors.black,
            ),
            title: Container(
              width: 250.0,
              child: TextField(
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.deepPurpleAccent),
                controller: _priceTextEditingController,
                decoration: InputDecoration(
                  hintText: "Price",
                  hintStyle: TextStyle(color: Colors.deepPurpleAccent),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.pink,
          )
        ],
      ),
    );
  }

  clearFormInfo() {
    setState(() {
      _image1 = null;
      _image2 = null;
      _image3 = null;
      _descriptionTextEditingController.clear();
      _priceTextEditingController.clear();
      _shortInfoTextEditingController.clear();
      _titleTextEditingController.clear();
    });
  }

  uploadImageAndSaveItemInfo() async {
    setState(() {
      uploading = true;
    });

    // String imageDownloadUrl1 = await uploadItemImage1(_image1);
    // String imageDownloadUrl2 = await uploadItemImage2(_image2);
    // String imageDownloadUrl3 = await uploadItemImage3(_image3);

    saveItemInfo(imageDownloadUrl1, imageDownloadUrl2, imageDownloadUrl3);
  }

  Future<String> uploadItemImage1(mFileImage) async {
    String prod1 = productId + "k";
    final StorageReference storageReference =
        FirebaseStorage.instance.ref().child("Items");

    StorageUploadTask uploadTask =
        storageReference.child("product_$prod1.jpg").putFile(mFileImage);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> uploadItemImage2(mFileImage) async {
    String prod2 = productId + "l";
    final StorageReference storageReference =
        FirebaseStorage.instance.ref().child("Items");
    StorageUploadTask uploadTask =
        storageReference.child("product_$prod2.jpg").putFile(mFileImage);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> uploadItemImage3(mFileImage) async {
    String prod3 = productId + "m";
    final StorageReference storageReference =
        FirebaseStorage.instance.ref().child("Items");
    StorageUploadTask uploadTask =
        storageReference.child("product_$prod3.jpg").putFile(mFileImage);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  saveItemInfo(String downloadUrl1, String downloadUrl2, String downloadUrl3) {
    final itemsRef = Firestore.instance.collection("items");
    itemsRef.document(productId).setData({
      "shortInfo": _shortInfoTextEditingController.text.trim(),
      "longDescription": _descriptionTextEditingController.text.trim(),
      "price": int.parse(_priceTextEditingController.text),
      "publishedDate": DateTime.now(),
      "status": "available",
      "thumbnailUrl1": downloadUrl1,
      "thumbnailUrl2": downloadUrl2,
      "thumbnailUrl3": downloadUrl3,
      "title": _titleTextEditingController.text.trim(),
    });

    setState(() {
      _image1 = null;
      _image2 = null;
      _image3 = null;
      uploading = false;
      productId = DateTime.now().millisecondsSinceEpoch.toString();
      _descriptionTextEditingController.clear();
      _titleTextEditingController.clear();
      _shortInfoTextEditingController.clear();
      _priceTextEditingController.clear();
    });
    // Navigator.pop(context);
  }

  Widget _displayChild1() {
    if (_image1 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 50, 14, 50),
        child: new Icon(
          Icons.add,
          color: Colors.grey,
        ),
      );
    } else {
      return Image.file(
        _image1,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }

  Widget _displayChild2() {
    if (_image2 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 50, 14, 50),
        child: new Icon(
          Icons.add,
          color: Colors.grey,
        ),
      );
    } else {
      return Image.file(
        _image2,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }

  Widget _displayChild3() {
    if (_image3 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 50, 14, 50),
        child: new Icon(
          Icons.add,
          color: Colors.grey,
        ),
      );
    } else {
      return Image.file(
        _image3,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }
}
