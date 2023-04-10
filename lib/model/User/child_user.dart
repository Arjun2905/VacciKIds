class ChildUsers {
  // final String id;
  final String name;
  final String dob;
  final String track;
  ChildUsers({required this.name, required this.dob, required this.track});

  ChildUsers.fromData(Map<String,dynamic> data)
      // : id = data['id'],
      :  name = data['Name'],
        dob = data['DOB'],
        track = data['track'];

  Map<String,dynamic> toJson(){
    return{
      'Name': name,
      'DOB': dob,
      'Track': track
    };
  }
}