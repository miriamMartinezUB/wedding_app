import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedding_jc/domain/form.dart';
import 'package:wedding_jc/domain/person.dart';
import 'package:wedding_jc/domain/question/index.dart';
import 'package:wedding_jc/infrastructure/storage/remote/person_storage.dart';

part 'app_form_event.dart';
part 'app_form_state.dart';

class AppFormBloc extends Bloc<AppFormEvent, AppFormState> {
  late AppForm _form;
  final PersonStorage _storage = PersonStorage();
  AppFormBloc(String formId) : super(FormInitial()) {
    on<SaveFormEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<EditQuestionFormEvent>((event, emit) {
      List<Question> questions = [];
      for (var question in _form.questions) {
        late Question newQuestion;
        if (question.id == event.questionId) {
          if (question is FreeTextQuestion) {
            newQuestion = question.copyWith(value: event.value);
          } else if (question is DateQuestion) {
            newQuestion = question.copyWith(date: event.value);
          } else if (question is SingleSelectionQuestion) {
            newQuestion = question.copyWith(initialSelectedValue: event.value);
          } else if (question is CheckBoxQuestion) {
            List<String> values = question.initialSelectedValues ?? [];
            if (values.contains(event.value)) {
              values.remove(event.value);
            } else {
              values.add(event.value);
            }
            newQuestion = question.copyWith(initialSelectedValues: values);
          }
          questions.add(newQuestion);
        } else {
          questions.add(question);
        }
      }
      _form = _form.copyWith(questions: questions);
      emit(FormLoaded(form: _form));
    });
    on<LoadFormEvent>((event, emit) async {
      _form = await _storage.getFormFromIdAndPersonaId(formId, event.personId);
      if (event.addValues) {
        List<Person> persons = await _storage.all;
        List<String> values = persons.map((e) => e.displayName).toList();
        _form = _form.copyWith(
            questions: _form.questions
                .map(
                  (question) => (question as CheckBoxQuestion).copyWith(values: values),
                )
                .toList());
      }
      emit(FormLoaded(form: _form));
    });
  }
}
