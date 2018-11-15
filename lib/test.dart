main(List<String> args) {
  String s = 'H1ell_o2W3orld4_';
  RegExp re = RegExp(r"([A-Z|\d*]*[a-z|\d*]*)");
  String _fileName = '';
  List<String> list = re.allMatches(s).map((v) {
    String value = v.group(0);
    return value.toLowerCase();
  }).toList();
  list.removeWhere((v) => v.isEmpty);
  _fileName = list.join('_');
  print(_fileName);
}
