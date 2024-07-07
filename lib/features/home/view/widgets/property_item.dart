import 'package:flutter/material.dart';
import 'package:kaya_app/core/theme/app_pallete.dart';

class PropertyItem extends StatelessWidget {
  final VoidCallback onTap;
  const PropertyItem({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://images.unsplash.com/photo-1605125354450-9bc69f892817?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTg0fHxidWlsZGluZ3xlbnwwfHwwfHx8MA%3D%3D',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Venda de Apartamento T2',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.business_outlined,
                            color: Pallete.color1, size: 20),
                        SizedBox(width: 5),
                        Text('Apartamento',
                            style: TextStyle(color: Pallete.subtitleText)),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.location_on,
                            color: Pallete.color1, size: 20),
                        SizedBox(width: 5),
                        Text('Maputo - Alto Maé A',
                            style: TextStyle(color: Pallete.subtitleText)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.shopping_bag,
                                color: Pallete.color1, size: 20),
                            SizedBox(width: 5),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                      text: '4.500.000 ',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: 'MT',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.bathtub,
                                    color: Pallete.color1, size: 20),
                                SizedBox(width: 1),
                                Text('1', style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                            SizedBox(width: 10),
                            Row(
                              children: [
                                Icon(Icons.bed,
                                    color: Pallete.color1, size: 20),
                                SizedBox(width: 3),
                                Text('2', style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                            SizedBox(width: 10),
                            Row(children: [
                              Icon(Icons.crop_free,
                                  color: Pallete.color1, size: 20),
                              SizedBox(width: 3),
                              Text('75m²',
                                  style: TextStyle(color: Colors.grey)),
                            ])
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
