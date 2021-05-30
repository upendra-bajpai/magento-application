
class SignUpResponse {
  int _id;
  int _groupId;
  String _createdAt;
  String _updatedAt;
  String _createdIn;
  String _email;
  String _firstname;
  String _lastname;
  int _storeId;
  int _websiteId;
  List<Null> _addresses;
  int _disableAutoGroupChange;
  ExtensionAttributes _extensionAttributes;

  SignUpResponse(
      {int id,
      int groupId,
      String createdAt,
      String updatedAt,
      String createdIn,
      String email,
      String firstname,
      String lastname,
      int storeId,
      int websiteId,
      List<Null> addresses,
      int disableAutoGroupChange,
      ExtensionAttributes extensionAttributes}) {
    this._id = id;
    this._groupId = groupId;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
    this._createdIn = createdIn;
    this._email = email;
    this._firstname = firstname;
    this._lastname = lastname;
    this._storeId = storeId;
    this._websiteId = websiteId;
    this._addresses = addresses;
    this._disableAutoGroupChange = disableAutoGroupChange;
    this._extensionAttributes = extensionAttributes;
  }

  int get id => _id;
  set id(int id) => _id = id;
  int get groupId => _groupId;
  set groupId(int groupId) => _groupId = groupId;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  String get updatedAt => _updatedAt;
  set updatedAt(String updatedAt) => _updatedAt = updatedAt;
  String get createdIn => _createdIn;
  set createdIn(String createdIn) => _createdIn = createdIn;
  String get email => _email;
  set email(String email) => _email = email;
  String get firstname => _firstname;
  set firstname(String firstname) => _firstname = firstname;
  String get lastname => _lastname;
  set lastname(String lastname) => _lastname = lastname;
  int get storeId => _storeId;
  set storeId(int storeId) => _storeId = storeId;
  int get websiteId => _websiteId;
  set websiteId(int websiteId) => _websiteId = websiteId;
  List<Null> get addresses => _addresses;
  set addresses(List<Null> addresses) => _addresses = addresses;
  int get disableAutoGroupChange => _disableAutoGroupChange;
  set disableAutoGroupChange(int disableAutoGroupChange) =>
      _disableAutoGroupChange = disableAutoGroupChange;
  ExtensionAttributes get extensionAttributes => _extensionAttributes;
  set extensionAttributes(ExtensionAttributes extensionAttributes) =>
      _extensionAttributes = extensionAttributes;

  SignUpResponse.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _groupId = json['group_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _createdIn = json['created_in'];
    _email = json['email'];
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _storeId = json['store_id'];
    _websiteId = json['website_id'];
   /*  if (json['addresses'] != null) {
      _addresses = new List<Null>();
      json['addresses'].forEach((v) {
        _addresses.add(new Null.fromJson(v));
      });
    } */
    _disableAutoGroupChange = json['disable_auto_group_change'];
    _extensionAttributes = json['extension_attributes'] != null
        ? new ExtensionAttributes.fromJson(json['extension_attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['group_id'] = this._groupId;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['created_in'] = this._createdIn;
    data['email'] = this._email;
    data['firstname'] = this._firstname;
    data['lastname'] = this._lastname;
    data['store_id'] = this._storeId;
    data['website_id'] = this._websiteId;
    /* if (this._addresses != null) {
      data['addresses'] = this._addresses.map((v) => v.toJson()).toList();
    } */
    data['disable_auto_group_change'] = this._disableAutoGroupChange;
    if (this._extensionAttributes != null) {
      data['extension_attributes'] = this._extensionAttributes.toJson();
    }
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
