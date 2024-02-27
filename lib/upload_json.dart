import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import this

class JsonUploadScreen extends StatefulWidget {
  @override
  _JsonUploadScreenState createState() => _JsonUploadScreenState();
}

class _JsonUploadScreenState extends State<JsonUploadScreen> {
  final CollectionReference _collection =
  FirebaseFirestore.instance.collection('Recipes-1');

  Future<void> _uploadJsonToFirestore(String jsonFilePath) async {
    try {
      // Use rootBundle to load content from assets
      final String jsonString =
      await rootBundle.loadString(jsonFilePath); // Correct way to load asset content

      final Map<String, dynamic> jsonData = json.decode(jsonString);

      // Upload each document from the JSON file to Firestore
      jsonData.forEach((documentId, documentData) async {
        await _collection.doc(documentId).set(documentData);
      });

      print('JSON file uploaded successfully.');
    } catch (error) {
      print('Error uploading JSON file: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload JSON to Firestore'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Replace 'assets/data/db_recipes.json' with the correct asset path
            _uploadJsonToFirestore('assets/data/db_recipes1.json');
          },
          child: Text('Upload JSON to Firestore'),
        ),
      ),
    );
  }
}
