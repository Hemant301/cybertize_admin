// import 'dart:convert';


// class HomeRepo {
//   HomeApi homeApi = HomeApi();
//   Future<GuestReqListModal> fetchGuestReqListModal() async {
//     final response = await homeApi.fetchHomeSlider();
//     var jsonResponse = jsonDecode(response.body) as Map;
//     return GuestReqListModal(jsonResponse);
//   }

//   Future<GuestDetailModal> fetchGuestDetails(id) async {
//     final response = await homeApi.fetchGuestDetails(id);
//     var jsonResponse = jsonDecode(response.body) as List;
//     return GuestDetailModal(jsonResponse);
//   }
// }
