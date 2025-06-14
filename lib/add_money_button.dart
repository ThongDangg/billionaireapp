import 'package:flutter/material.dart';

class AddMoneyButton extends StatelessWidget {


void Function() addMoneyFunction;


  AddMoneyButton({super.key, required this.addMoneyFunction}); //required cái thg addmoneyfunction này là xài tính kế thừa

  @override
  Widget build(BuildContext context) {
    return Expanded(
                flex: 1,
                child: ElevatedButton(
                  //có 3 loại button elevated,text,outlined,
                  onPressed: addMoneyFunction,
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
              );
  }
}