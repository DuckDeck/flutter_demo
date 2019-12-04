import 'package:search_widget/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:search_widget/widget/no_item_found.dart';
class SearchBarWidget extends StatefulWidget {
  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  List list = <LeaderBoard>[LeaderBoard(name: "Flutter",value: 55),LeaderBoard(name: "Vue",value: 51.44),
  LeaderBoard(name: "React Native",value: 25),
  LeaderBoard(name: "Angular",value: 55.1)];
  LeaderBoard _selectedItem;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: <Widget>[
          SearchWidget<LeaderBoard>(dataList: list,
          hideSearchBoxWhenItemSelected: false,
          listContainerHeight: MediaQuery.of(context).size.height / 4,
          queryBuilder: (query,list){
            return list.where((item)=>
              item.name.toLowerCase().contains(query.toLowerCase())
            ).toList();
          },
          popupListItemBuilder: (item){ return PopupListItemWidget(item);},
          selectedItemBuilder: (selectedItem,deleteSelectedItem){
            return SelectedItemWidget(selectedItem: selectedItem,deleteSelectedItem: deleteSelectedItem,);
          },
          noItemsFoundWidget: NoItemsFound(),
          textFieldBuilder: (controller,focusNode){
            return MyTextField(controller:controller ,focusNode: focusNode,);
           },
           onItemSelected: (item){
             setState(() {
               _selectedItem = item;
             });
           },
          )
          
        ],
      ),
    );
  }
}

class LeaderBoard {
  LeaderBoard({this.name,this.value});
  final String name;
  final double value;
}

class PopupListItemWidget extends StatelessWidget {
  const PopupListItemWidget(this.item);
  final LeaderBoard item;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Text(item.name,style:const TextStyle(fontSize: 16)),
    );
  }
}

class SelectedItemWidget extends StatelessWidget {
  const SelectedItemWidget({this.selectedItem,this.deleteSelectedItem});
  final LeaderBoard selectedItem;
  final VoidCallback deleteSelectedItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

class MyTextField extends StatelessWidget {
  
const MyTextField({this.controller,this.focusNode});

final TextEditingController controller;
final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
    child: TextField(
      controller: controller,
      focusNode: focusNode,
      style: TextStyle(fontSize: 16,color: Colors.grey[600]),
      decoration: InputDecoration(enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Color(0x4437474f))
      ),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor)),
      suffixIcon: Icon(Icons.search),
      border: InputBorder.none,
      hintText:"搜索书籍",
      contentPadding: const EdgeInsets.only(
        left: 16,right: 20,top: 14,bottom: 14
      )
      ),
      
    ),);
  }
}

class NoItemsFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(Icons.folder_open,size: 24,color: Colors.grey[900].withOpacity(0.7),)
      ],
    );
  }
}