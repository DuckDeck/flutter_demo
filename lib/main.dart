import 'package:flutter/material.dart';
import 'RandomWordsState.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      title: 'Welcome to flutter',
      theme: new ThemeData(primaryColor: Colors.purple),
      home: new ShoppingList( products: <Product>[
        new Product(name: "Eggs"),new Product(name: "Flour"),new Product(name: "Chocolate chips")
      ],),
      
    );
  }
}

class TutorialHome extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Scaffold(
        appBar: new AppBar(
          leading: new IconButton(icon: new Icon(Icons.menu),tooltip: 'Navigation menu',onPressed: null,),
          title: new Text('Example title'),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.search),tooltip: "Search",onPressed: null,),
          ],
        ),
        body: new Center(
          child: new Counter(),
        ),
        floatingActionButton: new FloatingActionButton(
          tooltip: 'Add',
          child: new Icon(Icons.add),
          onPressed: null,
        ),
      );
    }
}


class MyButton extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new GestureDetector(
        onTap: (){
          print("MyButton was tapped!");
        },
        child: new Container(
          height: 36.0,
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: new BoxDecoration(borderRadius: new BorderRadius.circular(5.0),color: Colors.lightGreen[500]),
          child: new Center(
            child: new Text("Engage"),
          ),
        ),
      );
    }
}

class Counter extends StatefulWidget{
  @override
    _CounterSate createState() => new _CounterSate();
}

class _CounterSate extends State<Counter>{
  int _counter = 0;
  void _increment(){
    setState(() {
          _counter++;
        });
  }

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Row(
        children: <Widget>[
          new CounterIncrementor(onPressed: _increment),
          new CounterDisplay(count: _counter,)
        ],
        
      );
    }
}

class CounterDisplay extends StatelessWidget{
  CounterDisplay({this.count});
  final int count;
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Text('Count: $count');
    }
}

class CounterIncrementor extends StatelessWidget{
  CounterIncrementor({this.onPressed});
  final VoidCallback onPressed;
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new RaisedButton(
        onPressed:onPressed,
        child:new Text('Increment')
      );
    }
}


class Product{
  const Product({this.name});
  final String name;
}

typedef void CartChangedCallBack(Product product,bool inCart);
class ShoppingListItem extends StatelessWidget{
  ShoppingListItem({Product product,this.inCart,this.onCartChanged})
  :product = product,super(key:new ObjectKey(product));
  final Product product;
  final bool inCart;
  final CartChangedCallBack onCartChanged;
  @override
    Widget build(BuildContext context) {
      return new ListTile(
        onTap: (){
          onCartChanged(product,!inCart);
        },
        leading: new CircleAvatar(
          backgroundColor: _getColor(context),
          child: new Text(product.name[0]),
        ),
        title: new Text(product.name,style:_getTextStyle(context)),
      );
    }
   Color _getColor(BuildContext context){
     return inCart ? Colors.black54 : Theme.of(context).primaryColor;
   } 
   TextStyle _getTextStyle(BuildContext context){
     if (!inCart) {
       return null;
     }
     return new TextStyle(
       color: Colors.black54,
       decoration: TextDecoration.lineThrough
     );
   }
}

class ShoppingList extends StatefulWidget{
  ShoppingList({Key key,this.products}):super(key:key);
  final List<Product> products;
  @override
    _ShoppingListState createState()  => new _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList>{
  Set<Product> _shoppingCart = new Set<Product>();
  void _handleCartChanged(Product product,bool inCart){
    setState(() {
      if(inCart)
        _shoppingCart.add(product);
        else
        _shoppingCart.remove(product);
    });
  }

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Scaffold(
        appBar: new AppBar(title:  new Text('Shopping List'),),
        body: new ListView(
          padding: new EdgeInsets.symmetric(vertical: 8.0),
          children: widget.products.map((Product product){
            return new ShoppingListItem(
              product: product, inCart: _shoppingCart.contains(product),onCartChanged: _handleCartChanged,
            );
          }).toList()
        ),
      );
    }
}
