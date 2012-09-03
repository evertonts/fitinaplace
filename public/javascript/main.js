$(document).ready (function()
    {
        $('#Conteudo h1, .application h1, #Login h1 ').each(function(i)
        {
            var corDiv   = $($(this).parent()).css('background-color');
            var corFonte = $(this).css('color');
            
            if(corDiv == 'transparent' || corDiv == 'rgba(0, 0, 0, 0)')
                corDiv='#FFF';
            
            if(corFonte == 'transparent'|| corFonte == 'rgba(0, 0, 0, 0)')
                corFonte='#FFF';
            
            $(this).css('display','table');
            var db = $('<div>');
            db.css('height',$(this).height() + 40);
            db.css('width',$(this).width() + 40);
            db.css('background-color',corFonte);
            db.css('border-radius', '5px');
            db.css('margin-bottom', '20px');
    
            var dh = $('<div>');
            dh.css('height',$(this).height());
            dh.css('width',$(this).width() + 40);
            
            dh.css('position','absolute');
            dh.css('background-color',corDiv);
            dh.css('margin-top','20px');
            dh.appendTo(db);
    
            var dv = $('<div>');
            dv.css('height',$(this).height() + 40);
            dv.css('width',$(this).width());
            
            dv.css('position','absolute');
            dv.css('background-color',corDiv);
            dv.css('margin-left','20px');
            dv.appendTo(db);
    
            var dc = $('<div>');
            dc.css('height',$(this).height());
            dc.css('width',$(this).width());
            dc.css('border-radius', '2px');
            dc.css('position','absolute');
            dc.css('background-color',corDiv);
            dc.css('padding','16px');
            dc.css('margin-top','4px');
            dc.css('margin-left','4px');
    
            dc.appendTo(db);
    
            $(this).replaceWith(db).appendTo(dc);    
        });     
        
        function maxWidth(A)
        {
            var max = 0;
             for(var i = 0; i < A.length; i++)
             {
                 if( $(A[i]).width() > max)
                    max = $(A[i]).width();                  
             }
             return max;
        }
        
        $('.formAligns label, .form_interno label').css('width', maxWidth($('.formAligns label, .form_interno label').get())).css('display','inline-block');       
    });