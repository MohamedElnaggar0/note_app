import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/models/note_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInitial());
  Color color = const Color(0xff93032E);
  addNote(NoteModel note) async {
    note.color = color.value;
    emit(AddNotesLoading());
    try {
      var noteBox = Hive.box<NoteModel>(kNotesBox);
      await noteBox.add(note);
      emit(AddNotesSuccess());
    } catch (e) {
      emit(AddNotesfailure(e.toString()));
    }
  }
}
