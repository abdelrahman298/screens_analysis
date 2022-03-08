import 'package:screens_analysis/module/chart/chart_screen.dart';
import 'package:screens_analysis/module/numeric_metrics/numeric_screen.dart';
import 'package:screens_analysis/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:screens_analysis/layout/cubit/home_cubit.dart';
import 'package:screens_analysis/layout/cubit/home_state.dart';
import 'package:screens_analysis/shared/styles/colors.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text(
                //   'your products divided into many types such as ',
                //   style: Theme.of(context).textTheme.bodyText2,
                // ),
                // Text(
                //   'ORDERED, DELIVERED AND RETURNED,',
                //   style: Theme.of(context).textTheme.bodyText1,
                // ),
                // Text(
                //   'somehow you have to control them by obsering their'
                //   ' numbers and curves. ',
                //   style: Theme.of(context).textTheme.bodyText2,
                // ),
                // const SizedBox(height: 10.0),
                const Text('here\'s your data as '),
                const SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    defaultAnotherButton(
                      onPressed: () {
                        navigateTo(context,NumericScreen());
                      },
                      text: 'Number',
                    ),
                    const SizedBox(width: 30.0,),
                    defaultAnotherButton(
                      onPressed: () {
                        navigateTo(context,ChartScreen());
                      },
                      text: 'CURVE',
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

// Widget buildItemCategory()=>MaterialButton(
//   onPressed: (){},
// padding:const EdgeInsets.all(12) ,
//   // color: defaultColor,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(15.0),
//     ),
//   child:Column(
//     // crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       const SizedBox(height: 10),
//       Icon(Icons.list_alt_outlined,
//           color: Colors.blue.withOpacity(0.7)),
//       const SizedBox(height: 25),
//       const Text(
//         'All',
//         style: TextStyle(
//           fontSize: 30,
//           color: Colors.white,
//         ),
//       ),
//       const SizedBox(height: 5),
//       Text(
//         '12 tasks',
//         style: TextStyle(
//           fontSize: 14,
//           color: Colors.white.withOpacity(0.6),
//         ),
//       )
//     ],
//   ),
// );

// crossAxisSpacing: 10,
// mainAxisSpacing: 10,
// crossAxisCount: 2,
