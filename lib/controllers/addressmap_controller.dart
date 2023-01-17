import 'package:flutter/material.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

// class DetailScreen extends StatelessWidget {
//   // In the constructor, require a Todo.
//   const DetailScreen(pickedData, {super.key,required PickedData });
//
//   // Declare a field that holds the Todo.
//   // final pickedData todo;
//
//   @override
//   Widget build(BuildContext context) {
//     // Use the Todo to create the UI.
//     String pickedData;
//     // String address;
//
//     // var address;
//     return Scaffold(
//       appBar: AppBar(
//         // title: Text(todo.title),
//       ),
//       body:  Padding(
//         padding: EdgeInsets.all(16.0),
//         // child:
//         //    print(pickedData.address);
//           // print(pickedData.latLong.latitude);
//           // print(pickedData.latLong.longitude);
//
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';

class Addaddressmap extends StatefulWidget {
  // final String address;
  // final int age;
  const Addaddressmap({Key? key}) : super(key: key);
  // const Addaddressmap({required this.address});

  @override
  _add_addressmap createState() => _add_addressmap();
}

class _add_addressmap extends State<Addaddressmap> {
  // bool isAdult = true;

  @override
  Widget build(BuildContext context) {
    final routeData =
    ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    final address = routeData['address'];
    // final newAge = routeData['age'];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'What Goes On That Property??',
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(40.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.deepOrange, width: 5),
              ),
              child: Column(
                children: [
                  Text(
                    address.toString(),
                    style:
                    TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                  // Text(
                  //   newAge.toString(),
                  //   style:
                  //   TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     primary: Colors.indigo,
            //   ),
            //   child: Text('Go Back'),
            //   onPressed: () {
            //     final int newAgeInt = newAge;
            //     newAgeInt >= 18 ? isAdult = true : isAdult = false;
            //     Navigator.pop(context, isAdult);
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}