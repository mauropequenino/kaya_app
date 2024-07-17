import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kaya_app/features/property/models/property_model.dart';

class PropertyViewModel extends ChangeNotifier {
  List<PropertyModel> _properties = [];
  String _province = 'Todas';
  String _type = 'Todos';
  RangeValues _priceRange = const RangeValues(0, 1000000000);

  String get province => _province;
  String get type => _type;
  RangeValues get priceRange => _priceRange;
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
        final matchesPrice = property.price >= _priceRange.start &&
            property.price <= _priceRange.end;
        return matchesProvince && matchesType && matchesPrice;
      }).toList();

  void setFilters(String province, String type, RangeValues priceRange) {
    province = province;
    _type = type;
    _priceRange = priceRange;
    notifyListeners();
  }
}
