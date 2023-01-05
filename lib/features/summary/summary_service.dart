import 'package:flutter_translate/flutter_translate.dart';
import 'package:wedding_jc/domain/person.dart';

import '../../resources/diets_menu_allergies_intolerances.dart';

class SummaryService {
  final List<Person> persons;

  SummaryService(this.persons);

  String get summaryDiet {
    int totalRegularDiet =
        persons.where((element) => element.typeDiet == null || element.typeDiet == Diet.regular.title).length;
    int totalVegetarianDiet = persons.where((element) => element.typeDiet == Diet.vegetarian.title).length;
    int totalVeganDiet = persons.where((element) => element.typeDiet == Diet.vegan.title).length;

    String s = '[${translate(Diet.regular.title)}:](B) $totalRegularDiet';
    s = '$s\n[${translate(Diet.vegetarian.title)}:](B) $totalVegetarianDiet';
    s = '$s\n[${translate(Diet.vegan.title)}:](B) $totalVeganDiet';
    return s;
  }

  String get summaryMenu {
    int totalAdultMenu =
        persons.where((element) => element.typeMenu == null || element.typeMenu == Menu.adult.title).length;
    int totalInfantMenu = persons.where((element) => element.typeMenu == Menu.infant.title).length;

    String s = '[${translate(Menu.adult.title)}:](B) $totalAdultMenu';
    s = '$s\n[${translate(Menu.infant.title)}:](B) $totalInfantMenu';
    return s;
  }

  int get totalHotelPeople {
    return persons.where((element) => element.hotel != null && element.hotel!).length;
  }

  int get totalBusPeople {
    return persons.where((element) => element.bus != null && element.bus!).length;
  }

  List<List<String>> get summaryPersons {
    List<List<String>> result = [];
    for (Person person in persons) {
      String s =
          '[${translate('add_diet_and_intolerances_question_menu')}:](B) ${person.typeMenu == null || person.typeMenu == '' ? translate(Menu.adult.title) : translate(person.typeMenu!)}';
      s = '$s\n[${translate('add_diet_and_intolerances_question_diet')}:](B) ${person.typeDiet == null || person.typeDiet == '' ? translate(Diet.regular.title) : translate(person.typeDiet!)}';
      if (person.intolerances != null && person.intolerances!.isNotEmpty) {
        s = '$s\n[${translate('add_diet_and_intolerances_question_intolerances')}:](B)';
        for (String intolerance in person.intolerances!) {
          s = '$s   ${translate(intolerance)}';
          if (intolerance != person.intolerances!.last) {
            s = '$s,';
          }
        }
      }
      if (person.allergies != null && person.allergies!.isNotEmpty) {
        s = '$s\n[${translate('add_diet_and_intolerances_question_allergy')}:](B)';
        for (String allergy in person.allergies!) {
          s = '$s ${translate(allergy)}';
          if (allergy != person.allergies!.last) {
            s = '$s,';
          }
        }
      }
      s = person.otherAllergiesAndIntolerances == null || person.otherAllergiesAndIntolerances == ''
          ? s
          : '$s\n[${translate('add_diet_and_intolerances_question_other')}:](B) ${translate(person.otherAllergiesAndIntolerances!)}';
      s = person.observations == null || person.observations == ''
          ? s
          : '$s\n[${translate('add_diet_and_intolerances_question_observations')}:](B) ${translate(person.observations!)}';
      s = '$s\n[${translate('bus')}:](B) ${person.bus ?? false ? translate('yes') : translate('no')}';
      s = '$s\n[${translate('hotel')}:](B) ${person.hotel ?? false ? translate('yes') : translate('no')}';
      result.add([person.displayName, s]);
    }
    return result;
  }
}
