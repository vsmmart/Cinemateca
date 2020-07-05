class Usuario {
  //Atributos
  String _id;
  String _username;
  String _password;


  //Construtor
  Usuario(this._id, this._username, this._password);

  //Getters
  String get id => _id;
  String get username => _username;
  String get password => _password;

  Usuario.map(dynamic obj){
    this._id = obj['id'];
    this._username = obj['username'];
    this._password = obj['password'];
  }

  //Converter os dados para um Mapa
  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic> ();
    if(_id != null){
      map["id"] = _id;
    }
    map["username"] = _username;
    map["password"] = _password;
    return map;
  }

  //Converter um Mapa para o modelo de dados
  Usuario.fromMap(Map<String, dynamic> map, String id){
    //Atribuir id ao this._id, somente se id não for
    //nulo, caso contrário atribui '' (vazio).
    this._id = id ?? '';
    this._username = map["username"];
    this._password = map["password"];
  }

}