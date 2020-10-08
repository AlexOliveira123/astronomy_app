import 'package:astronomy_app/app/core/components/background_gradient.dart';
import 'package:astronomy_app/app/modules/astronomy/details_page.dart';
import 'package:astronomy_app/app/modules/astronomy/models/astronomy_model.dart';
import 'package:flutter/material.dart';

class AstronomyItem extends StatelessWidget {
  final AstronomyModel astronomyModel;
  const AstronomyItem({Key key, this.astronomyModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => DetailsPage(astronomyModel: astronomyModel),
          ),
        );
      },
      child: Card(
        elevation: 4,
        shadowColor: Colors.grey[100],
        child: BackgroundGradient(
          child: Container(
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: astronomyModel.mediaType == "image"
                    ? NetworkImage(
                        astronomyModel.url,
                      )
                    : AssetImage('assets/notfound.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      astronomyModel?.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                      ),
                    ),
                  ),
                  Text(
                    astronomyModel?.date,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
