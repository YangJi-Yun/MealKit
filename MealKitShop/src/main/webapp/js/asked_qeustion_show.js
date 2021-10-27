function getShow(id){
  if($(id).is(":visible")){
    $(id).hide();
  }else{
    $(id).show();
  }
}