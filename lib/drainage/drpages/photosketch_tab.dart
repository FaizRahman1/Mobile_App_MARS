
// class PhotoSketchTab extends StatefulWidget {
//   PhotoSketchTab({super.key});

//   PhotoSketchTab? formBloc;

//   @override
//   State<PhotoSketchTab> createState() => _PhotoSketchTabState();
// }

// class _PhotoSketchTabState extends State<PhotoSketchTab> {
//   // This is the file that will be used to store the image
//   File? _image;
//   String? image;

//   File? _image2;
//   String? image2;

//   File? _image3;
//   String? image3;

//   File? _image4;
//   String? image4;

//   File? _image5;
//   String? image5;

//   File? _image6;
//   String? image6;

//   late String pickerType;
//   // This is the image picker
//   final _picker = ImagePicker();
//   // Implementing the image picker
//   Future<File?> _openImagePicker(String pickerType) async {
//     XFile? pickedImage;
//     switch (pickerType) {
//       case "gallery":

//         /// GALLERY IMAGE PICKER
//         pickedImage = await _picker.pickImage(source: ImageSource.gallery);
//         break;
//       case "camera": // CAMERA CAPTURE CODE
//         pickedImage = await _picker.pickImage(source: ImageSource.camera);
//         break;
//     }
//     if (pickedImage != null) {
//       debugPrint("SELECTED IMAGE PICK   $pickedImage");
//       final tempImg = File(pickedImage.path);
//       return tempImg;
//     } else {
//       print("You have not taken an image yet.");
//     }
//     return null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 1000,
//       child: Scaffold(
//           body: SingleChildScrollView(
//         child: ConstrainedBox(
//           constraints: const BoxConstraints(),
//           child: Padding(
//             padding: const EdgeInsets.all(8),
//             child: Column(children: [
//               Wrap(
//                 children: <Widget>[
//                   ElevatedButton(
//                     //call image painter here
//                     onPressed: () async {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => ImagePainterExample(
//                                   image: image,
//                                 )),
//                       );
//                     },
//                     child: const Text('Sketch Image'),
//                   ),
//                   ElevatedButton(
//                     onPressed: () async {
//                       // call dialog and get value "camera" or "galery"
//                       final type = await _settingModalBottomSheet(context);
//                       if (type != null) {
//                         // call image pikcer
//                         final pickedFile = await _openImagePicker(type);
//                         if (pickedFile != null) {
//                           final directory =
//                               (await getExternalStorageDirectory())!.path;
//                           await Directory('$directory/$_image')
//                               .create(recursive: true);
//                           final fullPath =
//                               '$directory/$_image/${DateTime.now().millisecondsSinceEpoch}.png';

//                           // Save picked file to fullPath
//                           final savedFile = File(fullPath);
//                           await savedFile
//                               .writeAsBytes(await pickedFile.readAsBytes());
//                           setState(() {
//                             _image = pickedFile;

//                             image = fullPath;
//                           });
//                         }
//                       }
//                     },
//                     child: const Text('Select an Image'),
//                   ),
//                   ElevatedButton(
//                     onPressed: () async {
//                       if (_image != null) {
//                         final path = _image!.uri;
//                         File imageFile = File.fromUri(path);
//                         final paths = imageFile.path;
//                         await GallerySaver.saveImage(paths, toDcim: true);
//                       } else {
//                         return;
//                       }
//                     },
//                     child: const Text('Save Image'),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 35),
//               // The picked image will be displayed here
//               Container(
//                 alignment: Alignment.center,
//                 width: double.infinity,
//                 height: 300,
//                 color: Colors.grey[300],
//                 child: _image != null
//                     ? Image.file(_image!, fit: BoxFit.cover)
//                     : const Text('Please Select sn Image'),
//               ),

//               Wrap(
//                 children: <Widget>[
//                   ElevatedButton(
//                     //call image painter here
//                     onPressed: () async {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => ImagePainterExample(
//                                   image: image2,
//                                 )),
//                       );
//                     },
//                     child: const Text('Sketch Image'),
//                   ),
//                   ElevatedButton(
//                     onPressed: () async {
//                       // call dialog and get value "camera" or "galery"
//                       final type = await _settingModalBottomSheet(context);
//                       if (type != null) {
//                         // call image pikcer
//                         final pickedFile = await _openImagePicker(type);
//                         if (pickedFile != null) {
//                           final directory =
//                               (await getExternalStorageDirectory())!.path;
//                           await Directory('$directory/$_image2')
//                               .create(recursive: true);
//                           final fullPath =
//                               '$directory/$_image2/${DateTime.now().millisecondsSinceEpoch}.png';

