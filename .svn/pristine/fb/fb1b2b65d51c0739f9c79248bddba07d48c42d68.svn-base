// 회원 아이디 정규식 - 영소, 숫자 4~14자
String.prototype.validationID = function(){
	return /^[a-z0-9]{4,12}$/.test(this);
}

// 회원 비밀번호 정규식 - 영대소, 숫자, 특수문자 8~24
String.prototype.validationPWD = function(){
	// 'asdfasdf'.validationPWD();
	// this == 'asdfasdf' 
	return /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]|.*[0-9]).{8,24}$/.test(this);
//	return /^[a-z0-9]{4,8}$/.test(this);
}
String.prototype.validationNM = function(){
	return /^[가-힣]{2,4}$/.test(this);
}
String.prototype.validationREGNO = function(){
	// ? ? ? ? ? ? - ? ? ? ? ? ?              ?(매직넘버)
	// * * * * * *   * * * * * *
	// 2+3+4+5+6+7 + 8+9+2+3+4+5 = 값1
	// (11 - (값1 % 11)) % 10 = 값2
	// if(값2 == 매직넘버) ? 유효 : 무효
	// 111111-1111118
	var moto = this.replace('-', '');
	// 111111111111                       8
	var magicNum = this.substr(13, 1);
	var sum = 0;
	var checkSum = '234567892345';
	for(var i=0; i<12; i++){
		sum += moto.charAt(i) * checkSum.charAt(i);
	}
	
	var finalValue = (11-(sum%11))%10;
	
	if(finalValue == parseInt(magicNum)){
		return true;
	}else{
		return false;
	}
}
String.prototype.validationBIR = function(){
	return /^(19|20)\d{2}-(0|1)\d{1}-\d{2}$/.test(this);
}
String.prototype.validationZIP = function(){
	return /^\d{3}-\d{3}$/.test(this);
}
String.prototype.validationHOMETEL = function(){
	return /^0\d{1,2}-\d{3,4}-\d{4}$/.test(this);
}
String.prototype.validationCOMTEL = function(){
	return /^0\d{1,2}-\d{3,4}-\d{4}$/.test(this);
}
String.prototype.validationHP = function(){
	return /^01(0|1|6|7|8|9)-\d{3,4}-\d{4}$/.test(this);
}
String.prototype.validationMAIL = function(){
	return /^\w+@[a-z]+(\.[a-z]+){1,2}$/.test(this);
}

