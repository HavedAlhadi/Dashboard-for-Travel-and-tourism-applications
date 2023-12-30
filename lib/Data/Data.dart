import 'package:intl/intl.dart';
import 'package:kayan_controle/Data/Modle.dart';
 
 List<Story> Mstories=[
  Story(Id: "",index: -1,name: "جديد",img:""),  
  ];


List<InterfaceControl> InterfaceControlslist = [
    InterfaceControl(TotalU: 4500, enableSelect: false,enableDark: true,id: "YsSVzEbl93N0SRb0UwKm",TotaSelsct: 5000.0),    
  ];


List<Customer> CustomersListItem = [
  
];
List<Accounts_> Accountslist = [
];

List<Received> ListUser = [
  // Received(
  //   id: "",
  //   number: "717171717",
  //   name: "Haved",
  //   lastMassag: TableMessages[2],
  // ),
  //  Received(
  //   id: "",
  //   number: "171717",
  //   name: "سيسب",
  //   lastMassag: TableMessages[1],
  // ),
];


List<MessTabl> TableMessages=[
  // MessTabl(id: "", numberReceive: "717171717", timeSend: "12:23 PM", Contant: "Contant sdfsfaf zsf"),
  // MessTabl(id: "", numberReceive: "171717", timeSend: "12:23 PM", Contant: "Ali baba"),
  // MessTabl(id: "", numberReceive: "717171717", timeSend: "12:23 PM", Contant: "Ali baba"),

];

String DateNow(){
DateTime now = DateTime.now();
          var formatterDate = DateFormat('dd/MM/yy');
          var formatterTime = DateFormat('kk:mm');
          String actualDate = formatterDate.format(now);
          String actualTime = formatterTime.format(now);
          return actualTime;
}
