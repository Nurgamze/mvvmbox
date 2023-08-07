import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../viewModel/post_view_model.dart';

class PostView extends StatelessWidget {

  //view model katmanını kullanmak için
  final _viewmodel = PostViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
           _viewmodel.getAllPosts2();
        },
      ),
      body: Center(
        //mobx kullanıyorsan eğer kullandıgın yeri observer ile sarmala
        child:Center(
          child: Observer( builder: (_) {
            //enumu burda çağırıyorum
            switch(_viewmodel.pageState){
              case PageState.LOADING:
                return CircularProgressIndicator();
              case PageState.SUCCESS:
                return buildListView();
              case PageState.ERROR:
                return Center(child: Text("errorr"),);
              default:
                return FlutterLogo();
            }
           }
          ),
        ),
      ),
    );
  }

  ListView buildListView() {
    return ListView.separated(
              separatorBuilder:(context,index) => Divider(),
                itemCount: _viewmodel.posts.length,
                itemBuilder: (context,index)=>buildListTile(index));
  }

  ListTile buildListTile(int index) {
    return ListTile(
                  title: Text("${_viewmodel.posts[index].title}"),
                  subtitle: Text("${_viewmodel.posts[index].body}"),
                  leading: Text("${_viewmodel.posts[index].id}"),
                );
        }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("GDEMİR"),
      leading: Observer(builder: (_) {
          return Visibility(
            visible: _viewmodel.isServiseRequestLoading, //bu değer true ise visible true
              child: Padding(
                padding:  EdgeInsets.all(8.0),
                child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white) ,),
              ));
        }
      ),
    );
  }
}