//                           // Save picked file to fullPath
//                           final savedFile = File(fullPath);
//                           await savedFile
//                               .writeAsBytes(await pickedFile.readAsBytes());
//                           setState(() {
//                             _image2 = pickedFile;

//                             image2 = fullPath;
//                           });
//                         }
//                       }
//                     },
//                     child: const Text('Select an Image'),
//                   ),
//                   ElevatedButton(
//                     onPressed: () async {
//                       if (_image2 != null) {
//                         final path = _image2!.uri;
//                         File imageFile = File.fromUri(path);
//                         final paths = imageFile.path;
//                         await GallerySaver.saveImage(paths, toDcim: true);
//                       } else {
//                         return;
//                       }
//                     },
//                     child: const Text('Save Image'),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 35),
//               // The picked image will be displayed here
//               Container(
//                 alignment: Alignment.center,
//                 width: double.infinity,
//                 height: 300,
//                 color: Colors.grey[300],
//                 child: _image2 != null
//                     ? Image.file(_image2!, fit: BoxFit.cover)
//                     : const Text('Please Select an Image'),
//               ),

//               Wrap(
//                 children: <Widget>[
//                   ElevatedButton(
//                     //call image painter here
//                     onPressed: () async {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => ImagePainterExample(
//                                   image: image3,
//                                 )),
//                       );
//                     },
//                     child: const Text('Sketch Image'),
//                   ),
//                   ElevatedButton(
//                     onPressed: () async {
//                       // call dialog and get value "camera" or "galery"
//                       final type = await _settingModalBottomSheet(context);
//                       if (type != null) {
//                         // call image pikcer
//                         final pickedFile = await _openImagePicker(type);
//                         if (pickedFile != null) {
//                           final directory =
//                               (await getExternalStorageDirectory())!.path;
//                           await Directory('$directory/$_image')
//                               .create(recursive: true);
//                           final fullPath =
//                               '$directory/$_image/${DateTime.now().millisecondsSinceEpoch}.png';

//                           // Save picked file to fullPath
//                           final savedFile = File(fullPath);
//                           await savedFile
//                               .writeAsBytes(await pickedFile.readAsBytes());
//                           setState(() {
//                             _image3 = pickedFile;

//                             image3 = fullPath;
//                           });
//                         }
//                       }
//                     },
//                     child: const Text('Select An Image'),
//                   ),
//                   ElevatedButton(
//                     onPressed: () async {
//                       if (_image3 != null) {
//                         final path = _image3!.uri;
//                         File imageFile = File.fromUri(path);
//                         final paths = imageFile.path;
//                         await GallerySaver.saveImage(paths, toDcim: true);
//                       } else {
//                         return;
//                       }
//                     },
//                     child: const Text('Save Image'),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 35),
//               // The picked image will be displayed here
//               Container(
//                 alignment: Alignment.center,
//                 width: double.infinity,
//                 height: 300,
//                 color: Colors.grey[300],
//                 child: _image3 != null
//                     ? Image.file(_image3!, fit: BoxFit.cover)
//                     : const Text('Please Select an Image'),
//               ),

//               Wrap(
//                 children: <Widget>[
//                   ElevatedButton(
//                     //call image painter here
//                     onPressed: () async {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => ImagePainterExample(
//                                   image: image4,
//                                 )),
//                       );
//                     },
//                     child: const Text('Sketch Image'),
//                   ),
//                   ElevatedButton(
//                     onPressed: () async {
//                       // call dialog and get value "camera" or "galery"
//                       final type = await _settingModalBottomSheet(context);
//                       if (type != null) {
//                         // call image pikcer
//                         final pickedFile = await _openImagePicker(type);
//                         if (pickedFile != null) {
//                           final directory =
//                               (await getExternalStorageDirectory())!.path;
//                           await Directory('$directory/$_image4')
//                               .create(recursive: true);
//                           final fullPath =
//                               '$directory/$_image4/${DateTime.now().millisecondsSinceEpoch}.png';

