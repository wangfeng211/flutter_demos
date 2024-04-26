class PhoneClass {

  static final PhoneClass _instance = PhoneClass._internal();

  //私有的命名函数，声明后用户无法通过PhoneClass() 创建一个新的对象
  PhoneClass._internal();

  factory PhoneClass(){
    return _instance;
  }

  // static PhoneClass getInstance(){
  //   return _instance;
  // }
}