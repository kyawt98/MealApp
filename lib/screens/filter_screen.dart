import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function _saveFilters;
 final Map<String, bool> _currentFilter;

  FilterScreen(this._currentFilter,this._saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;
  bool _vegan = false;

  @override
  initState(){
    _glutenFree = widget._currentFilter['gluten'];
    _vegetarian = widget._currentFilter['vegetarian'];
    _vegan = widget._currentFilter['vegan'];
    _lactoseFree = widget._currentFilter['lactose'];
    super.initState();
  }


  Widget _buildSwitchTileView(String title, String subTitle, bool currentValue,
      Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        value: currentValue,
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilter = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian
              };
              widget._saveFilters(selectedFilter);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16),
            child: Text(
              'Adjust your meal selection',
              style: Theme
                  .of(context)
                  .textTheme
                  .title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchTileView('Gluten Free',
                    'Only include gluten-free meals', _glutenFree, (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    }),
                _buildSwitchTileView('Lactose Free',
                    'Only include lactose-free meals', _lactoseFree, (
                        newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    }),
                _buildSwitchTileView('Vegetarian',
                    'Only include vegetarian-free meals', _vegetarian, (
                        newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    }),
                _buildSwitchTileView('Vegan',
                    'Only include vegan-free meals', _vegan, (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
