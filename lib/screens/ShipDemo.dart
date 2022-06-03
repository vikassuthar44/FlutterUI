import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {


  late GlobalKey<ScaffoldState> _key;
  late bool _isSelected;
  late List<CompanyWidget> _companies;
  late List<String> _filters;
  late List<String> _choices;
  late int _choiceIndex;

  @override
  void initState() {
    super.initState();
    _key = GlobalKey<ScaffoldState>();
    _isSelected = false;
    _choiceIndex = 0;
    _filters = <String>[];
    _companies = <CompanyWidget>[
      CompanyWidget('CEO'),
      CompanyWidget('Director'),
      CompanyWidget('Manager'),
      CompanyWidget('Team Leader'),
      CompanyWidget('Employee'),
    ];
    _choices = ["Software Engineer","Software Developer",
      "Software Testing"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text("Chip Widget In Flutter"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            chipList(),
            _buildActionChips(),
            _buildInputChips(),
            Wrap(
              children: companyPosition.toList(),
            ),
            _buildChoiceChips(),

          ],
        ),
      ),
    );
  }



  chipList() {
    return Wrap(
      spacing: 6.0,
      runSpacing: 6.0,
      children: <Widget>[
        _buildChip('Gamer', Color(0xFFff6666)),
        _buildChip('Hacker', Color(0xFF007f5c)),
        _buildChip('Developer', Color(0xFF5f65d3)),
        _buildChip('Racer', Color(0xFF19ca21)),
        _buildChip('Traveller', Color(0xFF60230b)),
      ],
    );
  }


  Widget _buildChoiceChips() {
    return Container(
      height: MediaQuery.of(context).size.height/4,
      child: ListView.builder(
        itemCount: _choices.length,
        itemBuilder: (BuildContext context, int index) {
          return ChoiceChip(
            label: Text(_choices[index]),
            selected: _choiceIndex == index,
            selectedColor: Colors.red,
            onSelected: (bool selected) {
              setState(() {
                _choiceIndex = selected ? index : 0;
              });
            },
            backgroundColor: Colors.green,
            labelStyle: TextStyle(color: Colors.white),
          );
        },
      ),
    );
  }

  Widget _buildInputChips() {
    return InputChip(
      padding: EdgeInsets.all(2.0),
      avatar: CircleAvatar(
        backgroundColor: Colors.pink.shade600,
        child: Text('FD'),
      ),
      label: Text('Flutter Devs',style: TextStyle(color:
      _isSelected?Colors.white:Colors.black),
      ),
      selected: _isSelected,
      selectedColor: Colors.blue.shade600,
      onSelected: (bool selected) {
        setState(() {
          _isSelected = selected;
        });
      },
      onDeleted: () {
      },
    );
  }

  Widget _buildActionChips() {
    return ActionChip(
      elevation: 8.0,
      padding: EdgeInsets.all(2.0),
      avatar: CircleAvatar(
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.mode_comment,color: Colors.white,size: 20,),
      ),
      label: Text('Message'),
      onPressed: () {
        _key.currentState?.showSnackBar(SnackBar(
          content: Text('Message...'),
        ));
      },
      backgroundColor: Colors.grey[200],
      shape: StadiumBorder(
          side: BorderSide(
            width: 1,
            color: Colors.redAccent,
          )),
    );
  }

  Iterable<Widget> get companyPosition sync* {
    for (CompanyWidget company in _companies) {
      yield Padding(
        padding: const EdgeInsets.all(6.0),
        child: FilterChip(
          backgroundColor: Colors.tealAccent[200],
          avatar: CircleAvatar(
            backgroundColor: Colors.cyan,
            child: Text(company.name[0].toUpperCase(),style: TextStyle(color: Colors.white),),
          ),
          label: Text(company.name,),
          selected: _filters.contains(company.name),
          selectedColor: Colors.purpleAccent,
          onSelected: (bool selected) {
            setState(() {
              if (selected) {
                _filters.add(company.name);
              } else {
                _filters.removeWhere((String name) {
                  return name == company.name;
                });
              }
            });
          },
        ),
      );
    }
  }

  Widget _buildChip(String label, Color color) {
    return Chip(
      labelPadding: EdgeInsets.all(2.0),
      avatar: CircleAvatar(
        backgroundColor: Colors.white70,
        child: Text(label[0].toUpperCase()),
      ),
      label: Text(
        label,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: color,
      elevation: 6.0,
      shadowColor: Colors.grey[60],
      padding: EdgeInsets.all(8.0),
    );
  }

}

class CompanyWidget {
  const CompanyWidget(this.name);
  final String name;
}