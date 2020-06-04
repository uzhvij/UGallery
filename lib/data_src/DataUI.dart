class DataUI{
  static final DataUI instance = DataUI._constructor();
  static double fontSize = 16.0;

  DataUI._constructor();

  factory DataUI(){
    return instance;
  }
  static setFontSize(int size){
    switch(size) {
      case 720:
        fontSize = 13.0;
        break;
      case 1080:
        fontSize = 16.0;
        break;
      case 1440:
        fontSize = 17.0;
        break;
    }
  }

  static getFontSize(){
    return fontSize;
  }
}