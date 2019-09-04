$.notify({
             icon: '../../static/img/bell.png',
             title: '알람 제목',
             message: '알람 내용'
         },{
             type: 'minimalist',
             delay: 5000,
             icon_type: 'image',
             template:
             '<div data-notify="container" class="col-xs-11 col-sm-3 alert alert-{0}" role="alert">' +
             '<img data-notify="icon" class="img-circle pull-left">' +
             '<span data-notify="title">{1}</span>' +
             '<span data-notify="message">{2}</span>' +
             '</div>'
         });
