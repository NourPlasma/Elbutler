/// name : ""
/// lat : 0.0
/// lng : 0.0

class DummyLocationModel {
  DummyLocationModel({
      this.name, 
      this.lat, 
      this.lng,});

  DummyLocationModel.fromJson(dynamic json) {
    name = json['name'];
    lat = json['lat'];
    lng = json['log'];
  }
  String? name;
  num? lat;
  num? lng;
DummyLocationModel copyWith({  String? name,
  num? lat,
  num? lng,
}) => DummyLocationModel(  name: name ?? this.name,
  lat: lat ?? this.lat,
  lng: lng ?? this.lng,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['lat'] = lat;
    map['lng'] = lng;
    return map;
  }

}