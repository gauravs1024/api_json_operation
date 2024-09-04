import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:api_json_operation/models/test_get_model.dart';
import 'package:http/http.dart' as http;
class homescreen extends StatefulWidget
{
  const homescreen({Key? key}) : super(key:key);
  @override
  _homescreenState createState()=>_homescreenState();
}

class _homescreenState extends State<homescreen>{
  List<TestGetModel> getlist=[];
  int count=0;
  Future<List<TestGetModel>>test_get_api ()async{
    final response =await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
      getlist.clear();
      for(Map i in data){
        getlist.add(TestGetModel.fromJson(i));

      }
      return getlist;
    }
    else{
      return getlist;
    }

  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title:Text("Api Fetching"),
        ),
        body: Column(
          children: [
            Expanded(child:
            FutureBuilder(
              future:test_get_api() , builder:(context,snapshot){
              if(!snapshot.hasData){
                return Text('Loading');
              }
              else{
                return ListView.builder(

                    itemCount: getlist.length,
                    itemBuilder: (context,index){
                      count=index;
                      return  Card(
                          child:Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text(' ${++count }   title', style:TextStyle(fontSize: 15,fontWeight :FontWeight.bold)),
                                Text(getlist[index].title.toString()),
                                Text('Description', style:TextStyle(fontSize: 15,fontWeight :FontWeight.bold)),

                                Text(getlist[index].title.toString()),

                              ],
                            ),
                          )
                      );
                    });

              }

            },
            )
            )
          ],

        )
    );
  }
}