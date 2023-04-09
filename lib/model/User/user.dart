class Users {
  final String id;
  final String name;
  final String email;
  final List<String> childIds;
  String childCount = '0';
  Users({required this.childIds, required this.id, required this.name, required this.email});

  Users.fromData(Map<String,dynamic> data)
    : id = data['id'],
      name = data['name'],
      email = data['email'],
      childIds = data['childIds'],
      childCount = data['childCount'];

  Map<String,dynamic> toJson(){
    return{
      'id' : id,
      'name' : name,
      'email' : email,
      'childIds' : childIds,
      'childCount' : childIds.length
    };
  }
}