class Validator {
  static String? emailAdress(String? email) {
    if (email == null || email.isEmpty) {
      return 'Please provide an email adress';
    } else if (!email.contains(RegExp(r'[\w-._]*[@]\w+[.][a-zA-z]*'))) {
      return 'Please provide a valide email adress';
    } else {
      return null;
    }
  }

  static String? jobTitleValidator(String? jobTitle) {
    if (jobTitle == null || jobTitle.isEmpty) {
      return 'Please enter your job title';
    }
    return null;
  }

  static String? nameValidator(String? jobTitle) {
    if (jobTitle == null || jobTitle.isEmpty) {
      return 'Please enter your full name';
    }
    return null;
  }
}