//                           // Save picked file to fullPath
//                           final savedFile = File(fullPath);
//                           await savedFile
//                               .writeAsBytes(await pickedFile.readAsBytes());
//                           setState(() {
//                             _image4 = pickedFile;

//                             image4 = fullPath;
//                           });
//                         }
//                       }
//                     },
//                     child: const Text('Select an Image'),
//                   ),
//                   ElevatedButton(
//                     onPressed: () async {
//                       if (_image4 != null) {
//                         final path = _image4!.uri;
//                         File imageFile = File.fromUri(path);
//                         final paths = imageFile.path;
//                         await GallerySaver.saveImage(paths, toDcim: true);
//                       } else {
//                         return;
//                       }
//                     },
//                     child: const Text('Save Image'),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 35),
//               // The picked image will be displayed here
//               Container(
//                 alignment: Alignment.center,
//                 width: double.infinity,
//                 height: 300,
//                 color: Colors.grey[300],
//                 child: _image4 != null
//                     ? Image.file(_image4!, fit: BoxFit.cover)
//                     : const Text('Please Select an Image'),
//               ),

//               Wrap(
//                 children: <Widget>[
//                   ElevatedButton(
//                     //call image painter here
//                     onPressed: () async {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => ImagePainterExample(
//                                   image: image5,
//                                 )),
//                       );
//                     },
//                     child: const Text('Sketch Image'),
//                   ),
//                   ElevatedButton(
//                     onPressed: () async {
//                       // call dialog and get value "camera" or "galery"
//                       final type = await _settingModalBottomSheet(context);
//                       if (type != null) {
//                         // call image pikcer
//                         final pickedFile = await _openImagePicker(type);
//                         if (pickedFile != null) {
//                           final directory =
//                               (await getExternalStorageDirectory())!.path;
//                           await Directory('$directory/$_image5')
//                               .create(recursive: true);
//                           final fullPath =
//                               '$directory/$_image5/${DateTime.now().millisecondsSinceEpoch}.png';

//                           // Save picked file to fullPath
//                           final savedFile = File(fullPath);
//                           await savedFile
//                               .writeAsBytes(await pickedFile.readAsBytes());
//                           setState(() {
//                             _image5 = pickedFile;

//                             image5 = fullPath;
//                           });
//                         }
//                       }
//                     },
//                     child: const Text('Select An Image'),
//                   ),
//                   ElevatedButton(
//                     onPressed: () async {
//                       if (_image5 != null) {
//                         final path = _image5!.uri;
//                         File imageFile = File.fromUri(path);
//                         final paths = imageFile.path;
//                         await GallerySaver.saveImage(paths, toDcim: true);
//                       } else {
//                         return;
//                       }
//                     },
//                     child: const Text('Save Image'),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 35),
//               // The picked image will be displayed here
//               Container(
//                 alignment: Alignment.center,
//                 width: double.infinity,
//                 height: 300,
//                 color: Colors.grey[300],
//                 child: _image5 != null
//                     ? Image.file(_image5!, fit: BoxFit.cover)
//                     : const Text('Please Select an Image'),
//               ),

//               Wrap(
//                 children: <Widget>[
//                   ElevatedButton(
//                     //call image painter here
//                     onPressed: () async {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => ImagePainterExample(
//                                   image: image6,
//                                 )),
//                       );
//                     },
//                     child: const Text('Sketch Image'),
//                   ),
//                   ElevatedButton(
//                     onPressed: () async {
//                       // call dialog and get value "camera" or "galery"
//                       final type = await _settingModalBottomSheet(context);
//                       if (type != null) {
//                         // call image pikcer
//                         final pickedFile = await _openImagePicker(type);
//                         if (pickedFile != null) {
//                           final directory =
//                               (await getExternalStorageDirectory())!.path;
//                           await Directory('$directory/$_image6')
//                               .create(recursive: true);
//                           final fullPath =
//                               '$directory/$_image6/${DateTime.now().millisecondsSinceEpoch}.png';

