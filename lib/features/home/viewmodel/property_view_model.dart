import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kaya_app/features/property/models/property_model.dart';

class PropertyViewModel extends ChangeNotifier {
  List<PropertyModel> _properties = [];
  String _province = 'Todas';
  String _type = 'Todos';
  int _minPrice = 0;
  int _maxPrice = 10000000;


  String get province => _province;
  String get type => _type;
  int get minPrice => _minPrice;
  int get maxPrice => _maxPrice;
  List<PropertyModel> get properties => _properties;
  
  Future<void> fetchProperties() async {
    final response =
        await http.get(Uri.parse('http://localhost:3000/properties'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      _properties = data.map((json) => PropertyModel.fromJson(json)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load properties');
    }
  }

  List<PropertyModel> get filteredProperties => _properties.where((property) {
        final matchesProvince =
            province == 'Todas' || property.province == province;
        final matchesType = _type == 'Todos' || property.type == _type;
        final matchesPrice = property.price >= _minPrice &&
            property.price <= _maxPrice;
        return matchesProvince && matchesType && matchesPrice;
      }).toList();

  void setFilters(String province, String type, int minPrice, int maxPrice) {
    _province = province;
    _type = type;
    _minPrice = minPrice;
    _maxPrice = maxPrice;
    notifyListeners();
  }
}
