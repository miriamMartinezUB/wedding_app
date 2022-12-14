import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:wedding_jc/domain/form.dart';
import 'package:wedding_jc/domain/person.dart';
import 'package:wedding_jc/domain/question/index.dart';
import 'package:wedding_jc/infrastructure/storage/remote/person_storage.dart';
import 'package:wedding_jc/resources/form_ids.dart';

part 'app_form_event.dart';
part 'app_form_state.dart';

class AppFormBloc extends Bloc<AppFormEvent, AppFormState> {
  late AppForm _form;
  final PersonStorage _storage = PersonStorage();
  AppFormBloc(String formId) : super(FormInitial()) {
    on<SaveFormEvent>((event, emit) async {
      emit(FormLoading());
      if (formId == FormIds.dietAndIntolerancesFormId) {
        Person person = await _storage.get(event.personId!);
        await _storage.update(
          person.copyWith(
            typeMenu: (_form.questions[0] as SingleSelectionQuestion).selectedValue,
            typeDiet: (_form.questions[1] as SingleSelectionQuestion).selectedValue,
            intolerances: (_form.questions[2] as CheckBoxQuestion).selectedValues,
            allergies: (_form.questions[3] as CheckBoxQuestion).selectedValues,
            otherAllergiesAndIntolerances: (_form.questions[4] as FreeTextQuestion).value ?? '',
            observations: (_form.questions[5] as FreeTextQuestion).value ?? '',
          ),
        );
      }
      if (formId == FormIds.personFormId) {
        if (event.newPerson) {
          await _storage.add(
            Person(
              id: const Uuid().v4(),
              name: (_form.questions[0] as FreeTextQuestion).value ?? '',
              surnames: (_form.questions[1] as FreeTextQuestion).value ?? '',
              birthday: (_form.questions[2] as DateQuestion).date,
            ),
          );
        } else {
          Person person = await _storage.get(event.personId!);
          await _storage.update(
            person.copyWith(
              name: (_form.questions[0] as FreeTextQuestion).value,
              surnames: (_form.questions[1] as FreeTextQuestion).value,
              birthday: (_form.questions[2] as DateQuestion).date,
            ),
          );
        }
      }
      if (formId == FormIds.interestedBusFormId) {
        for (Person person in (await _storage.all)) {
          await _storage.update(
            person.copyWith(
                bus: (_form.questions.first as CheckBoxQuestion).selectedValues?.contains(person.displayName) ?? false),
          );
        }
      }
      if (formId == FormIds.interestedHotelFormId) {
        for (Person person in (await _storage.all)) {
          await _storage.update(
            person.copyWith(
                hotel:
                    (_form.questions.first as CheckBoxQuestion).selectedValues?.contains(person.displayName) ?? false),
          );
        }
      }
      emit(FormSaved());
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
            newQuestion = question.copyWith(selectedValue: event.value);
          } else if (question is CheckBoxQuestion) {
            List values = question.selectedValues ?? [];
            if (values.contains(event.value)) {
              values.remove(event.value);
            } else {
              values.add(event.value);
            }
            newQuestion = question.copyWith(selectedValues: values);
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
      _form = await _storage.getFormFromIdAndPersonaId(formId, event.personId, addValues: event.addValues);
      emit(FormLoaded(form: _form));
    });
  }
}
