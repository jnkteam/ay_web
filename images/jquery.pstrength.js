
var errordects=new Array("密码包含非法字符,请重新输入。");
var verdects=new Array("您的密码存在安全隐患，建议重新设置。","密码安全性为弱, 密码长度必须为8-20位。", "密码安全性为弱，建议至少使用8-20位大小写字母/数字/字符任2种组合设置 。", "密码安全性为中，建议使用8-20位大小写字母/数字/字符混合设置。", "密码安全性为高，请牢记您的密码。");
var className=new Array("pwd_level_1","pwd_level_2","pwd_level_3");
var scores=new Array(25,50,60,70,80,90);
var minchar=8;

(function(A) {
    A.extend(A.fn, {
        pstrength: function(B) {
            var B = A.extend({
                colors: ["#f00", "#c06", "#f60", "#3c0", "#3f0"],
                scores: [25,50,60,70,80,90],
                common: ["password", "sex", "god", "123456", "123", "liverpool", "letmein", "qwerty", "monkey"],
                minchar: 8
            },
            B);
            return this.each(function() {
                var C = A(this).attr("id");
               
                A(this).keyup(function() {
                    A.fn.runPassword(A(this).val(),C,B);
                })
            })
        },
        runPassword: function(D,C,B) {
            nPerc = A.fn.checkPassword(D, B);
            runPasswordLength(nPerc,C,D);
            //A(B).html("<span style='color: " + strColor + ";'>" + strText + "</span>");
        },
        checkPassword: function(C, B) {
            var F=0;
            var L=C.length;
            var r1 = /^.*[<.>].*/;
            
            if(L>0 && L<=6){
            	F=(F+5);
            }else if(L>6 && L<=7){
            	F=(F+10);
            }else if(L>=B.minchar){
            	F=(F+25);
            }
            
            if (C.match(/([a-z].*[A-Z])|([A-Z].*[a-z])/)) {
                F = (F + 20);
            }else if (C.match(/[a-z]/)) {
                F = (F + 10);
            }else if(C.match(/[A-Z]/)) {
            	F = (F + 10);
            } 
            
            if(C.match(/([0-9]{2,})/)){
            	F=(F+20);
            }else if(C.match(/([0-9]{1,2})/)){
            	F=(F+10);
            }
         
            
            if (C.match(/.[!,@,#,$,%,^,&,*,?,_,~]{1,}/)) {
                F = (F + 25);
            }else if(C.match(/.[!,@,#,$,%,^,&,*,?,_,~]{1}/)){
            	 F = (F + 10);
            }

            if (C.match(/([a-zA-Z])/) && C.match(/([0-9])/) && C.match(/.[!,@,#,$,%,^,&,*,?,_,~]{1,}/)) {
                F = (F + 5);
            }else if((C.match(/([a-z])/) && C.match(/([0-9])/))||(C.match(/([A-Z])/) && C.match(/([0-9])/))){
            	 F = (F + 3);
            }else if(C.match(/([a-zA-Z])/) && C.match(/([0-9])/)){
            	 F = (F + 2);
            }

            for (var D = 0; D < B.common.length; D++) {
                if (C.toLowerCase() == B.common[D]) {
                    F = -2;
                }
            }
            
            if(C.match(r1)){
            	F=-1;
            }
            
            
            return F;
        }
    })
})(jQuery)


function runPasswordLength(N,C,D) {
	var nPerc=N;
	 var P=C+"Pstreng";
     var I=C+"imagePstreng";
	var B = "#" + P ;
    var E = "#" + I ;
    var L="#"+C+"pstrengli";
    if (nPerc == -1) {
    	strText = errordects[0];
        strClass= className[0];
    }else if(nPerc == -2){
    	strText = verdects[0];
        strClass= className[0];
    }else if(nPerc<minchar){
    	strText= verdects[1];
    	strClass = className[0];
    }else {
    	if(nPerc<=scores[0]){
    		strText = verdects[1];
            strClass=className[0];
    	}else if (nPerc > scores[0] && nPerc <= scores[1]) {
        	strText = verdects[2];
            strClass=className[0];
        }else if(nPerc > scores[1] && nPerc <= scores[2]){
        	strText = verdects[3];
        	 strClass=className[1];
        }else if(nPerc > scores[2] && nPerc <= scores[3]){
        	strText = verdects[3];
       	 	strClass=className[1];
        }else if(nPerc > scores[3] && nPerc <= scores[4]){
        	strText = verdects[4];
       	 	strClass=className[2];
        }else if(nPerc > scores[4] && nPerc <= scores[5]){
        	strText = verdects[4];
       	 	strClass=className[2];
        }else{
        	strText = verdects[4];
       	 	strClass=className[2];
        }
    }
   
    if(D.length>0){
    	$(L).show();
    	$("#pstrengli").show();
    }else{
    	$(L).hide();
    	$("#pstrengli").hide();
    }
    $(B).html(strText);
    $(E).attr("class","");
    $(E).addClass(strClass);
	
}

/**
var F = 0;
            var E = B.verdects[0];
            if (length < B.minchar) {
                F = (F - 100)
            } else {
                if (length >= B.minchar && length <= (B.minchar + 2)) {
                    F = (F + 6)
                } else {
                    if (length >= (B.minchar + 3) && length <= (B.minchar + 4)) {
                        F = (F + 12)
                    } else {
                        if (length >= (B.minchar + 5)) {
                            F = (F + 18)
                        }
                    }
                }
            }
            if (match(/[a-z]/)) {
                F = (F + 1)
            }
            if (match(/[A-Z]/)) {
                F = (F + 5)
            }
            if (match(/\d+/)) {
                F = (F + 5)
            }
            if (match(/(.*[0-9].*[0-9].*[0-9])/)) {
                F = (F + 7)
            }
            if (match(/.[!,@,#,$,%,^,&,*,?,_,~]/)) {
                F = (F + 5)
            }
            if (match(/(.*[!,@,#,$,%,^,&,*,?,_,~].*[!,@,#,$,%,^,&,*,?,_,~])/)) {
                F = (F + 7)
            }
            if (match(/([a-z].*[A-Z])|([A-Z].*[a-z])/)) {
                F = (F + 2)
            }
            if (match(/([a-zA-Z])/) && match(/([0-9])/)) {
                F = (F + 3)
            }
            if (match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/)) {
                F = (F + 3)
            }
            for (var D = 0; D < B.common.length; D++) {
                if (toLowerCase() == B.common[D]) {
                    F = -200
                }
            }***/