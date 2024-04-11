import 'package:hive_flutter/adapters.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/models/note_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInitial());

  addNote(NoteModel note) async {
    emit(AddNotesLoading());
    try {
      var noteBox = Hive.box<NoteModel>(kNotesBox);
      emit(AddNotesSuccess());
      await noteBox.add(note);
    } catch (e) {
      emit(AddNotesfailure(e.toString()));
    }
  }
}
