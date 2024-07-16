class User {

    final String id;
    final String email;
    final String password;


    User({
      required this.id,
      required this.email,
      required this.password,
    });

    factory User.fromData(dynamic data){
        return User(id: data["_id"], email: data["email"], password: data["password"]);
    }

}