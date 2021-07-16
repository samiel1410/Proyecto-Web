import 'package:flutter/material.dart';
import 'package:pagosapp_group/src/models/person_model.dart';
import 'package:pagosapp_group/src/utils/standard_widgets.dart';
import 'package:pagosapp_group/src/widgets/content/person_detail_widget.dart';

class PersonPage extends StatefulWidget {
  PersonPage({Key? key, required this.person}) : super(key: key);

  final Person person;
  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Standard.appBar(context, widget.person.name),
        body: CustomScrollView(
          slivers: [
            _appBar(),
            SliverFillRemaining(
                child: PersonDetailWidget(person: widget.person))
          ],
        ));
  }

  _appBar() {
    return SliverAppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).canvasColor,
        expandedHeight: 250.0,
        flexibleSpace: FlexibleSpaceBar(
            background: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Standard.getBackground(context),
            Container(
              child: Column(children: [
                SizedBox(height: 35.0),
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      color: Theme.of(context).canvasColor),
                  child: ClipOval(
                      child: widget.person.photo == null
                          ? Image.asset("assets/images/icono_user.png")
                          : FadeInImage(
                              placeholder:
                                  AssetImage('assets/images/icono_user.png'),
                              image: NetworkImage(
                                  widget.person.photo.toString()))),
                ),
                Standard.TitleToForm(context, widget.person.name),
                Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                    child: Text((widget.person.biography),
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontWeight: FontWeight.bold)))
              ]),
            ),
          ],
        )));
  }
}
