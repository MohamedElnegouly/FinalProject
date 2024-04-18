import 'dart:convert';

import 'package:http/http.dart' as http;
//
// class Api {
//   Future<dynamic> get ({required String url}) async {
//     http.Response response = await http.get(Uri.parse(url),
//     headers:
//     {
//       'Authorization' : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZjM5YWNmYjMzM2Q0OTk3ZjVhZTVlNiIsImlhdCI6MTcxMzM1Mjc2NCwiZXhwIjoxNzEzOTU3NTY0fQ.Tr0Xesmnr3vnsC8UI45LNFPAxfnrL8NQm-9CLg2-w74',
//     },
//     );
//
//     if (response.statusCode==200){
//       return jsonDecode(response.body);
//     }
//     else{
//       throw Exception('there is a problem with status code ${response.statusCode}');
//     }
//
//   }
// }