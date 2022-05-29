
    let path = $(location).attr('pathname');

    function getElement(path) {
    var splitedPath = path.split('/')
    if(splitedPath[2]) return  $('a[href="'+"/"+splitedPath[1]+"/"+splitedPath[2]+'"]');
    else return $('a[href="'+"/"+splitedPath[1]+'"]');
}

    let element = getElement(path);
    let data = element.parent().parent().parent();
    if(data.attr("class")){
    if (data.attr("class").includes("mt-2")){
    element.addClass('active');
    element.parent().addClass('active');
}else{
    data.addClass('nav-item menu-is-opening menu-open');
    data.find('a:first').addClass('active');
    element.addClass('active');
}
}
