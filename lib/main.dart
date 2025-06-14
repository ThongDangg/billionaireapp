import 'package:billonaireapp/add_money_button.dart';
import 'package:billonaireapp/balance_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // muon import j do le thi ctrl .

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double balance = 500;
  void addMoney() async {
    setState(() {
      // sử dụng để thay đổi trạng thái
      balance += 500;
    });
    final SharedPreferences prefs =
        await SharedPreferences.getInstance(); // khúc này còn sai vì nếu dùng await thì hàm phải có async

    // Save an double value to 'decimal' key.
    await prefs.setDouble('balance', balance);
  }

  // này xài để lưu dữ liệu sau khi thay đổi luôn
  @override
  void initState() {
    super.initState();
    loadBalance();
  }

  // Obtain shared preferences.
  void loadBalance() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Save an double value to 'decimal' key.
    setState(() {
      balance =
          prefs.getDouble('balance') ??
          0; //giá trị ban đầu là null mà double không chấp nhận null nên phải thêm fallback value bằng ? //nếu get value thì ko cần await
    });
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
              BalanceView(balance: balance),
              AddMoneyButton(
                addMoneyFunction: addMoney,
              ), //để sử dụng function của thg con thì phải cho thg con kế thừa r gọi ra
            ],
          ),
        ),
      ),
    );
  }
}
