import 'package:flutter/material.dart';
import 'package:thuc_tap/model/chung_khoan_model.dart';

import '../services/api_services.dart';

class ListChungKhoanScreen extends StatefulWidget {
  const ListChungKhoanScreen({Key? key}) : super(key: key);

  @override
  State<ListChungKhoanScreen> createState() => _ListChungKhoanScreenState();
}

class _ListChungKhoanScreenState extends State<ListChungKhoanScreen> {

  late final AppApiService _apiService;
  @override
  void initState() {
    _apiService = AppApiService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Chung Khoan Screen"),
      ),
      body: Container(
        margin: EdgeInsets.all(16),

        child:  FutureBuilder<ChungKhoan?>(
        future: _apiService.getChungKhoan('') ,
        builder:((context, snapshot) {
          if(snapshot.hasData){
            ChungKhoan? chungkhoanDatas = snapshot.data;
            if(chungkhoanDatas!=null){
              List<Data> chungKhoan = chungkhoanDatas.datas;

              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        final data = chungKhoan[index];
                        return ListTile(
                          title:  Text('${data.stockId} ${data.fullName}'),
                          leading: Text('${data.exchane}'),
                          subtitle: Text('${data.totalTrading}'),
                        );
                      } ) 
                  )

                ],
              );
            }

          }
          return CircularProgressIndicator();

        })
        
         ),
      ),
    );
  }
}