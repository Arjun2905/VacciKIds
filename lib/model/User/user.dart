class Users {
  final String id;
  final String name;
  final String email;
  final String city;
  String childCount = '0';
  Users({required this.city, required this.id, required this.name, required this.email});

  Users.fromData(Map<String,dynamic> data)
    : id = data['id'],
      name = data['name'],
      email = data['email'],
      city = data['city'],
      childCount = data['childCount'];

  Map<String,dynamic> toJson(){
    return{
      'id' : id,
      'name' : name,
      'email' : email,
      'city' : city,
      'childCount' : childCount
    };
  }
}