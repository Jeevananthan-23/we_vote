// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) =>
    List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  Welcome({
    this.inputs,
    this.name,
    this.outputs,
    this.stateMutability,
    this.type,
    this.anonymous,
  });

  List<Put> inputs;
  String name;
  List<Put> outputs;
  StateMutability stateMutability;
  Type type;
  bool anonymous;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        inputs: List<Put>.from(json["inputs"].map((x) => Put.fromJson(x))),
        name: json["name"] == null ? null : json["name"],
        outputs: json["outputs"] == null
            ? null
            : List<Put>.from(json["outputs"].map((x) => Put.fromJson(x))),
        stateMutability: json["stateMutability"] == null
            ? null
            : stateMutabilityValues.map[json["stateMutability"]],
        type: typeValues.map[json["type"]],
        anonymous: json["anonymous"] == null ? null : json["anonymous"],
      );

  Map<String, dynamic> toJson() => {
        "inputs": List<dynamic>.from(inputs.map((x) => x.toJson())),
        "name": name == null ? null : name,
        "outputs": outputs == null
            ? null
            : List<dynamic>.from(outputs.map((x) => x.toJson())),
        "stateMutability": stateMutability == null
            ? null
            : stateMutabilityValues.reverse[stateMutability],
        "type": typeValues.reverse[type],
        "anonymous": anonymous == null ? null : anonymous,
      };
}

class Put {
  Put({
    this.internalType,
    this.name,
    this.type,
    this.indexed,
  });

  String internalType;
  String name;
  String type;
  bool indexed;

  factory Put.fromJson(Map<String, dynamic> json) => Put(
        internalType: json["internalType"],
        name: json["name"],
        type: json["type"],
        indexed: json["indexed"] == null ? null : json["indexed"],
      );

  Map<String, dynamic> toJson() => {
        "internalType": internalType,
        "name": name,
        "type": type,
        "indexed": indexed == null ? null : indexed,
      };
}

enum StateMutability { NONPAYABLE, VIEW }

final stateMutabilityValues = EnumValues(
    {"nonpayable": StateMutability.NONPAYABLE, "view": StateMutability.VIEW});

enum Type { FUNCTION, CONSTRUCTOR, EVENT }

final typeValues = EnumValues({
  "constructor": Type.CONSTRUCTOR,
  "event": Type.EVENT,
  "function": Type.FUNCTION
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
