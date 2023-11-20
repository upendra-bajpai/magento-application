// ignore_for_file: public_member_api_docs, sort_constructors_first
class LoginModal {
  late String _message;
  late List<Errors> _errors;
  late int _code;
  late List<Parameters> _parameters;
  late String _trace;

  factory LoginModal.my(int statusCode, String msg) {
    return LoginModal(message: msg, code: statusCode);
  }

  LoginModal(
      {required String message,
      List<Errors>? errors,
      required int code,
      List<Parameters>? parameters,
      String? trace}) {
    this._message = message;
    this._errors = errors ?? [];
    this._code = code;
    this._parameters = parameters ?? [];
    this._trace = trace ?? '';
  }

  String get message => _message;
  set message(String message) => _message = message;
  List<Errors> get errors => _errors;
  set errors(List<Errors> errors) => _errors = errors;
  int get code => _code;
  set code(int code) => _code = code;
  List<Parameters> get parameters => _parameters;
  set parameters(List<Parameters> parameters) => _parameters = parameters;
  String get trace => _trace;
  set trace(String trace) => _trace = trace;

  LoginModal.fromJson(Map<String, dynamic> json) {
    _message = json['message'];
    if (json['errors'] != null) {
      _errors = [];
      json['errors'].forEach((v) {
        _errors.add(new Errors.fromJson(v));
      });
    }
    _code = json['code'];
    if (json['parameters'] != null) {
      _parameters = [];
      json['parameters'].forEach((v) {
        _parameters.add(new Parameters.fromJson(v));
      });
    }
    _trace = json['trace'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this._message;
    if (this._errors != null) {
      data['errors'] = this._errors.map((v) => v.toJson()).toList();
    }
    data['code'] = this._code;
    if (this._parameters != null) {
      data['parameters'] = this._parameters.map((v) => v.toJson()).toList();
    }
    data['trace'] = this._trace;
    return data;
  }

  LoginModal copyWith({
    String? message,
    List<Errors>? errors,
    int? code,
    List<Parameters>? parameters,
    String? trace,
  }) {
    return LoginModal(
        message: message ?? this._message,
        errors: errors ?? this.errors,
        code: code ?? this.code,
        parameters: parameters ?? this.parameters,
        trace: trace ?? this._trace);
  }
}

class Errors {
  late String _message;
  late List<Parameters> _parameters;

  Errors({required String message, required List<Parameters> parameters}) {
    this._message = message;
    this._parameters = parameters;
  }

  String get message => _message;
  set message(String message) => _message = message;
  List<Parameters> get parameters => _parameters;
  set parameters(List<Parameters> parameters) => _parameters = parameters;

  Errors.fromJson(Map<String, dynamic> json) {
    _message = json['message'];
    if (json['parameters'] != null) {
      _parameters = [];
      json['parameters'].forEach((v) {
        _parameters.add(new Parameters.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this._message;
    if (this._parameters != null) {
      data['parameters'] = this._parameters.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Parameters {
  late String _resources;
  late String _fieldName;
  late String _fieldValue;

  Parameters(
      {required String resources,
      required String fieldName,
      required String fieldValue}) {
    this._resources = resources;
    this._fieldName = fieldName;
    this._fieldValue = fieldValue;
  }

  String get resources => _resources;
  set resources(String resources) => _resources = resources;
  String get fieldName => _fieldName;
  set fieldName(String fieldName) => _fieldName = fieldName;
  String get fieldValue => _fieldValue;
  set fieldValue(String fieldValue) => _fieldValue = fieldValue;

  Parameters.fromJson(Map<String, dynamic> json) {
    _resources = json['resources'];
    _fieldName = json['fieldName'];
    _fieldValue = json['fieldValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resources'] = this._resources;
    data['fieldName'] = this._fieldName;
    data['fieldValue'] = this._fieldValue;
    return data;
  }
}
