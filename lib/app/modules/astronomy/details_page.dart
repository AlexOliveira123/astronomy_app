import 'package:astronomy_app/app/core/components/background_gradient.dart';
import 'package:astronomy_app/app/modules/astronomy/models/astronomy_model.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final AstronomyModel astronomyModel;

  const DetailsPage({Key key, this.astronomyModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: SingleChildScrollView(
        child: BackgroundGradient(
          width: MediaQuery.of(context).size.width,
          child: Container(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  astronomyModel?.title,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  astronomyModel?.date,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: astronomyModel?.mediaType == "image"
                      ? Image.network(
                          astronomyModel?.url,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          'assets/notfound.png',
                          fit: BoxFit.cover,
                        ),
                ),
                SizedBox(height: 20),
                Text(
                  astronomyModel?.explanation,
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
