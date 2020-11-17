import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RefreshAndLoadMore extends StatelessWidget {

  dynamic refreshFun;
  dynamic loadMoreFun;
  RefreshController controller;
  dynamic listViewCntroller;
  List<Widget> children;

  RefreshAndLoadMore({this.refreshFun, this.loadMoreFun, this.children,this.controller,this.listViewCntroller});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SmartRefresher(
        controller: controller,
        onRefresh: refreshFun,
        onLoading: loadMoreFun,
        enablePullDown: true,
        enablePullUp: true,
        physics: ClampingScrollPhysics(),
        header: WaterDropHeader(),
        footer: PullToRefreshWidgetFoot(),
        child: ListView(
          controller: listViewCntroller??null,
          physics: ClampingScrollPhysics(),
          children: children,
        ),
      ),
    );
  }
}


class PullToRefreshWidgetFoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomFooter(
      builder: (BuildContext context,LoadStatus mode){
        Widget body ;
        if(mode==LoadStatus.idle){
          body =  Image.asset("Images/loading.gif");
        }
        else if(mode==LoadStatus.loading){
          body =  Image.asset("Images/loading.gif");
        }
        else if(mode == LoadStatus.failed){
          body = Text("加载失败！点击重试！");
        }
        else if(mode == LoadStatus.canLoading){
          body = Text("松手,加载更多!");
        }
        else{
          body = Text("没有更多数据了!");
        }
        return Container(
          height: 55.0,
          child: Center(child:body),
        );
      },
    );
  }
}
