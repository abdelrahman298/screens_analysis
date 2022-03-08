import 'package:screens_analysis/layout/cubit/home_cubit.dart';
import 'package:screens_analysis/layout/cubit/home_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumericScreen extends StatefulWidget {
  const NumericScreen({Key? key}) : super(key: key);

  @override
  State<NumericScreen> createState() => NumericScreenState();
}

class NumericScreenState extends State<NumericScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              HomeCubit.get(context).getTimeOfProduct();
            },
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Table(
                border: TableBorder.all(width: 3, color: Colors.black45),
                //table border
                columnWidths: const <int, TableColumnWidth>{
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(),
                  2: FlexColumnWidth(),
                  3: FlexColumnWidth(1.5),
                },
                //الكلام هيكون فين فى ال cell
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: <TableRow>[
                  TableRow(
                    children: <Widget>[
                      Container(),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            'TOTAL COUNT',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            'AVERAGE PRICE',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: <Widget>[
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            'ORDERED',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            '${HomeCubit.get(context).ordered}',
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            '${HomeCubit.get(context).getAveragePriceForEachStatus(HomeCubit.get(context).orderedData)}',
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: <Widget>[
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            'DELIVERED',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            '${HomeCubit.get(context).delivered}',
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            '${HomeCubit.get(context).getAveragePriceForEachStatus(HomeCubit.get(context).deliveredData)}',
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: <Widget>[
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            'RETURNED',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            '${HomeCubit.get(context).returned}',
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            '${HomeCubit.get(context).getAveragePriceForEachStatus(HomeCubit.get(context).returnedData)}',
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// Table(
// border: TableBorder.all(width:1, color:Colors.black45), //table border
// children: [
//
// TableRow(
// children: [
// TableCell(child: Text("S/N")),
// TableCell(child: Text("Name")),
// TableCell(child: Text("Address")),
// TableCell(child: Text("Nation"))
// ]
// ),
//
// TableRow(
// children: [
// TableCell(child: Text("1.")),
// TableCell(child: Text("Krishna Karki")),
// TableCell(child: Text("Nepal, Kathmandu")),
// TableCell(child: Text("Nepal"))
// ]
// ),
//
// TableRow(
// children: [
// TableCell(child: Text("2.")),
// TableCell(child: Text("John Wick")),
// TableCell(child: Text("New York, USA")),
// TableCell(child: Text("USA"))
// ]
// ),
//
// TableRow(
// children: [
// TableCell(child: Text("3.")),
// TableCell(child: Text("Fedrick May")),
// TableCell(child: Text("Berlin, Germany")),
// TableCell(child: Text("Germany"))
// ]
// ),
//
// ],)
