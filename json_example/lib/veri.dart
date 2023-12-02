import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:json_example/model/user-model.dart';

class VeriPage extends StatefulWidget {
  const VeriPage({super.key});

  @override
  State<VeriPage> createState() => _VeriPageState();
}

class _VeriPageState extends State<VeriPage> {
  Future<List<UserModel>>  _getUserList() async{
    try {
      var response= await Dio().get('https://jsonplaceholder.typicode.com/photos');
      List<UserModel> _userlist=[];
      if (response.statusCode==200) {
        _userlist =(response.data as List).map((e) => UserModel.fromMap(e)).toList();
      }
      return _userlist;
    }on DioException catch (e) {
      return Future.error(e);
    }
    
  }

  late final Future<List<UserModel>> _userList;
  @override
  void initState() {
    
    super.initState();
    _userList=_getUserList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Veri Sayfasina Hoşgeldiniz'), 
        ),
        body: Center(
          child: FutureBuilder<List<UserModel>>(future: _userList, builder: (context,snapshot){
          if (snapshot.hasData) {
            var userList=snapshot.data!;
            return ListView.builder(itemCount: userList.length,itemBuilder: (context,index){
              
              var user=userList[index];
              return ListTile(
                title: Text(user.title),
                subtitle: Text(user.thumbnailUrl.toString()),
                leading: CircleAvatar(
                  radius: 40.0,
                  backgroundImage: NetworkImage(user.url)),  
              );
              
            }
            
            );
          }else if(snapshot.hasError){
            return Text(snapshot.error.toString());
          }else{
            return CircularProgressIndicator();
          }
          }),
        ),
    );
  }
}