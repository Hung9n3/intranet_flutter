import 'package:flutter/material.dart';
import 'package:petaverse/Model/User/user.dart';
import 'package:petaverse/Model/generic_model.dart';
import 'package:petaverse/api/Controller/pet_repo.dart';
import '../Status/user_status.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class SampleComponent {
  static List<String> getObjectKey(dynamic a) {
    List<String> labels = [];
    a.forEach((key, value) {
      labels.add(key);
    });
    return labels;
  }

  static Future<List<Generic>> getSuggestion(String query) {
    return PetRepo.getPetSuggestion(query);
  }

  static Widget tableComponent(List a) {
    List labels = getObjectKey(a[0]);
    return DataTable(
        columns: labels.map((e) => DataColumn(label: Text(e))).toList(),
        rows: a
            .map((e) => DataRow(
                cells:
                    labels.map((label) => DataCell(Text(e[label]))).toList()))
            .toList());
  }

  static Widget getButton(String name, IconData icon, Function() function) {
    return MaterialButton(
      onPressed: function,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(icon), const SizedBox(width: 10.0), Text(name)],
      ),
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
    );
  }

  static Widget cardComponent(Status a) {
    return Card(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    minRadius: 20.0,
                    backgroundImage: NetworkImage(
                        "https://drive.google.com/file/d/1mFe3919PjlvmNHwzlCm01lCZncqYcgiP/view?usp=sharing"),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(a.author.name,
                              style: const TextStyle(fontSize: 20.0)),
                          Text(a.postingTime)
                        ]),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    splashRadius: 0.5,
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {},
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
                ],
              )
            ],
          ),
        ),
        Text(a.content),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Icon(Icons.thumb_up),
                ),
                Text('369')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Text('6 Comments'),
                ),
                Text('2 Share')
              ],
            )
          ]),
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            getButton('Like', Icons.thumb_up, () {}),
            getButton('Comment', Icons.comment, () {}),
            getButton('Share', Icons.share, () {})
          ],
        )
      ]),
    );
  }

  static Widget searchField<T>(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    return StatefulBuilder(
      builder: (BuildContext context, setState) {
        return TypeAheadField(
          hideSuggestionsOnKeyboardHide: false,
          textFieldConfiguration: TextFieldConfiguration(
            controller: _controller,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
              hintText: 'Search Username',
            ),
          ),
          suggestionsCallback: getSuggestion,
          itemBuilder: (context, Generic? suggestion) {
            final data = suggestion!;

            return ListTile(
              title: Text(data.name.toString()),
            );
          },
          noItemsFoundBuilder: (context) => const SizedBox(
            height: 100,
            child: Center(
              child: Text(
                'No Users Found.',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          onSuggestionSelected: (Generic? suggestion) {
            final data = suggestion!;
            _controller.text = data.name;
            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text('Selected user: ${data.name}'),
              ));
          },
        );
      },
    );
  }

  static Widget searchResultCard(dynamic a, User user) {
    Function() function;
    String buttonName = 'follow';
    for (int id in user.followerId!) {
      a['id'] == id ? buttonName = 'unfollow' : buttonName = 'follow';
    }
    buttonName == 'follow' ? function = () {} : function = () {};
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  minRadius: 20.0,
                  backgroundImage: NetworkImage(a['imageUrl']),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: Text(a['name'])),
                getButton(buttonName, Icons.person_add_alt, function)
              ],
            ),
          ],
        ),
      ),
    );
  }

  static void dynamicDialog(Widget content, BuildContext context,
      Function() function, String route, String title) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(actions: [
            TextButton(
              child: const Text('save'),
              onPressed: function,
            ),
            TextButton(
                child: const Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                  // reload(context, route);
                })
          ], title: Text(title), content: content);
        });
  }

  static void reload(BuildContext context, String route) {
    Navigator.popAndPushNamed(context, route);
  }
}
