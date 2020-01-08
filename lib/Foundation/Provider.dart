import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ProviderPage extends StatefulWidget {
  @override
  _ProviderPageState createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(builder: (_)=>ProviderModel(),)],
      child: Scaffold(
        appBar: AppBar(title: LayoutBuilder(
          builder: (BuildContext context,BoxConstraints constraints){
            var counter = Provider.of<ProviderModel>(context);
            return Text("Provider ${counter.count.toString()}");
          },
        ),),
        body: CountWidget(),
      ),
    );
  }
}


class CountWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderModel>(builder: (context,counter,_){
        return Column(
          children: <Widget>[
            Expanded(child: Center(child: Text(counter.count.toString()),),),
            Center(child: FlatButton(
              child: Text("+"),
              color: Colors.blue,
              onPressed: (){
                counter.add();
              },
            ),)
          ],
        );
    });
  }
}

class ProviderModel extends ChangeNotifier {
  int _count = 0;
  int get count => _count;
  void add(){
    _count++;
    notifyListeners();
  }
}