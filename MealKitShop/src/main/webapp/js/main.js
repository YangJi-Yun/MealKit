function slide_event(direct) {
    let num=1;
    if(direct){
        if(num == 5) num=1;
        else num++;
    }else{
        if(num == 1) num=5;
        else num--;
    }
    let imgTag = document.getElementById("photo");
    imgTag.setAttribute("src", "images/main_event"+num+".png");
}