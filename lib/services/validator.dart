abstract class StringValidator {
  bool isValid(String value);
}

class NotEmptyEmailandPassword implements StringValidator {
  @override
  bool isValid(String value) {
    // TODO: implement isValid
    return value.isNotEmpty;
  }
}

class EmailandPasswordValidator {
  final StringValidator emailvalidator = NotEmptyEmailandPassword();
  final StringValidator passwordvalidator = NotEmptyEmailandPassword();
}
