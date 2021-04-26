class ValidadorHelper {
  static String isNotEmptyValue(String text) {
    return text.isEmpty || text == '0' ? 'Campo Obrigatório' : null;
  }
}
