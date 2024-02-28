import 'package:flutter/material.dart';
import 'package:note_app/views/widgets/custom_app_bar.dart';
import 'package:note_app/views/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CustomAppBar(title: 'Edit Notes', icon: Icons.check),
          SizedBox(
            height: 40,
          ),
          CustomTextField(hintText: 'Title'),
          SizedBox(height: 20),
          CustomTextField(
            hintText: 'content',
            maxLines: 5,
          )
        ],
      ),
    );
  }
}
