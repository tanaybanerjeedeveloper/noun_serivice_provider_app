import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:noun_service_app/widgets/bottom_navigation_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';
import 'package:open_file/open_file.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';

import '../widgets/app_bar.dart';
import '../widgets/button.dart';
import '../utilities/constants.dart';

class FormScreen extends StatefulWidget {
  //FormScreen({Key? key}) : super(key: key);
  static const routeName = 'form_screen';

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  File? imageAadharFront;
  File? imageAadharBack;
  FilePickerResult? gstResult;
  PlatformFile? gstFile;
  PlatformFile? gstDoc;
  PlatformFile? stationLicenseDoc;
  final _formKey = GlobalKey<FormState>();
  late String _name;

  String fileOneName = '';
  String fileTwoName = '';

  Future pickImageAadharFront(ImageSource source) async {
    try {
      final img = await ImagePicker().pickImage(source: source);
      final imageTemporary = File(img!.path);
      print('Temp Image: $imageTemporary');
      setState(() {
        imageAadharFront = imageTemporary;
        print('Image $imageAadharFront');
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageAadharBack(ImageSource source) async {
    try {
      final img = await ImagePicker().pickImage(source: source);
      final imageTemporary = File(img!.path);
      print('Temp Image: $imageTemporary');
      setState(() {
        imageAadharBack = imageTemporary;
        print('Image $imageAadharBack');
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<void> pickFiles() async {
    gstResult = await FilePicker.platform.pickFiles();
    if (gstResult == null) return;
    gstFile = gstResult!.files.first;
    viewFile(gstFile!);
  }

  void viewFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }

  void _onSubmit(BuildContext context) {
    if (_formKey.currentState!.validate()) {}
    // final isValid = _formKey.currentState!.validate();

    // if (isValid) {
    //   Timer(const Duration(milliseconds: 500),
    //       () => Navigator.pushNamed(context, BottomNavigation.routeName));
    // }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MyAppBar('Form', false),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: mediaQuery.height * 0.05,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
                child: Row(
                  children: [
                    Text(
                      'GST Certificate',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: mediaQuery.height * 0.02,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        final filePickerOne = await FilePicker.platform
                            .pickFiles(
                                type: FileType.custom,
                                allowedExtensions: [
                              'pdf',
                              'jpg',
                              'jpeg',
                              'png'
                            ]);
                        if (filePickerOne == null) return;

                        final fileOne = filePickerOne.files.first;
                        openFile(fileOne);
                        print('Name: ${fileOne.name}');

                        setState(() {
                          fileOneName = fileOne.name;
                          gstDoc = fileOne;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                          image: const DecorationImage(
                            image: AssetImage('assets/images/pdf.png'),
                            fit: BoxFit.none,
                          ),
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            const BoxShadow(
                              color: Colors.black,
                              offset: Offset(-4, -4),
                              blurRadius: 10,
                            )
                          ],
                        ),
                        height: mediaQuery.height * 0.15,
                        width: mediaQuery.width * 0.3,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: mediaQuery.height * 0.01,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.06),
                child: ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      radius: 5.0,
                    ),
                  ),
                  title: Text(
                    'Upload your GST certificate',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              SizedBox(
                height: mediaQuery.height * 0.05,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
                child: Row(
                  children: [
                    Text(
                      'Aadhar Upload',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: mediaQuery.height * 0.02,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => pickImageAadharFront(ImageSource.gallery),
                      child: Container(
                        decoration: BoxDecoration(
                          image: (imageAadharFront != null)
                              ? DecorationImage(
                                  image: FileImage(imageAadharFront!),
                                  fit: BoxFit.scaleDown)
                              : DecorationImage(
                                  image: AssetImage('assets/images/img.png'),
                                  fit: BoxFit.scaleDown,
                                ),
                          // color: Colors.blue,
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            const BoxShadow(
                              color: Colors.black,
                              offset: Offset(-4, -4),
                              blurRadius: 10,
                            )
                          ],
                        ),
                        height: mediaQuery.height * 0.15,
                        width: mediaQuery.width * 0.3,
                      ),
                    ),
                    SizedBox(
                      width: mediaQuery.width * 0.1,
                    ),
                    InkWell(
                      onTap: () => pickImageAadharBack(ImageSource.gallery),
                      child: Container(
                        decoration: BoxDecoration(
                          image: (imageAadharBack != null)
                              ? DecorationImage(
                                  image: FileImage(imageAadharBack!),
                                  fit: BoxFit.scaleDown)
                              : DecorationImage(
                                  image: AssetImage('assets/images/img.png'),
                                  fit: BoxFit.scaleDown,
                                ),
                          // color: Colors.blue,
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            const BoxShadow(
                              color: Colors.black,
                              offset: Offset(-4, -4),
                              blurRadius: 10,
                            )
                          ],
                        ),
                        height: mediaQuery.height * 0.15,
                        width: mediaQuery.width * 0.3,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: mediaQuery.height * 0.01,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.06),
                child: ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      radius: 5.0,
                    ),
                  ),
                  title: Text(
                    'Upload the front and back side of Aadhar',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              SizedBox(
                height: mediaQuery.height * 0.05,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
                child: Row(
                  children: [
                    Text(
                      'Station License Document',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: mediaQuery.height * 0.02,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        print('clicked');
                        final filePickerOne = await FilePicker.platform
                            .pickFiles(
                                type: FileType.custom,
                                allowedExtensions: [
                              'pdf',
                              'jpg',
                              'jpeg',
                              'png'
                            ]);
                        if (filePickerOne == null) return;

                        final fileOne = filePickerOne.files.first;
                        openFile(fileOne);
                        print('Name: ${fileOne.name}');

                        setState(() {
                          fileTwoName = fileOne.name;
                          stationLicenseDoc = fileOne;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/pdf.png'),
                            fit: BoxFit.none,
                          ),
                          // color: Colors.blue,
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            const BoxShadow(
                              color: Colors.black,
                              offset: Offset(-4, -4),
                              blurRadius: 10,
                            )
                          ],
                        ),
                        height: mediaQuery.height * 0.15,
                        width: mediaQuery.width * 0.3,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: mediaQuery.height * 0.01,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.06),
                child: ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      radius: 5.0,
                    ),
                  ),
                  title: Text(
                    'Upload the station license document',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              SizedBox(
                height: mediaQuery.height * 0.05,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
                child: Row(
                  children: [
                    Text(
                      'PAN Document',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: mediaQuery.height * 0.02,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        print('clicked');
                        final filePickerOne = await FilePicker.platform
                            .pickFiles(
                                type: FileType.custom,
                                allowedExtensions: [
                              'pdf',
                              'jpg',
                              'jpeg',
                              'png'
                            ]);
                        if (filePickerOne == null) return;

                        final fileOne = filePickerOne.files.first;
                        openFile(fileOne);
                        print('Name: ${fileOne.name}');

                        setState(() {
                          fileTwoName = fileOne.name;
                          stationLicenseDoc = fileOne;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/pdf.png'),
                            fit: BoxFit.none,
                          ),
                          // color: Colors.blue,
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            const BoxShadow(
                              color: Colors.black,
                              offset: Offset(-4, -4),
                              blurRadius: 10,
                            )
                          ],
                        ),
                        height: mediaQuery.height * 0.15,
                        width: mediaQuery.width * 0.3,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: mediaQuery.height * 0.01,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.06),
                child: ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      radius: 5.0,
                    ),
                  ),
                  title: Text(
                    'Upload the PAN document',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              SizedBox(
                height: mediaQuery.height * 0.05,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
                child: Row(
                  children: [
                    Text(
                      'Name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  decoration: kTextFieldDecoration,
                  onSaved: (value) {},
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your name';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: mediaQuery.height * 0.05,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
                child: Row(
                  children: [
                    Text(
                      'Email',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'somewhat@gmail.com'),
                  onSaved: (value) {},
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your email';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: mediaQuery.height * 0.05,
              ),

              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
                child: Row(
                  children: [
                    Text(
                      'Aadhar Number',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Your Aadhar Number'),
                  onSaved: (value) {},
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your Aadhar Number';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: mediaQuery.height * 0.05,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
                child: Row(
                  children: [
                    Text(
                      'GST Number',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Your GST Number'),
                  onSaved: (value) {},
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your GST Number';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: mediaQuery.height * 0.05,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
                child: Row(
                  children: [
                    Text(
                      'PAN Number',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  decoration:
                      kTextFieldDecoration.copyWith(hintText: 'PAN Number'),
                  onSaved: (value) {},
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter PAN Number';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: mediaQuery.height * 0.05,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
                child: Row(
                  children: [
                    Text(
                      'Bank Name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  decoration:
                      kTextFieldDecoration.copyWith(hintText: 'Your Bank Name'),
                  onSaved: (value) {},
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Bank Name';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: mediaQuery.height * 0.05,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
                child: Row(
                  children: [
                    Text(
                      'Account Number',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Your Bank Account Number'),
                  onSaved: (value) {},
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Bank Account Number';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: mediaQuery.height * 0.05,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
                child: Row(
                  children: [
                    Text(
                      'Station License Number',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Your Station License Number'),
                  onSaved: (value) {},
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Station ';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: mediaQuery.height * 0.05,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
                child: Row(
                  children: [
                    Text(
                      'IFSC Code',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  decoration:
                      kTextFieldDecoration.copyWith(hintText: 'IFSC Code'),
                  onSaved: (value) {},
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter IFSC Code';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: mediaQuery.height * 0.05,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
                child: Row(
                  children: [
                    Text(
                      'UPI Code',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  decoration:
                      kTextFieldDecoration.copyWith(hintText: 'UPI Code'),
                  onSaved: (value) {},
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter UPI Code';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: mediaQuery.height * 0.05,
              ),
              Center(
                child: Button('SAVE', () {
                  _onSubmit(context);
                }),
              ),
              SizedBox(
                height: mediaQuery.height * 0.05,
              ),
              // Padding(
              //   padding:
              //       EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
              //   child: Row(
              //     children: [
              //       Text(
              //         'Name',
              //         style: TextStyle(fontWeight: FontWeight.bold),
              //       )
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: mediaQuery.height * 0.02,
              // ),
              // TextFormField(
              //   onSaved: (value) {},
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Enter your name';
              //     }
              //     return null;
              //   },
              //   cursorColor: Theme.of(context).primaryColor,
              //   decoration: kTextFieldDecoration.copyWith(hintText: 'Your Name'),
              // ),
              // SizedBox(
              //   height: mediaQuery.height * 0.05,
              // ),
              // Padding(
              //   padding:
              //       EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
              //   child: Row(
              //     children: [
              //       Text(
              //         'Email',
              //         style: TextStyle(fontWeight: FontWeight.bold),
              //       )
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: mediaQuery.height * 0.02,
              // ),
              // Container(
              //   margin:
              //       const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(25.0),
              //     boxShadow: [
              //       const BoxShadow(
              //           color: Color(0xff00ffba),
              //           offset: Offset(2, 2),
              //           blurRadius: 10,
              //           spreadRadius: 0.2),
              //       const BoxShadow(
              //         color: Colors.black,
              //         offset: Offset(-4, -4),
              //         blurRadius: 10,
              //       )
              //     ],
              //   ),
              //   child: TextField(
              //     onChanged: (value) {},
              //     decoration: kTextFieldDecoration.copyWith(
              //         hintText: 'somewhat@gmail.com'),
              //     cursorColor: Theme.of(context).primaryColor,
              //   ),
              // ),
              // SizedBox(
              //   height: mediaQuery.height * 0.05,
              // ),
              // Padding(
              //   padding:
              //       EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
              //   child: Row(
              //     children: [
              //       Text(
              //         'Charging Type',
              //         style: TextStyle(fontWeight: FontWeight.bold),
              //       )
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: mediaQuery.height * 0.02,
              // ),
              // Container(
              //   margin:
              //       const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(25.0),
              //     boxShadow: [
              //       const BoxShadow(
              //           color: Color(0xff00ffba),
              //           offset: Offset(2, 2),
              //           blurRadius: 10,
              //           spreadRadius: 0.2),
              //       const BoxShadow(
              //         color: Colors.black,
              //         offset: Offset(-4, -4),
              //         blurRadius: 10,
              //       )
              //     ],
              //   ),
              //   child: TextField(
              //     onChanged: (value) {},
              //     cursorColor: Theme.of(context).primaryColor,
              //     decoration:
              //         kTextFieldDecoration.copyWith(hintText: 'AC/DC Type'),
              //   ),
              // ),
              // SizedBox(
              //   height: mediaQuery.height * 0.05,
              // ),
              // Padding(
              //   padding:
              //       EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
              //   child: Row(
              //     children: [
              //       Text(
              //         'City',
              //         style: TextStyle(fontWeight: FontWeight.bold),
              //       )
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: mediaQuery.height * 0.02,
              // ),
              // Container(
              //   margin:
              //       const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(25.0),
              //     boxShadow: [
              //       const BoxShadow(
              //           color: Color(0xff00ffba),
              //           offset: Offset(2, 2),
              //           blurRadius: 10,
              //           spreadRadius: 0.2),
              //       const BoxShadow(
              //         color: Colors.black,
              //         offset: Offset(-4, -4),
              //         blurRadius: 10,
              //       )
              //     ],
              //   ),
              //   child: TextField(
              //     onChanged: (value) {},
              //     cursorColor: Theme.of(context).primaryColor,
              //     decoration: kTextFieldDecoration.copyWith(hintText: 'Kolkata'),
              //   ),
              // ),
              // SizedBox(
              //   height: mediaQuery.height * 0.05,
              // ),
              // Padding(
              //   padding:
              //       EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
              //   child: Row(
              //     children: [
              //       Text(
              //         'GST Number',
              //         style: TextStyle(fontWeight: FontWeight.bold),
              //       )
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: mediaQuery.height * 0.02,
              // ),
              // Container(
              //   margin:
              //       const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(25.0),
              //     boxShadow: [
              //       const BoxShadow(
              //           color: Color(0xff00ffba),
              //           offset: Offset(2, 2),
              //           blurRadius: 10,
              //           spreadRadius: 0.2),
              //       const BoxShadow(
              //         color: Colors.black,
              //         offset: Offset(-4, -4),
              //         blurRadius: 10,
              //       )
              //     ],
              //   ),
              //   child: TextField(
              //     onChanged: (value) {},
              //     cursorColor: Theme.of(context).primaryColor,
              //     decoration:
              //         kTextFieldDecoration.copyWith(hintText: '123456789012'),
              //   ),
              // ),
              // SizedBox(
              //   height: mediaQuery.height * 0.05,
              // ),
              // Padding(
              //   padding:
              //       EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
              //   child: Row(
              //     children: [
              //       Text(
              //         'GST Certificate',
              //         style: TextStyle(fontWeight: FontWeight.bold),
              //       )
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: mediaQuery.height * 0.02,
              // ),
              // Padding(
              //   padding:
              //       EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
              //   child: Row(
              //     children: [
              //       InkWell(
              //         onTap: () async {
              //           final filePickerOne = await FilePicker.platform.pickFiles(
              //               type: FileType.custom,
              //               allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png']);
              //           if (filePickerOne == null) return;

              //           final fileOne = filePickerOne.files.first;
              //           openFile(fileOne);
              //           print('Name: ${fileOne.name}');

              //           setState(() {
              //             fileOneName = fileOne.name;
              //             gstDoc = fileOne;
              //           });
              //         },
              //         child: Container(
              //           decoration: BoxDecoration(
              //             // color: Colors.blue,
              //             image: const DecorationImage(
              //               image: AssetImage('assets/images/pdf.png'),
              //               fit: BoxFit.none,
              //             ),
              //             color: Theme.of(context).colorScheme.secondary,
              //             borderRadius: BorderRadius.circular(10.0),
              //             boxShadow: [
              //               const BoxShadow(
              //                 color: Colors.black,
              //                 offset: Offset(-4, -4),
              //                 blurRadius: 10,
              //               )
              //             ],
              //           ),
              //           height: mediaQuery.height * 0.15,
              //           width: mediaQuery.width * 0.3,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: mediaQuery.height * 0.01,
              // ),
              // Padding(
              //   padding:
              //       EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.06),
              //   child: ListTile(
              //     leading: Container(
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(15.0),
              //       ),
              //       padding: const EdgeInsets.all(8.0),
              //       child: CircleAvatar(
              //         backgroundColor: Theme.of(context).primaryColor,
              //         radius: 5.0,
              //       ),
              //     ),
              //     title: Text(
              //       'Upload your GST certificate',
              //       style: TextStyle(fontSize: 14),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: mediaQuery.height * 0.05,
              // ),
              // Padding(
              //   padding:
              //       EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
              //   child: Row(
              //     children: [
              //       Text(
              //         'Aadhar Number',
              //         style: TextStyle(fontWeight: FontWeight.bold),
              //       )
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: mediaQuery.height * 0.02,
              // ),
              // Container(
              //   margin:
              //       const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(25.0),
              //     boxShadow: [
              //       const BoxShadow(
              //           color: Color(0xff00ffba),
              //           offset: Offset(2, 2),
              //           blurRadius: 10,
              //           spreadRadius: 0.2),
              //       const BoxShadow(
              //         color: Colors.black,
              //         offset: Offset(-4, -4),
              //         blurRadius: 10,
              //       )
              //     ],
              //   ),
              //   child: TextField(
              //     onChanged: (value) {},
              //     cursorColor: Theme.of(context).primaryColor,
              //     decoration:
              //         kTextFieldDecoration.copyWith(hintText: '12345678912'),
              //   ),
              // ),
              // SizedBox(
              //   height: mediaQuery.height * 0.05,
              // ),
              // Padding(
              //   padding:
              //       EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
              //   child: Row(
              //     children: [
              //       Text(
              //         'Aadhar Upload',
              //         style: TextStyle(fontWeight: FontWeight.bold),
              //       )
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: mediaQuery.height * 0.02,
              // ),
              // Padding(
              //   padding:
              //       EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
              //   child: Row(
              //     children: [
              //       InkWell(
              //         onTap: () => pickImageAadharFront(ImageSource.gallery),
              //         child: Container(
              //           decoration: BoxDecoration(
              //             image: (imageAadharFront != null)
              //                 ? DecorationImage(
              //                     image: FileImage(imageAadharFront!),
              //                     fit: BoxFit.scaleDown)
              //                 : DecorationImage(
              //                     image: AssetImage('assets/images/img.png'),
              //                     fit: BoxFit.scaleDown,
              //                   ),
              //             // color: Colors.blue,
              //             color: Theme.of(context).colorScheme.secondary,
              //             borderRadius: BorderRadius.circular(10.0),
              //             boxShadow: [
              //               const BoxShadow(
              //                 color: Colors.black,
              //                 offset: Offset(-4, -4),
              //                 blurRadius: 10,
              //               )
              //             ],
              //           ),
              //           height: mediaQuery.height * 0.15,
              //           width: mediaQuery.width * 0.3,
              //         ),
              //       ),
              //       SizedBox(
              //         width: mediaQuery.width * 0.1,
              //       ),
              //       InkWell(
              //         onTap: () => pickImageAadharBack(ImageSource.gallery),
              //         child: Container(
              //           decoration: BoxDecoration(
              //             image: (imageAadharBack != null)
              //                 ? DecorationImage(
              //                     image: FileImage(imageAadharBack!),
              //                     fit: BoxFit.scaleDown)
              //                 : DecorationImage(
              //                     image: AssetImage('assets/images/img.png'),
              //                     fit: BoxFit.scaleDown,
              //                   ),
              //             // color: Colors.blue,
              //             color: Theme.of(context).colorScheme.secondary,
              //             borderRadius: BorderRadius.circular(10.0),
              //             boxShadow: [
              //               const BoxShadow(
              //                 color: Colors.black,
              //                 offset: Offset(-4, -4),
              //                 blurRadius: 10,
              //               )
              //             ],
              //           ),
              //           height: mediaQuery.height * 0.15,
              //           width: mediaQuery.width * 0.3,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: mediaQuery.height * 0.01,
              // ),
              // Padding(
              //   padding:
              //       EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.06),
              //   child: ListTile(
              //     leading: Container(
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(15.0),
              //       ),
              //       padding: const EdgeInsets.all(8.0),
              //       child: CircleAvatar(
              //         backgroundColor: Theme.of(context).primaryColor,
              //         radius: 5.0,
              //       ),
              //     ),
              //     title: Text(
              //       'Upload the front and back side of Aadhar',
              //       style: TextStyle(fontSize: 14),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: mediaQuery.height * 0.05,
              // ),
              // Padding(
              //   padding:
              //       EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
              //   child: Row(
              //     children: [
              //       Text(
              //         'Station License Document',
              //         style: TextStyle(fontWeight: FontWeight.bold),
              //       )
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: mediaQuery.height * 0.02,
              // ),
              // Padding(
              //   padding:
              //       EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
              //   child: Row(
              //     children: [
              //       InkWell(
              //         onTap: () async {
              //           print('clicked');
              //           final filePickerOne = await FilePicker.platform.pickFiles(
              //               type: FileType.custom,
              //               allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png']);
              //           if (filePickerOne == null) return;

              //           final fileOne = filePickerOne.files.first;
              //           openFile(fileOne);
              //           print('Name: ${fileOne.name}');

              //           setState(() {
              //             fileTwoName = fileOne.name;
              //             stationLicenseDoc = fileOne;
              //           });
              //         },
              //         child: Container(
              //           decoration: BoxDecoration(
              //             image: DecorationImage(
              //               image: AssetImage('assets/images/pdf.png'),
              //               fit: BoxFit.none,
              //             ),
              //             // color: Colors.blue,
              //             color: Theme.of(context).colorScheme.secondary,
              //             borderRadius: BorderRadius.circular(10.0),
              //             boxShadow: [
              //               const BoxShadow(
              //                 color: Colors.black,
              //                 offset: Offset(-4, -4),
              //                 blurRadius: 10,
              //               )
              //             ],
              //           ),
              //           height: mediaQuery.height * 0.15,
              //           width: mediaQuery.width * 0.3,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: mediaQuery.height * 0.01,
              // ),
              // Padding(
              //   padding:
              //       EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.06),
              //   child: ListTile(
              //     leading: Container(
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(15.0),
              //       ),
              //       padding: const EdgeInsets.all(8.0),
              //       child: CircleAvatar(
              //         backgroundColor: Theme.of(context).primaryColor,
              //         radius: 5.0,
              //       ),
              //     ),
              //     title: Text(
              //       'Upload the station license document',
              //       style: TextStyle(fontSize: 14),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: mediaQuery.height * 0.05,
              // ),
              // Padding(
              //   padding:
              //       EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
              //   child: Row(
              //     children: [
              //       Text(
              //         'Bank Name',
              //         style: TextStyle(fontWeight: FontWeight.bold),
              //       )
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: mediaQuery.height * 0.02,
              // ),
              // Container(
              //   margin:
              //       const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(25.0),
              //     boxShadow: [
              //       const BoxShadow(
              //           color: Color(0xff00ffba),
              //           offset: Offset(2, 2),
              //           blurRadius: 10,
              //           spreadRadius: 0.2),
              //       const BoxShadow(
              //         color: Colors.black,
              //         offset: Offset(-4, -4),
              //         blurRadius: 10,
              //       )
              //     ],
              //   ),
              //   child: TextField(
              //     onChanged: (value) {},
              //     cursorColor: Theme.of(context).primaryColor,
              //     decoration:
              //         kTextFieldDecoration.copyWith(hintText: '123456789012'),
              //   ),
              // ),
              // SizedBox(
              //   height: mediaQuery.height * 0.05,
              // ),
              // Padding(
              //   padding:
              //       EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
              //   child: Row(
              //     children: [
              //       Text(
              //         'Account Number',
              //         style: TextStyle(fontWeight: FontWeight.bold),
              //       )
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: mediaQuery.height * 0.02,
              // ),
              // Container(
              //   margin:
              //       const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(25.0),
              //     boxShadow: [
              //       const BoxShadow(
              //           color: Color(0xff00ffba),
              //           offset: Offset(2, 2),
              //           blurRadius: 10,
              //           spreadRadius: 0.2),
              //       const BoxShadow(
              //         color: Colors.black,
              //         offset: Offset(-4, -4),
              //         blurRadius: 10,
              //       )
              //     ],
              //   ),
              //   child: TextField(
              //     onChanged: (value) {},
              //     cursorColor: Theme.of(context).primaryColor,
              //     decoration:
              //         kTextFieldDecoration.copyWith(hintText: '123456789012'),
              //   ),
              // ),
              // SizedBox(
              //   height: mediaQuery.height * 0.05,
              // ),
              // Padding(
              //   padding:
              //       EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
              //   child: Row(
              //     children: [
              //       Text(
              //         'IFSC Code',
              //         style: TextStyle(fontWeight: FontWeight.bold),
              //       )
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: mediaQuery.height * 0.02,
              // ),
              // Container(
              //   margin:
              //       const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(25.0),
              //     boxShadow: [
              //       const BoxShadow(
              //           color: Color(0xff00ffba),
              //           offset: Offset(2, 2),
              //           blurRadius: 10,
              //           spreadRadius: 0.2),
              //       const BoxShadow(
              //         color: Colors.black,
              //         offset: Offset(-4, -4),
              //         blurRadius: 10,
              //       )
              //     ],
              //   ),
              //   child: TextField(
              //     onChanged: (value) {},
              //     cursorColor: Theme.of(context).primaryColor,
              //     decoration:
              //         kTextFieldDecoration.copyWith(hintText: '123456789012'),
              //   ),
              // ),
              // SizedBox(
              //   height: mediaQuery.height * 0.05,
              // ),
              // Padding(
              //   padding:
              //       EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
              //   child: Row(
              //     children: [
              //       Text(
              //         'UPI Code',
              //         style: TextStyle(fontWeight: FontWeight.bold),
              //       )
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: mediaQuery.height * 0.02,
              // ),
              // Container(
              //   margin:
              //       const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(25.0),
              //     boxShadow: [
              //       const BoxShadow(
              //           color: Color(0xff00ffba),
              //           offset: Offset(2, 2),
              //           blurRadius: 10,
              //           spreadRadius: 0.2),
              //       const BoxShadow(
              //         color: Colors.black,
              //         offset: Offset(-4, -4),
              //         blurRadius: 10,
              //       )
              //     ],
              //   ),
              //   child: TextField(
              //     onChanged: (value) {},
              //     cursorColor: Theme.of(context).primaryColor,
              //     decoration:
              //         kTextFieldDecoration.copyWith(hintText: '123456789012'),
              //   ),
              // ),
              // SizedBox(
              //   height: mediaQuery.height * 0.07,
              // ),
              // // Center(
              // //   child: Button('SAVE', () {
              // //     Navigator.pushNamed(context, BottomNavigation.routeName);
              // //   }),
              // Center(
              //   child: Button('SAVE', () {
              //     _onSubmit(context);
              //   }),
              // ),
              // SizedBox(
              //   height: mediaQuery.height * 0.07,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
