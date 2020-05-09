import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thegorgeousotp/stores/login_store.dart';
import 'package:thegorgeousotp/theme.dart';
import 'package:thegorgeousotp/widgets/sidebar.dart';

  List<String> serviceImage = [
    'assets/img/buy.jpeg',
    'assets/img/wheather.jpeg',
    'assets/img/images.jpeg',
    'assets/img/news.jpeg',
    'assets/img/calender.png',
    'assets/img/setting.jpeg'
];



  List<String> serviceLabel = [
   'Buy Stocks',
   'Weather Report',
   'Videos',
   'News',
   'Crop Calender',
   'Setting'
];



class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Widget cardsWidget(itemIndex) => Container(
     
     margin: const EdgeInsets.all(30)
    ,
     decoration: const BoxDecoration(
       
       borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    color: Colors.white,
     ),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.center,
       mainAxisAlignment: MainAxisAlignment.spaceAround,
       children: <Widget>[
         Align(
           alignment: Alignment.center,
           
           child: CircleAvatar(
            backgroundImage: AssetImage(serviceImage[itemIndex]),
            radius: 30,
          ),
         ),
         Container(
           //margin: const EdgeInsets.all(8),
           /*
           if(itemIndex == 0){
             alignment: Alignment(5,2),
           }else{
              alignment: Alignment.bottomCenter 
           }  */

           
          alignment: Alignment.bottomCenter ,
           child: Text(serviceLabel[itemIndex] ,
           style: const TextStyle(
             fontSize: 14,
             fontWeight: FontWeight.bold,
           ),),
           )
       ],
     ),

);

 String setIt(int index)
{
  if(index == 0){
             return 'Alignment(5,2)';
           }else{
              return 'Alignment.bottomCenter'; 
           }
}
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginStore>(
      builder: (_, loginStore, __) {
        return Scaffold(
          drawer: NavDrawer(),
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.lightGreen[600],
            /*
            leading: IconButton(
              icon: Icon(Icons.menu),
              tooltip: 'menu',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NavDrawer()));
              },
            ),  
            */

            title: const Text('Kisan Vikas',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: const Text(
                  'Sign Out',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  loginStore.signOut(context);
                },
              )
            ],
          ),
         
        body: Stack(
          children: <Widget>[
            
              
            Container(
              alignment: Alignment.topCenter,
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/img/background.jpg'),
                ),
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.6,
              minChildSize: 0.6,
              maxChildSize: 0.8,
              builder: (BuildContext context, ScrollController scrollController) {
                return Container(
                  margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30)
                      ,topRight: Radius.circular(30)
                    ),
                    color: Colors.deepOrangeAccent,
                    //color: Colors.white
                  ),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2
                    ),
                    controller: scrollController,
                    itemCount: 6,
                    itemBuilder: (BuildContext context , int index){
                      return cardsWidget(index);

                    },
                  ),
                  );
              }
            ),
          ],
        )

          /*
          child :DraggableScrollableSheet(
             
            initialChildSize: 1.0,
            maxChildSize: 1.0,
            minChildSize:  1.0,
            builder: (BuildContext context, ScrollController scrollController) {
              
               

                return SingleChildScrollView(
                 controller: ScrollController(), 

                     */

                    /*
                 Stack(//width: 80,
                   children: <Widget>[ 
                     ListView(
                children: <Widget>[
                  Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/img/background.jpg'),
                    //borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    //color: Colors.lightBlueAccent),
                  ),
                ),
              ),
            ),
            
              
              Positioned(
              top: 240,
              
              left: 10,
              height: 130,
              width: 105,
              
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ListTile(
                  title: const Text('Buy Farming Products',
                      style: TextStyle(fontWeight: FontWeight.bold ,
                        fontSize: 14,
                      )
                    ),
                  leading: const CircleAvatar(
            backgroundImage: AssetImage('assets/img/buy.jpeg'),
          ),
                ),
              ),
            ),
            
            Positioned(
              top: 240,
              
              left: 125,
              height: 130,
              width: 105,
              
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),                
                child: ListTile(
                  title: const Text('Weather Report',
                      style: TextStyle(fontWeight: FontWeight.bold ,
                        fontSize: 14,
                      )
                    ),
                  
                  leading: const CircleAvatar(
            backgroundImage: AssetImage('assets/img/wheather.jpeg'),
          ),
                ),
              ),
            ),

            Positioned(   
              top: 240,
              
              left: 240,
              height: 130,
              width: 105,
              //width: 80,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),                
                child: ListTile(
                  title: const Text('Videos',
                      style: TextStyle(fontWeight: FontWeight.bold ,
                        fontSize: 14,
                      )
                    ),
                  
                  leading: const CircleAvatar(
            backgroundImage: AssetImage('assets/img/images.jpeg'),
          ),
                ),
              ),
            ),

            Positioned(          //// 4
              top: 390,
              
              left: 10,
              height: 130,
              width: 105,
              //width: 80,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),                
                child: ListTile(
                  title: const Text('News',
                      style: TextStyle(fontWeight: FontWeight.bold ,
                        fontSize: 14,
                      )
                    ),
                  
                  leading: const CircleAvatar(
            backgroundImage: AssetImage('assets/img/news.jpeg'),
          ),
                ),
              ),
            ),

            Positioned(
              top: 390,
              
              left: 125,
              height: 130,
              width: 105,
              //width: 80,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),                
                child: ListTile(
                  title: const Text('Crop Calender',
                      style: TextStyle(fontWeight: FontWeight.bold ,
                        fontSize: 14,
                      )
                    ),
                  
                  leading: const CircleAvatar(
            backgroundImage: AssetImage('assets/img/calender.png'),
          ),
                ),
              ),
            ),

            Positioned(
              top: 390,
              
              left: 240,
              height: 130,
              width: 105,
              //width: 80,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),                
                child: ListTile(
                  title: const Text('Setting',
                      style: TextStyle(fontWeight: FontWeight.bold ,
                        fontSize: 14,
                      )
                    ),
                  
                  leading: Icon(
                    Icons.settings,
                    color: Colors.blue[500],
                  ),
                ),
              ),
            ),


          ],
        )
                   ]
                 ),


                 */
                ) ;   
            
      }
          );
      }
      
      }
  




