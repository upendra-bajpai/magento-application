class SignUpData {
  Customer _customer;
  String _password;

  SignUpData({Customer customer, String password}) {
    this._customer = customer;
    this._password = password;
  }

  Customer get customer => _customer;
  set customer(Customer customer) => _customer = customer;
  String get password => _password;
  set password(String password) => _password = password;

  SignUpData.fromJson(Map<String, dynamic> json) {
    _customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    _password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._customer != null) {
      data['customer'] = this._customer.toJson();
    }
    data['password'] = this._password;
    return data;
  }
}

class Customer {
  String _email;
  String _firstname;
  String _lastname;
  List<Addresses> _addresses;
  ExtensionAttributes _extensionAttributes;
  List<CustomAttributes> _customAttributes;

  Customer(
      {String email,
      String firstname,
      String lastname,
      List<Addresses> addresses,
      ExtensionAttributes extensionAttributes,
      List<CustomAttributes> customAttributes}) {
    this._email = email;
    this._firstname = firstname;
    this._lastname = lastname;
    this._addresses = addresses;
    this._extensionAttributes = extensionAttributes;
    this._customAttributes = customAttributes;
  }

  String get email => _email;
  set email(String email) => _email = email;
  String get firstname => _firstname;
  set firstname(String firstname) => _firstname = firstname;
  String get lastname => _lastname;
  set lastname(String lastname) => _lastname = lastname;
  List<Addresses> get addresses => _addresses;
  set addresses(List<Addresses> addresses) => _addresses = addresses;
  ExtensionAttributes get extensionAttributes => _extensionAttributes;
  set extensionAttributes(ExtensionAttributes extensionAttributes) =>
      _extensionAttributes = extensionAttributes;
  List<CustomAttributes> get customAttributes => _customAttributes;
  set customAttributes(List<CustomAttributes> customAttributes) =>
      _customAttributes = customAttributes;

  Customer.fromJson(Map<String, dynamic> json) {
    _email = json['email'];
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    if (json['addresses'] != null) {
      _addresses = new List<Addresses>();
      json['addresses'].forEach((v) {
        _addresses.add(new Addresses.fromJson(v));
      });
    }
    _extensionAttributes = json['extension_attributes'] != null
        ? new ExtensionAttributes.fromJson(json['extension_attributes'])
        : null;
    if (json['custom_attributes'] != null) {
      _customAttributes = new List<CustomAttributes>();
      json['custom_attributes'].forEach((v) {
        _customAttributes.add(new CustomAttributes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this._email;
    data['firstname'] = this._firstname;
    data['lastname'] = this._lastname;
    if (this._addresses != null) {
      data['addresses'] = this._addresses.map((v) => v.toJson()).toList();
    }
    if (this._extensionAttributes != null) {
      data['extension_attributes'] = this._extensionAttributes.toJson();
    }
    if (this._customAttributes != null) {
      data['custom_attributes'] =
          this._customAttributes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Addresses {
  bool _defaultShipping;
  bool _defaultBilling;
  String _firstname;
  String _lastname;
  Region _region;
  String _postcode;
  List<String> _street;
  String _city;
  String _telephone;
  String _countryId;

  Addresses(
      {bool defaultShipping,
      bool defaultBilling,
      String firstname,
      String lastname,
      Region region,
      String postcode,
      List<String> street,
      String city,
      String telephone,
      String countryId}) {
    this._defaultShipping = defaultShipping;
    this._defaultBilling = defaultBilling;
    this._firstname = firstname;
    this._lastname = lastname;
    this._region = region;
    this._postcode = postcode;
    this._street = street;
    this._city = city;
    this._telephone = telephone;
    this._countryId = countryId;
  }

  bool get defaultShipping => _defaultShipping;
  set defaultShipping(bool defaultShipping) =>
      _defaultShipping = defaultShipping;
  bool get defaultBilling => _defaultBilling;
  set defaultBilling(bool defaultBilling) => _defaultBilling = defaultBilling;
  String get firstname => _firstname;
  set firstname(String firstname) => _firstname = firstname;
  String get lastname => _lastname;
  set lastname(String lastname) => _lastname = lastname;
  Region get region => _region;
  set region(Region region) => _region = region;
  String get postcode => _postcode;
  set postcode(String postcode) => _postcode = postcode;
  List<String> get street => _street;
  set street(List<String> street) => _street = street;
  String get city => _city;
  set city(String city) => _city = city;
  String get telephone => _telephone;
  set telephone(String telephone) => _telephone = telephone;
  String get countryId => _countryId;
  set countryId(String countryId) => _countryId = countryId;

  Addresses.fromJson(Map<String, dynamic> json) {
    _defaultShipping = json['defaultShipping'];
    _defaultBilling = json['defaultBilling'];
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _region =
        json['region'] != null ? new Region.fromJson(json['region']) : null;
    _postcode = json['postcode'];
    _street = json['street'].cast<String>();
    _city = json['city'];
    _telephone = json['telephone'];
    _countryId = json['countryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['defaultShipping'] = this._defaultShipping;
    data['defaultBilling'] = this._defaultBilling;
    data['firstname'] = this._firstname;
    data['lastname'] = this._lastname;
    if (this._region != null) {
      data['region'] = this._region.toJson();
    }
    data['postcode'] = this._postcode;
    data['street'] = this._street;
    data['city'] = this._city;
    data['telephone'] = this._telephone;
    data['countryId'] = this._countryId;
    return data;
  }
}

class Region {
  String _regionCode;
  String _region;
  int _regionId;

  Region({String regionCode, String region, int regionId}) {
    this._regionCode = regionCode;
    this._region = region;
    this._regionId = regionId;
  }

  String get regionCode => _regionCode;
  set regionCode(String regionCode) => _regionCode = regionCode;
  String get region => _region;
  set region(String region) => _region = region;
  int get regionId => _regionId;
  set regionId(int regionId) => _regionId = regionId;

  Region.fromJson(Map<String, dynamic> json) {
    _regionCode = json['regionCode'];
    _region = json['region'];
    _regionId = json['regionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['regionCode'] = this._regionCode;
    data['region'] = this._region;
    data['regionId'] = this._regionId;
    return data;
  }
}

class ExtensionAttributes {
  bool _isSubscribed;

  ExtensionAttributes({bool isSubscribed}) {
    this._isSubscribed = isSubscribed;
  }

  bool get isSubscribed => _isSubscribed;
  set isSubscribed(bool isSubscribed) => _isSubscribed = isSubscribed;

  ExtensionAttributes.fromJson(Map<String, dynamic> json) {
    _isSubscribed = json['is_subscribed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_subscribed'] = this._isSubscribed;
    return data;
  }
}

class CustomAttributes {
  String _attributeCode;
  String _value;

  CustomAttributes({String attributeCode, String value}) {
    this._attributeCode = attributeCode;
    this._value = value;
  }

  String get attributeCode => _attributeCode;
  set attributeCode(String attributeCode) => _attributeCode = attributeCode;
  String get value => _value;
  set value(String value) => _value = value;

  CustomAttributes.fromJson(Map<String, dynamic> json) {
    _attributeCode = json['attribute_code'];
    _value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attribute_code'] = this._attributeCode;
    data['value'] = this._value;
    return data;
  }
}
