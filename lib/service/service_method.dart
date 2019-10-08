import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import '../config/service_url.dart';

//通用的网络请求方法的封装
Future request(url,{formData}) async{
  try {
    Response response;
    Dio dio = Dio();
    dio.options.contentType =
        ContentType.parse('application/x-www-form-urlencoded');
    if(formData == null){
      response = await dio.post(servicePath[url]);
    }else{
      response = await dio.post(servicePath[url],data: formData);
    }
    if(response.statusCode == 200){

      return response.data;
    }else{
      throw Exception('接口异常');
    }
  }catch(e){
    print('接口报错---${url}---${e}');
  }
}

//请求首页接口数据 真实抓包 因为上面的👆的接口完犊子了!
Future ldRequest(url,{formData22}) async{
  try {
    Response response;
    Dio dio = Dio();
    dio.options.contentType =
        ContentType.parse('application/x-www-form-urlencoded');
    String mainUrl = 'http://baixingliangfan.cn/baixing/bxAppIndex/';
    String url = mainUrl + formData22;
    if(formData22 == null){
      response = await dio.post(servicePath[url]);
    }else{
      response = await dio.get(url);
    }
    if(response.statusCode == 200){

      return response.data;
    }else{
      throw Exception('接口异常');
    }
  }catch(e){
    print('接口报错---${url}---${e}');
  }
}
//火爆专区
