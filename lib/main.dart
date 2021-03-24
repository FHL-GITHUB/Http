//import 'dart:html';

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:try_http/model/carparkLocation.dart';
import 'package:try_http/services/api_services.dart';
import 'package:try_http/model/carpark.dart';
import 'package:flutter/material.dart';
import 'package:try_http/page/SearchPage.dart';

void main(){
  //loadCarparkList();
  carparkList();
  runApp(SearchApp());
}
