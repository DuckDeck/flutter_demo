import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
class _TitleSection extends StatelessWidget{
  final String title;
  final String subTitle;
  final int starCount;

  _TitleSection(this.title,this.subTitle,this.starCount);

  @override
    Widget build(BuildContext context) {
      return Container(
        padding: EdgeInsets.all(32.0),
        child: Row(
          children: <Widget>[
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(title,style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Text(subTitle,style: TextStyle(color: Colors.grey[500]),)
              ],
            ),),
          Icon(Icons.star,color: Colors.red[500],),
          Text(starCount.toString())
          ],
        ),
      );
    }
}


class InfiniteListView extends StatefulWidget{
  @override
    State<StatefulWidget> createState() => new _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView>{
  static const loadingTag = "##Loading##";
  var _words = <String>[loadingTag];
  ScrollController _controller = new ScrollController();
  var showToTop = false;
  @override
    void initState() {
      _retrieceData();
      _controller.addListener((){
        print(_controller.offset);
        if(_controller.offset < 1000 && showToTop){
          setState(() {
            showToTop = false;
          });
        }
        else if(_controller.offset > 1000 && !showToTop){
          setState(() {
            showToTop = true;
          });
        }
      });
    }

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: ListView.separated(
        itemCount: _words.length,
        controller: _controller,
        itemBuilder: (context,index){
          if(_words[index] == loadingTag){
            if(_words.length -1 < 200){
              _retrieceData();
              return Container(padding: const EdgeInsets.all(16.0), alignment: Alignment.center, child: SizedBox(width: 14.0, height: 24.0,child: CircularProgressIndicator(strokeWidth: 2.0)));
            }
            else{
              return Container(alignment: Alignment.center,padding: EdgeInsets.all(16.0),child: Text("没有更多了",style: TextStyle(color: Colors.grey)));
            }
          }
          return ListTile(title: Text(_words[index]));
        },
       separatorBuilder: (context,index)=>Divider(height: .0,),
     ),
     floatingActionButton: !showToTop ? null : FloatingActionButton(
       child: Icon(Icons.arrow_upward),
       onPressed: (){
         _controller.animateTo(.0,duration: Duration(milliseconds: 200),curve: Curves.ease);
       },
     ),
    );
    }

    void _retrieceData(){
      Future.delayed(Duration(seconds: 2)).then((e){
        _words.insertAll(_words.length, generateWordPairs().take(20).map((e)=>e.asPascalCase).toList());
          setState(() {
              
            });
      });
    }

    @override
      void dispose() {
        // TODO: implement dispose
        _controller.dispose();
        super.dispose();
      }
}
