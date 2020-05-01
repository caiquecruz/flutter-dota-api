class Heroe {
  int id;
  String name;
  String localizedName;
  String primaryAttr;
  String attackType;
  List<String> roles;
  int legs;

  Heroe(
      {this.id,
      this.name,
      this.localizedName,
      this.primaryAttr,
      this.attackType,
      this.roles,
      this.legs});

  Heroe.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    localizedName = json['localized_name'];
    primaryAttr = json['primary_attr'];
    attackType = json['attack_type'];
    roles = json['roles'].cast<String>();
    legs = json['legs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['localized_name'] = this.localizedName;
    data['primary_attr'] = this.primaryAttr;
    data['attack_type'] = this.attackType;
    data['roles'] = this.roles;
    data['legs'] = this.legs;
    return data;
  }

  @override
  String toString() {
    return 'Heroe(id: $id, name: $name, localizedName: $localizedName, primaryAttr: $primaryAttr, attackType: $attackType, roles: $roles, legs: $legs)';
  }
}
