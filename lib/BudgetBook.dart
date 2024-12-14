import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(BudgetBookApp());
}

class BudgetBookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BudgetBookManager(),
    );
  }
}

class BudgetBook {
  final String id; // Unique ID for the book
  final String name;
  final String description;

  BudgetBook({
    required this.id,
    required this.name,
    required this.description,
  });
}

class BudgetBookManager extends StatefulWidget {
  @override
  _BudgetBookManagerState createState() => _BudgetBookManagerState();
}

class _BudgetBookManagerState extends State<BudgetBookManager> {
  final List<BudgetBook> _books = []; // List of books

  // Add a new budget book
  void _addBook(String name, String description) {
    setState(() {
      _books.add(BudgetBook(
        id: Random().nextInt(10000).toString(),
        name: name,
        description: description,
      ));
    });
  }

  // Remove a budget book
  void _removeBook(String id) {
    setState(() {
      _books.removeWhere((book) => book.id == id);
    });
  }

  // Open a dialog to add a new book
  void _openAddBookDialog(BuildContext context) {
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text("Add New Budget Book"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Book Name"),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: "Description"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty &&
                    descriptionController.text.isNotEmpty) {
                  _addBook(nameController.text, descriptionController.text);
                  Navigator.of(ctx).pop();
                }
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Budget Books"),
      ),
      body: _books.isEmpty
          ? Center(
        child: Text(
          "No Budget Books found. Add one!",
          style: TextStyle(fontSize: 18),
        ),
      )
          : ListView.builder(
        itemCount: _books.length,
        itemBuilder: (ctx, index) {
          final book = _books[index];
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: ListTile(
              title: Text(book.name),
              subtitle: Text(book.description),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () => _removeBook(book.id),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openAddBookDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
