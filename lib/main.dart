
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  double balance = 500;
  void addMoney() {
      balance += 500;
      print(balance);
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Billionaire App!"),
          centerTitle: true,
          titleTextStyle: TextStyle(fontSize: 20),
        ),
        body: Container(
          //trong container thì phải có bố cục row column
          padding: EdgeInsets.all(20),
          color: Colors.blueGrey[500],
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, //với cái option này thì các nội dung bên trong row chỉ chiếm 1 phần nhỏ đúng bằng kích thước của nó,nếu muốn các nội dung của phần tử bên trong chiếm hết chiều rộng thì cần gán width: double.infinity
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      //Vì nó dính cái spacebetween nên ko cho phép thg container 1 chiếm hết chiều rộng, 3 phần tử phải dãn bằng nhau, nếu muốn phá vỡ cái đó thì phải bọc nó trong Expanded //And this is because whenever this container or child is wrapped with this expanded widget, the child expands to the available space that is available to them. Vì thế nên cũng không cần thg width: double.infinity làm gì
                      //với mỗi expanded thì sẽ có argument flex với các hệ số tương ứng khi chia các thành phần
                      color: Colors.red,
                      child: Text("1"),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(color: Colors.green, child: Text("2")),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(color: Colors.blue, child: Text("3")),
                  ),
                ],
              ),
              Expanded(
                flex: 9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Balance Part"),
                    SizedBox(height: 20),
                    Text("$balance"),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  //có 3 loại button elevated,text,outlined,
                  onPressed: addMoney,
                  child: Text("Add Money"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[700],
                    minimumSize: Size(
                      double
                          .infinity, //thằng double infinity này thấy xài nhiều cho chiều rộng
                      0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
