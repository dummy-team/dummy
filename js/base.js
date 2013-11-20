(function($) {

    $.fn.placeholder = function() {
        $(this).data('placeholder', $(this).attr('placeholder'));
        $(this).val(jQuery(this).attr('placeholder'));
        $(this).bind('keypress', emptyMe);
        $(this).bind('click', emptyMe);
        $(this).blur(fullMe);

        function emptyMe() {
            if ($(this).val() == $(this).data('placeholder')) $(this).val('');
        }

        function fullMe() {
            if ($(this).val() == '') $(this).val($(this).data('placeholder'));
        }
    };

    $.fn.hoverSrc = function(on, off) {
        var suffixeOn = on ? on : '-hover';
        var suffixeOff = off ? off : '-off';
        $(this).hover(hoverIn, hoverOut);
        $(this).focus(hoverIn);
        $(this).blur(hoverOut);

        function hoverIn() {
            if (!jQuery(this).hasClass('active')) {
                var srcName = jQuery(this).attr('src');
                srcName = srcName.replace(suffixeOff, suffixeOn);
                jQuery(this).attr({
                    src: srcName
                });
            }
        }

        function hoverOut() {
            if (!jQuery(this).hasClass('active')) {
                var srcName = jQuery(this).attr('src');
                srcName = srcName.replace(suffixeOn, suffixeOff);
                jQuery(this).attr({
                    src: srcName
                });
            }
        }
    };


    $.fn.verticalCenter = function(height) {
        if(height){
            $(this).each(function(){
                if (parseFloat($(this).height()) < 1 ) { return this; }
                $(this).css('padding-top', ( height - parseFloat($(this).height()))/2);
            })
        }
        else {
            $(this).each(function(){
                if (parseFloat($(this).height()) < 1 ) { return this; }
                $(this).css('padding-top', (parseFloat($(this).parent().height()) - parseFloat($(this).height()))/2);
            })
        }
    };


    $.getHash = function(url){
        return url ? url.substring(url.indexOf('#')+1) : window.location.hash;
    };

    $.fn.fixToTop = function(gap) {
        var $that = $(this),
            origin = $that[0].offsetTop;
            originOffSet = parseFloat($that.next().css('marginTop'));
            offSet = parseFloat($that.height()) + parseFloat($that.next().css('marginTop'));
        if (gap) origin = origin + gap;
        fix();
        $(window).scroll(function() {
            fix();
        });
        function fix() {
            if ($(window).scrollTop() > origin) {
                $that.addClass('fixed')
                    .trigger('fixed')
                    .next().css('marginTop', offSet+'px');
            } else {
                $that.removeClass('fixed')
                    .trigger('unfixed')
                    .next().css('marginTop', originOffSet+'px');
            }
        };
    };

    $.fn.smoothAnchors = function(offsetTop, screenOffset) {
        var $anchors = $(this).find('a[href*="#c"]'),
            anchorsOffsets = [];

        offsetTop = offsetTop ? offsetTop : 50;
        screenOffset = screenOffset ? screenOffset : $(window).height()/6;

        $anchors.each(function(){
            var byID = $(('#'+$.getHash($(this).attr('href'))));
            var byName = $('[name="'+$.getHash($(this).attr('href'))+'"]');
            var target;
            if (byID.index() != '-1') {
                target = byID;
            } else {
                target = byName;
            }
            if (target.index() != '-1') {
                anchorsOffsets.push(target.offset().top - screenOffset);
            } else {
                anchorsOffsets.push(0);
            }
        });

        var anchorsOffsetsLength = anchorsOffsets.length;
        $anchors.click(function(e){
            var byID = $(('#'+$.getHash($(this).attr('href'))));
            var byName = $('[name="'+$.getHash($(this).attr('href'))+'"]');
            var target;

            if (byID.index() != '-1') {
                target = byID;
            } else {
                target = byName;
            }
            if (target.index() != '-1') {
                e.preventDefault();
                $('html').scrollTo(target,{ offset :  {top:offsetTop}, duration: 800 });
            }
        });

        $(window).scroll(function(e){
            var scrollTop = $(window).scrollTop()+offsetTop;
            $anchors.removeClass("active");
            for ( var i = 0; i < anchorsOffsetsLength; i++ ) {
                var j = i+1;
                if ( scrollTop >= anchorsOffsets[i] && !anchorsOffsets[j] ) {
                    $anchors.not($anchors[i]).removeClass("active");
                    $($anchors[i]).addClass("active");
                    return;
                }
                else if ( scrollTop >= anchorsOffsets[i] && scrollTop < anchorsOffsets[j] ) {
                    $anchors.not($anchors[i]).removeClass("active");
                    $($anchors[i]).addClass("active");
                    return;
                }
            }
        });
    };

}(jQuery));