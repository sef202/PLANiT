import 'package:flutter/material.dart';
import 'myAddClasses.dart';

import 'package:planit_sprint2/services/database.dart';
import 'package:provider/provider.dart';
import 'package:planit_sprint2/model/course_model.dart';
import 'package:planit_sprint2/authenticate/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'classDetail.dart';




class MyClassesApp extends StatefulWidget{

  @override
  MyClassesAppState createState() => MyClassesAppState();

}

class MyClassesAppState extends State<MyClassesApp>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final user = Provider.of<User>(context);

    return new Scaffold(
      appBar: AppBar(
        title: Text('My Class Schedule'),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('classes').where('User', isEqualTo: user.uid).snapshots(),
        builder: (context, snapshot) {

          return ListView.builder(

              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot document = snapshot.data.documents[index];
                Course course = new Course(
                  className: document['className'] ?? 'className',
                  description: document['description'] ?? 'description',
                  day: document['day'] ?? 'day',
                  startTime: document['startTime'] ?? 'startTime',
                  endTime: document['endTime'] ?? 'endTime',
                  room: document['room'] ?? 'room',
                  instructor: document['instructor'] ?? 'instructor',
                  done: document['done'] ?? false,
                );
                return Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Card(
                      margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                      color: Colors.black,
                      child: InkWell (
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => ClassDetail(course)),
                          );
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
//                            GestureDetector(
//                              onTap: () async {
//                                await Firestore.instance.collection('classes').document(course.className).setData(
//                                    {
//                                      'User': user.uid,
//                                      'className': course.className,
//                                      'description':  course.description,
//                                      'day': course.day,
//                                      'startTime': course.startTime,
//                                      'endTime': course.endTime,
//                                      'room': course.room,
//                                      'instructor': course.instructor,
//                                      'done': !course.done
//                                    });
//                              },
//                              child: course.done
//                                  ? Icon(Icons.check_circle, color: Colors.white)
//                                  : Icon(Icons.radio_button_unchecked, color: Colors.white),
//                            ),
//                            SizedBox(width: 10),

//                            Text(course.className, style:TextStyle(color:Colors.white, fontSize: 20)),

                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(course.className, style:TextStyle(color:Colors.white, fontSize: 20)),
                                ]
                              ),
                            )

                          ],
                        ),
                      )
                  ),
                );
              }
          );
        },
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print('clicked');
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => MyAddClasses()),
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),


    );
  }
}

