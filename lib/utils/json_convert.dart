import 'dart:convert';

const serverData = '''{
  "Response": {
    "leaves": [
      {
        "25-Apr-2023": [
          "601902/IT930N"
        ]
      },
      {
        "11-May-2023": [
          "601902/IT930N"
        ]
      },
      {
        "26-May-2023": [
          "101008/MA400A",
          "101008/IT400D",
          "101908/ES400F",
          "101008/MA400A",
          "101008/IT400C",
          "101903/MA400B"
        ]
      },
      {
        "14-Jun-2023": [
          "101008/IT400D",
          "101008/IT400C"
        ]
      },
      {
        "30-Jun-2023": [
          "101008/MA400A",
          "101903/MA400B",
          "101008/MA400A",
          "101008/IT400C",
          "101903/MA400B"
        ]
      },
      {
        "15-Jul-2023": [
          "101008/IT400D",
          "101008/IT400C",
          "101008/IT400D"
        ]
      }
    ],
    "uid": "U2108037"
  },
  "Status": "Success"
}''';
final data = jsonDecode(serverData);
final leaves = data['Response']['leaves'];
final rawAbsentData = getRawAbsentData(leaves);

Map<String, int> countAllOccurrences(List<String> values) {
  final counter = <String, int>{};
  for (final value in values) {
    counter.update(value, (count) => count + 1, ifAbsent: () => 1);
  }

  return counter;
}

List<String> getRawAbsentData(List leaves) {
  List<String> rawAbsentData = [];
  for (final item in leaves) {
    rawAbsentData.addAll([...item.values.toList()[0]]);
  }
  return rawAbsentData;
}
