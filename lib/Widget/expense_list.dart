import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class ExpenseList extends StatelessWidget {
  final List<Transaction> transaction;

  ExpenseList(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 550,
        child: transaction.isEmpty
            ? Column(children: [
                Text('NO TRANSACTIONS!',
                    style: Theme.of(context).textTheme.title),
                    SizedBox(height: 50,),
                    Container(
                      height: 450,
                      child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover)),
              ])
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          )),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Rs ${transaction[index].amount.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              transaction[index].title,
                              style: Theme.of(context).textTheme.title,
                            ),
                            Text(
                              DateFormat.yMMMMEEEEd()
                                  .format(transaction[index].date),
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
                itemCount: transaction.length,
              ));
  }
}
