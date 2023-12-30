//كلاس قصص الخدمات
class Story {
  int index;
  String name;
  String img;
  String Id;
  Story({
    required this.Id,
    required this.index, required this.img, required this.name});
}

//كلاس التحكم في الواجهات 
class InterfaceControl {
  String id;
  int TotalU;
  double TotaSelsct;
  bool enableSelect;
  bool enableDark;
  InterfaceControl({required this.enableDark ,required this.enableSelect, required this.TotalU,required this.id,required this.TotaSelsct});
}

//كلاس الحسابات
class Accounts_ {
  String id;
  String name;
  String image;
  bool enable;
  String link;
  Accounts_(
      {required this.name,
      required this.enable,
      required this.image,
      required this.link,
      required this.id});
}


 //صف المستخدم
class Received {
  String id;
  String name;
  String number;
  String lastMassag;  
  Received({
    required this.id,
    required this.name,
    required this.number,
    required this.lastMassag,
  });
}



class MessTabl {
  String id;
  String numberReceive;
  String timeSend;
  String Contant;
  MessTabl({
    required this.id,
    required this.numberReceive,
    required this.timeSend,
    required this.Contant,
  });
}

// بيانات العملاء
class Customer {
  String id;
  String name;
  String numberPhone;
  String numPassport;
  String ImageTrans;
  String TypeTrans;
  String StatusTrans;
  String NumberTrans;
  String DateTrans;
  Customer({
    required this.id,
    required this.name,
    required this.numberPhone,
    required this.numPassport,
    required this.ImageTrans,
    required this.StatusTrans,
    required this.TypeTrans,
    required this.NumberTrans,
    required this.DateTrans,
  });
}


