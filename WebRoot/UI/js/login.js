function checkForm(){
	if($('#userCard').val()==''){
		$('#noticeMsg').html('请输入账号！');
		$('#userCheckCode').click();
		$('#userCard').focus();
		return false;
	}
	if($('#userPwd').val()==''){
		$('#noticeMsg').html('请输入密码！');
		$('#userCheckCode').click();
		$('#userPwd').focus();
		return false;
	}
	if($('#userCheck').val()!=$('#userCheckCode').html()){
		$('#noticeMsg').html('验证码错误，请输入验证码！');
		$('#userCheckCode').click();
		$('#userCheck').val('').focus();
		return false;
	}
	return true;
}
function resetForm(){
	$('#userCard').val('').change();
	$('#userPwd').val('').change();
	$('#userCheck').val('').change();
	$('#userCheckCode').click();
	$('#noticeMsg').html('请输入用户名、密码、验证码！');
}
$(document).ready(function(){
	$('.txt').keydown(function(){
		var obj = $(this);
		if(obj.val()!=''){
			obj.next('.placeholder').hide();
		}else{
			obj.next('.placeholder').show();
		}
	}).keyup(function(){
		$(this).keydown();
	}).focus(function(){
		$(this).keydown();
	}).change(function(){
		$(this).keydown();
	});
	setTimeout(function(){
		$('.txt').change();
	},100);
	$('.placeholder').click(function(){
		$(this).prev().focus();
	});
	$('.proofcode').click(function(){
	    var seed = '0123456789';
	    var code = '';
	    for(var i=0; i<4; i++){
	        code += seed.substr(Math.floor(Math.random()*(10)), 1);
	    }
		$(this).html(code);
	}).click();
});