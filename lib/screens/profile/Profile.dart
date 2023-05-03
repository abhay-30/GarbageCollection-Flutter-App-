import 'package:ecotags/const/color.dart';
import 'package:ecotags/providers/user/UserDetailsProvider.dart';
import 'package:ecotags/screens/profile/PhotoGallery.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecotags/screens/welcome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
  }

  void deletePicture(String pictureId) async {
    // Delete the picture from Firestore

    // Delete the image file from Firebase Storage
    print("\n\n\n\n       ");
    String uid_hai = FirebaseAuth.instance.currentUser!.uid;
    print('uploads/${FirebaseAuth.instance.currentUser!.uid}/$pictureId');
    try {
      final ref = FirebaseStorage.instance.refFromURL(pictureId);

      // Delete the image
      await ref.delete();
    } catch (e) {
      print("\n\n\n\n       ");
    }

    try {
      final storageRef = FirebaseFirestore.instance
          .collection('users')
          .doc(uid_hai)
          .collection('user_images');
      print(storageRef);

      // Get a list of all the files in the folder
      final QuerySnapshot userImagesSnapshot = await storageRef.get();

// Iterate over all documents in the userImages collection
      for (final doc in userImagesSnapshot.docs) {
        final imageUrl = doc.get('url');

        // Check if the URL matches the pictureId
        if (imageUrl == pictureId) {
          // Delete the document from the userImages collection
          await storageRef.doc(doc.id).delete();
        }
        // ...
      }
    } catch (e) {
      print(
          "/////////////////////////////////////////////////////////////////////////////////////////////////////");
    }
    // Update the user's pictures list
  }

  void _showImageDetailsDialog(Picture picture) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Image Details'),
          content: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(
                  picture.image,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10),
                Text('Location: ${picture.latitude} ${picture.longitude}'),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                // Implement delete functionality here
                deletePicture(picture.image);
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserDetailsProvider>(
      builder: (context, user, child) {
        return Scaffold(
          backgroundColor: backgroundColor,
          body: Container(
            padding: EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Column(
              children: [
                Flexible(
                  flex: 1,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Text(
                                  '@${user.firstName}',
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              CircleAvatar(
                                radius: 50,
                                backgroundImage: AssetImage(
                                  'assets/user.jpg',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${user.points} Points',
                                    style: TextStyle(
                                      color: Colors.blueGrey[400],
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    user.rank,
                                    style: TextStyle(
                                      color: Colors.blueGrey[400],
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                icon: Icon(Icons.logout),
                                color: Colors.white,
                                onPressed: () async {
                                  await FirebaseAuth.instance.signOut();
                                  Navigator.of(context)
                                      .pushNamed(WelcomeScreen.tag);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Column(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          color: primaryColor,
                          child: Text(
                            'Saved Images',
                            style: TextStyle(
                              color: appColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      // Flexible(
                      //   flex: 11,
                      //   child: PictureGallery(pictures: user.pictures),
                      // ),
                      Flexible(
                        flex: 11,
                        child: GridView.count(
                          crossAxisCount: 3,
                          children: List.generate(
                            user.pictures.length,
                            (index) {
                              return GestureDetector(
                                child: Image.network(
                                  user.pictures[index].image,
                                  fit: BoxFit.cover,
                                ),
                                onTap: () {
                                  _showImageDetailsDialog(user.pictures[index]);
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
