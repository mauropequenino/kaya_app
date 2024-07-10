import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:kaya_app/core/theme/app_pallete.dart';

class PropertyItemViewPage extends StatefulWidget {
  const PropertyItemViewPage({super.key});

  @override
  State<PropertyItemViewPage> createState() => _PropertyItemViewPageState();
}

class _PropertyItemViewPageState extends State<PropertyItemViewPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Imovel',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSlideshow(
              indicatorColor: Colors.blue,
              onPageChanged: (value) {
                debugPrint('Page changed: $value');
              },
              autoPlayInterval: 0,
              isLoop: false,
              children: [
                Image.network(
                  'https://images.unsplash.com/photo-1460408037948-b89a5e837b41?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  height: 400,
                  fit: BoxFit.cover,
                ),
                Image.network(
                  'https://images.unsplash.com/photo-1493809842364-78817add7ffb?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  height: 400,
                  fit: BoxFit.cover,
                ),
                Image.network(
                  'https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?q=80&w=1560&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  height: 400,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Venda de Apartamento T2',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
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
                      ]),
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      Icon(Icons.location_on, color: Pallete.color1, size: 20),
                      SizedBox(width: 5),
                      Text('Maputo - Alto Maé A',
                          style: TextStyle(color: Pallete.subtitleText)),
                    ],
                  ),
                 const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.bathtub,
                              color: Color.fromRGBO(26, 147, 192, 1)),
                          SizedBox(width: 5),
                          Text('1 Casas de Banho',
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.bed,
                              color: Color.fromRGBO(26, 147, 192, 1)),
                          SizedBox(width: 5),
                          Text('2 Quartos',
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      Row(children: [
                        Icon(Icons.square_foot,
                            color: Color.fromRGBO(26, 147, 192, 1)),
                        SizedBox(width: 5),
                        Text('75 m²', style: TextStyle(color: Colors.grey)),
                      ])
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text('Descrição',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin posuere convallis mi vehicula ultrices. In vel dolor nec mauris rhoncus gravida. Praesent porta elit et imperdiet pharetra. In hac habitasse platea dictumst. Curabitur euismod erat nisl, non molestie libero sagittis at. Praesent condimentum, tortor nec convallis scelerisque, neque quam mollis nulla, quis fringilla nulla nisi posuere magna. Aenean tincidunt in purus et tristique. ',
                      style: TextStyle(fontSize: 16, color: Colors.grey)),
                  const SizedBox(height: 20),
                  const Text('Facilidades',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children: [
                      Chip(
                        label: Text('Facilidade 1'),
                        shape: StadiumBorder(
                            side: BorderSide(
                                color:  Color.fromRGBO(26, 147, 192, 1))),
                      ),
                      Chip(
                      label: Text('Facilidade 2'),
                      shape: StadiumBorder(
                          side: BorderSide(
                              color:  Color.fromRGBO(26, 147, 192, 1))),
                    ),

                    Chip(
                      label: Text('Facilidade 3'),
                      shape: StadiumBorder(
                          side: BorderSide(
                              color: Color.fromRGBO(26, 147, 192, 1))),
                    ),
                    Chip(
                      label: Text('Facilidade 4'),
                      shape: StadiumBorder(
                          side: BorderSide(
                              color:  Color.fromRGBO(26, 147, 192, 1))),
                    ),
                    ]
                  ),
                  const SizedBox(height: 20),
                  const Text('Proximidades',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children: [
                      Chip(
                        label: Text('Proximidade 1'),
                        shape: StadiumBorder(
                            side: BorderSide(
                                color:  Color.fromRGBO(26, 147, 192, 1))),
                      ),
                      Chip(
                      label: Text('Proximidade 2'),
                      shape: StadiumBorder(
                          side: BorderSide(
                              color:  Color.fromRGBO(26, 147, 192, 1))),
                    ),

                    Chip(
                      label: Text('Proximidade 3'),
                      shape: StadiumBorder(
                          side: BorderSide(
                              color: Color.fromRGBO(26, 147, 192, 1))),
                    ),
                    Chip(
                      label: Text('Proximidade 4'),
                      shape: StadiumBorder(
                          side: BorderSide(
                              color:  Color.fromRGBO(26, 147, 192, 1))),
                    ),
                    ]
                  ),
                  const SizedBox(height: 20),
                  const Divider(
                      height: 2,
                      thickness: 2,
                      color:  Color.fromARGB(255, 167, 167, 167)),
                  const SizedBox(height: 10),
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: '4.500.000 ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: 'MT',
                            style: TextStyle(
                              color: Colors.grey,
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon:
                                const Icon(Icons.calendar_month, color: Colors.black),
                            label: const Text('Agendar visita',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: Colors.black)),
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                vertical: 15,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              side: const BorderSide(color: Colors.black, width: 2),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.message, color: Colors.white),
                            label: const Text('Mensagem',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16)),
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                vertical: 15,
                              ),
                              backgroundColor:
                                  const Color.fromRGBO(26, 147, 192, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
