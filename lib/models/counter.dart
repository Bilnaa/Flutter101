class MyService {

  static final MyService _instance = MyService._internal();

  // passes the instantiation to the _instance object
  factory MyService() => _instance;


  //initialize variables in here
  MyService._internal() {
    _myVariable = 0;
  }

  int _myVariable = 0;

  //short getter for my variable
  int get myVariable => _myVariable;

  //short setter for my variable
  set myVariable(int value) => myVariable = value;

  void incrementMyVariable() => _myVariable++;
  void decrementMyVariable() => _myVariable--;
  void resetMyVariable() => _myVariable = 0;
}