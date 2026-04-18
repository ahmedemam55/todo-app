import 'package:flutter/material.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Add New Task",
            style: theme.textTheme.bodyLarge?.copyWith(color: Colors.black),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(hintText: "Enter Task Title"),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "please enter task title";
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: descriptionController,
            maxLines: 3,
            decoration: InputDecoration(hintText: "Enter Task Description"),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "please enter task Description";
              }
              return null;
            },
          ),
          const SizedBox(height: 20),

          Text(
            "Select Time",
            style: theme.textTheme.bodyLarge?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight(500),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "20 Aug",
            style: theme.textTheme.bodyLarge?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight(500),
            ),
            textAlign: TextAlign.center,
          ),
          Spacer(),
          FilledButton(
            onPressed: () {},
            style: FilledButton.styleFrom(backgroundColor: theme.primaryColor),
            child: Text(
              "Save",
              style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
