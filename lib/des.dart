import 'package:flutter/material.dart';

import 'globel.dart';

class des extends StatefulWidget {
  const des({Key? key}) : super(key: key);

  @override
  State<des> createState() => _desState();
}

class _desState extends State<des> {
  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text("${data['Companyname']}",),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Column(
            children: [
              SizedBox(
                width: 70,
                height: 90,
                child: Image.network("${data['logo']}"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      '${data['Companyname']}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: SizedBox(
                      width: 70,
                      child: Image.network(
                        "${data['ceoimeg']}",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: Text(
                      '${data['name']}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Text(
            "-:Description:-",
            style: TextStyle(fontSize: 20,color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              width: 500,
              height: 150,
              child: Text('${data['description']}',style: const TextStyle(color: Colors.white),),
            ),
          ),
          Text(
            "-:${data['Companyname']} Headquarters:-",
            style: const TextStyle(fontSize: 20,color: Colors.white),

          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              width: 500,
              height: 150,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('2', arguments: data);
                  setState(() {
                    Globel.val = '${data['web']}';
                  });
                },
                child: Text(
                  '${data['web']}',
                  style: const TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white12,
    );
  }
}
