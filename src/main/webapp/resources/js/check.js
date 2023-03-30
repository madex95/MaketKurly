
function byteCheck(msg,str,max){
	 
	  var text = msg;
	  var max = max;
	  var str = str;
	  
	  var msglen = getByteLengthOfString(text);
	  if(msglen>max){
	  	alert(str + " 최대 길이를 초과하였습니다.");
	  	return false;
	 }	
	 return true;
}

const getByteLengthOfString = function(s,b,i,c){
    for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
    return b;
};

function checkExistData(value, dataName) {
			if (value == "") {
				alert(dataName + " 입력해주세요");
				return false;
			}
			return true;
	}