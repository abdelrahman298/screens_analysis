import 'package:screens_analysis/layout/cubit/home_state.dart';
import 'package:screens_analysis/model/chart_model.dart';
import 'package:screens_analysis/model/product_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  ProductModel? productModel;
  List data = [];
  List orderedData = [];
  List deliveredData = [];
  List returnedData = [];
  int ordered = 0;
  int delivered = 0;
  int returned = 0;
  List<ChartModel> chartData = [];

  Future<List?> getProductData() async {
    var jsonText = await rootBundle.loadString('assets/api/orders.json');
    data = json.decode(jsonText);
    getTotalCount();
    getNumberOfEveryStatus();
    getTimeOfProduct();
    data.forEach((element) {
      productModel = ProductModel.fromJson(element);
      emit(AnalysisGetProductDataSuccess());
    });
  }

  getTotalCount() {
    ordered = data.where((e) => e['status'] == 'ORDERED').length;
    delivered = data.where((e) => e['status'] == 'DELIVERED').length;
    returned = data.where((e) => e['status'] == 'RETURNED').length;
    emit(AnalysisGetTotalCountSuccess());
  }

  // هحاول اجيب عدد المنتجات اللى نوعها مثلاً
  // Delivered
  //و هضيفهم فى list لوحدهم
  void getNumberOfEveryStatus() {
    orderedData.addAll(data.where((e) => e['status'] == 'ORDERED'));
    deliveredData.addAll(data.where((e) => e['status'] == 'DELIVERED'));
    returnedData.addAll(data.where((e) => e['status'] == 'RETURNED'));
    emit(AnalysisGetNumberOfEveryStatusSuccess());
  }

  //  اجيب متوسط الأسعار
  int getAveragePriceForEachStatus(List<dynamic> list) {
    List<dynamic> priceStringList = [];
    double avgPrice = 0.0;
    double totalPrice = 0;
    double totalSumPrice = 0;
    for (int i = 0; i < list.length; i++) {
      String priceString = list[i]['price'].substring(1);
      String regex =
          r'[^\p{Alphabetic}\p{Mark}\p{Decimal_Number}\p{Connector_Punctuation}\p{Join_Control}\s]+';
      priceString = priceString.replaceAll(RegExp(regex, unicode: true), '');
      totalPrice = double.parse(priceString);
      priceStringList.add(totalPrice);
    }
    totalSumPrice = priceStringList.reduce((sum, element) {
      return sum + element;
    });
    avgPrice = totalSumPrice / list.length;
    // emit(TodeoyGetAveragePriceForEachStatusSuccess());
    return avgPrice.round();
  }


  getTimeOfProduct() {
    List<dynamic> timeStringList1 = [];
    double dateNo1 = 0;
    double dateNo2 = 0;
    double dateNo3 = 0;
    double dateNo4 = 0;

    String? formattedTime;
    DateTime? dateTime;
    String? timeString;
    for (int i = 0; i < data.length; i++) {
      dateTime = DateTime.parse(data[i]['registered']);
      formattedTime = DateFormat('MM').format(dateTime);
      timeStringList1.add(formattedTime);

      if (formattedTime == '01' ||
          formattedTime == '02' ||
          formattedTime == '03') {
        dateNo1++;
      } else {
        if (formattedTime == '04' ||
            formattedTime == '05' ||
            formattedTime == '06') {
          dateNo2++;
        } else {
          if (formattedTime == '07' ||
              formattedTime == '08' ||
              formattedTime == '09') {
            dateNo3++;
          } else {
            if (formattedTime == '10' ||
                formattedTime == '11' ||
                formattedTime == '12') {
              dateNo4++;
            }
          }
        }
      }
    }
    print(dateNo1);
    print(dateNo2);
    print(dateNo3);
    print(dateNo4);
    chartData = [
      ChartModel(date: 01, noOfOrders: 0),
      ChartModel(date: 01, noOfOrders: dateNo1),
      ChartModel(date: 03, noOfOrders: dateNo2),
      ChartModel(date: 06, noOfOrders: dateNo3),
      ChartModel(date: 09, noOfOrders: dateNo4),
    ];
  }
}

// [05-15, 04-11, 07-02, 10-06, 08-05, 03-26, 10-31, 08-13, 07-08, 01-10, 02-04,
// 04-26, 01-03, 02-22, 08-18, 09-19, 08-05, 03-26, 01-07, 01-05, 10-09, 08-22,
// 04-07, 01-01, 08-24, 07-31, 05-19, 09-07, 05-10, 06-27, 04-19, 09-15, 04-30,
// 09-03, 09-08, 04-04, 07-01, 04-13, 01-13, 09-14, 06-21, 04-09, 06-29, 03-25,
// 05-18, 10-21, 01-03, 02-08, 07-27, 01-02, 10-15, 04-06, 04-01, 06-14, 07-26,
// 02-21, 03-04, 01-31, 05-22, 10-19, 10-13, 07-15, 02-25, 07-12, 07-14, 03-02,
// 10-03, 01-15, 02-27, 03-18, 07-10, 09-29, 07-05, 04-26, 10-20, 09-08, 10-23,
// 06-18, 09-28, 03-11, 05-21, 02-15, 06-19, 08-02, 09-18, 05-21, 10-17, 01-26,
// 08-16, 04-11, 02-12, 05-04, 02-08, 06-03, 08-06, 06-19, 04-29, 09-09, 07-10, 02-26]
