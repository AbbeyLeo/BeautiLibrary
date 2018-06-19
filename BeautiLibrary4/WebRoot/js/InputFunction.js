/**
 * 
 */
function InputNameOnBlurCheck()
{
	var username = loginForm.username.value;
	var reg = /^[0-9a-zA-Z]+$/
	if(username == "" ||username == null)
	{
		document.getElementById("nameError").innerText="用户名不能为空!";
		
		return;
	}		
	else if(username.length > 8 || username.length < 4)
		{
			document.getElementById("nameError").innerText="用户名的长度在4~8位!";
			
			return;
		}
	else if(!reg.test(username))
		{
			document.getElementById("nameError").innerText="您输入的不是数字和字母!";
			
			return;
		}
	else
		{
			document.getElementById("nameError").innerText="  ";
		}
}
function OnNameFocus()
{
	document.getElementById("nameError").innerText="  ";
}

function OnPwdFocus()
{
	document.getElementById("PwdError").innerText="  ";
}

function InputPwdOnBlurCheck()
{
	var password = loginForm.password.value;
	var reg = /^[0-9a-zA-Z]+$/
	if(password == "" ||password == null)
		{
		document.getElementById("PwdError").innerText="密码不能为空!";
		;
		return;
		}
	else if(password.length>12 || password.length < 4)
		{
			document.getElementById("PwdError").innerText="密码的长度在4~12位!";
			
			return;
		}
	else
		{
			document.getElementById("PwdError").innerText="  ";
		}
}