//                           // Save picked file to fullPath
//                           final savedFile = File(fullPath);
//                           await savedFile
//                               .writeAsBytes(await pickedFile.readAsBytes());
//                           setState(() {
//                             _image6 = pickedFile;

//                             image6 = fullPath;
//                           });
//                         }
//                       }
//                     },
//                     child: const Text('Select an Image'),
//                   ),
//                   ElevatedButton(
//                     onPressed: () async {
//                       if (_image6 != null) {
//                         final path = _image6!.uri;
//                         File imageFile = File.fromUri(path);
//                         final paths = imageFile.path;
//                         await GallerySaver.saveImage(paths, toDcim: true);
//                       } else {
//                         return;
//                       }
//                     },
//                     child: const Text('Save Image'),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 35),
//               // The picked image will be displayed here
//               Container(
//                 alignment: Alignment.center,
//                 width: double.infinity,
//                 height: 300,
//                 color: Colors.grey[300],
//                 child: _image6 != null
//                     ? Image.file(_image6!, fit: BoxFit.cover)
//                     : const Text('Please Select an Image'),
//               ),
//             ]),
//           ),
//         ),
//       )),
//     );
//   }

//   Future<String?> _settingModalBottomSheet(context) {
//     return showModalBottomSheet(
//         context: context,
//         builder: (BuildContext bc) {
//           return Wrap(
//             children: <Widget>[
//               ListTile(
//                   title: const Text('Gallery'),
//                   onTap: () => {
//                         //  this will close dialog and return "galery"
//                         Navigator.pop(context, "gallery"),
//                       }),
//               ListTile(
//                 title: const Text('Camera'),
//                 onTap: () => {
//                   // this will close dialog and return "camera"
//                   Navigator.pop(context, "camera")
//                 },
//               ),
//             ],
//           );
//         });
//   }
// }

// // class ImagePainterExample extends StatefulWidget {
// //   const ImagePainterExample({super.key, required this.image});
// //   final String? image;

// //   @override
// //   // ignore: library_private_types_in_public_api
// //   _ImagePainterExampleState createState() =>
// //       // ignore: no_logic_in_create_state
// //       _ImagePainterExampleState(image_1: image);
// // }

// // class _ImagePainterExampleState extends State<ImagePainterExample> {
// //   final _imageKey = GlobalKey<ImagePainterState>();
// //   final _key = GlobalKey<ScaffoldState>();
// //   _ImagePainterExampleState({required this.image_1});
// //   String? image_1;

// //   void saveImage() async {
// //     final image = await _imageKey.currentState?.exportImage();
// //     final directory = (await getApplicationDocumentsDirectory()).path;
// //     await Directory('$directory/$image_1').create(recursive: true);
// //     final fullPath =
// //         '$directory/$image_1/${DateTime.now().millisecondsSinceEpoch}.png';
// //     final imgFile = File(fullPath);
// //     imgFile.writeAsBytesSync(image!);
// //     await GallerySaver.saveImage(fullPath, toDcim: true);
// //     // ignore: use_build_context_synchronously
// //     ScaffoldMessenger.of(context).showSnackBar(
// //       SnackBar(
// //         backgroundColor: Colors.grey[700],
// //         padding: const EdgeInsets.only(left: 10),
// //         content: Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //           children: [
// //             const Text("Image Exported successfully.",
// //                 style: TextStyle(color: Colors.white)),
// //             TextButton(
// //               onPressed: () => OpenFile.open(fullPath),
// //               child: Text(
// //                 "Open",
// //                 style: TextStyle(
// //                   color: Colors.blue[200],
// //                 ),
// //               ),
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       key: _key,
// //       appBar: AppBar(
// //         title: const Text("Image Sketch Example"),
// //         actions: [
// //           IconButton(
// //             icon: const Icon(Icons.save_alt),
// //             onPressed: saveImage,
// //           )
// //         ],
// //       ),
// //       body: ImagePainter.file(
// //         File(image_1!),
// //         key: _imageKey,
// //         scalable: true,
// //         initialStrokeWidth: 2,
// //         initialColor: Colors.green,
// //         initialPaintMode: PaintMode.line,
// //         placeholderWidget: Text(image_1!),
// //       ),
// //     );
// //   }
// // }
