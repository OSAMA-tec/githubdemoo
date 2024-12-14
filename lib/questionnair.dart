import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'BudgetBook.dart';

class QuestionnairePage extends StatefulWidget {
  @override
  _QuestionnairePageState createState() => _QuestionnairePageState();
}

class _QuestionnairePageState extends State<QuestionnairePage> {
  List<String> selectedCategories = [];
  final List<String> categories = ["Food", "Transport", "Utility", "Groceries", "Merchandise"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Questionnaire", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Please answer these questions for the best experience.",
                style: TextStyle(color: Colors.black54),
              ),
              SizedBox(height: 20),
              Text("Personal Questions.", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildTextField("Date of Birth *", "DD/MM/YYYY"),
              _buildDropdown("Profession *", ["Student", "Employee", "Other"]),
              _buildDropdown("Marital Status *", ["Single", "Married", "Other"]),
              SizedBox(height: 20),
              Text("Add Recurring Expenses.", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildTextField("Electricity", "Rs 19,000"),
              _buildTextField("Fees", "Rs 208,000"),
              _buildTextField("Gas", "Rs 1,320"),
              _buildTextField("Rent", "Rs 25,000"),
              _buildDropdown("Monthly Loans ?", ["Car Loan", "House Loan", "None"]),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Select Categories where you spend most.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    " *",
                    style: TextStyle(color: Colors.red), // Red asterisk for required field
                  ),
                ],
              ),
              Text("(At least select any 3)", style: TextStyle(color: Colors.black54)),
              _buildCheckboxList(categories),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: selectedCategories.length >= 3
                      ? () {
                    // Navigate to BudgetBookManager on Submit
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => BudgetBookManager()),
                    );
                  }
                      : null,
                  child: Text("Submit"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        keyboardType: label == "Date of Birth *" ? TextInputType.number : TextInputType.text,
        inputFormatters: label == "Date of Birth *"
            ? [
          FilteringTextInputFormatter.digitsOnly,
          TextInputFormatter.withFunction((oldValue, newValue) {
            String text = newValue.text;
            if (text.length > 2 && text[2] != '/') {
              text = text.substring(0, 2) + '/' + text.substring(2);
            }
            if (text.length > 5 && text[5] != '/') {
              text = text.substring(0, 5) + '/' + text.substring(5);
            }
            return TextEditingValue(
              text: text,
              selection: TextSelection.collapsed(offset: text.length),
            );
          }),
        ]
            : [],
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> options) {
    String dropdownValue = options[0];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        value: dropdownValue,
        items: options.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (newValue) {},
      ),
    );
  }

  Widget _buildCheckboxList(List<String> items) {
    return Column(
      children: items.map((item) {
        return CheckboxListTile(
          title: Text(item),
          value: selectedCategories.contains(item),
          onChanged: (bool? value) {
            setState(() {
              if (value == true) {
                selectedCategories.add(item);
              } else {
                selectedCategories.remove(item);
              }
            });
          },
          activeColor: Colors.blue, // Blue tick mark color
        );
      }).toList(),
    );
  }
}
