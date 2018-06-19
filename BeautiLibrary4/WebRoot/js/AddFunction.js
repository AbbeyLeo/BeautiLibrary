

function InputBnameCheck(){
	var Bname=insert_form.Bname.value;
	var reg = /^[0-9a-zA-Z\u4e00-\u9fa5]+$/
		if(Bname == "" ||Bname == null)
		{
			document.getElementById("nameError").innerText="书名不能为空!";
			
			return;
		}		
		else if(!reg.test(Bname))
			{
				document.getElementById("nameError").innerText="格式不对!";
				
				return;
			}
		else
			{
				document.getElementById("nameError").innerText=" ";
			}
}
function InputBtypeCheck(){
	var Btype=insert_form.Btype.value;
	var reg =  /^[a-zA-Z\u4e00-\u9fa5]+$/;
		if(Btype == "" ||Btype == null)
		{
			document.getElementById("typeError").innerText="类型不能为空!";
			
			return;
		}				
		else if(!reg.test(Btype))
			{
				document.getElementById("typeError").innerText="输入格式不对，只能输入中文和英文!";
				
				return;
			}
		else
			{
				document.getElementById("typeError").innerText=" ";
			}
}
function InputBpriceCheck(){
	var Bprice=insert_form.Bprice.value;
	var reg =/^\d+(\.\d+)?$/;
		if(Bprice == "" ||Bprice == null)
		{
			document.getElementById("priceError").innerText="价钱不能为空!";
			
			return;
		}				
		else if(!reg.test(Bprice))
			{
				document.getElementById("priceError").innerText="请输入正确的格式!";
				
				return;
			}
		else
			{
				document.getElementById("priceError").innerText=" ";
			}
}
function InputBauthorCheck(){
	var Bauthor=insert_form.Bauthor.value;
	var reg =  /^[a-zA-Z\u4e00-\u9fa5]+$/
		if(Bauthor == "" ||Bauthor == null)
		{
			document.getElementById("authorError").innerText="作者不能为空!";
			
			return;
		}				
		else if(!reg.test(Bauthor))
			{
				document.getElementById("authorError").innerText="格式不对!";
				
				return;
			}
		else
			{
				document.getElementById("priceError").innerText=" ";
			}
}
function InputBpressCheck(){
	var Bpress=insert_form.Bpress.value;
	var reg =  /^[0-9a-zA-Z\u4e00-\u9fa5]+$/
		if(Bpress == "" ||Bpress == null)
		{
			document.getElementById("PressError").innerText="出版社不能为空!";
			
			return;
		}				
		else if(!reg.test(Bpress))
			{
				document.getElementById("PressError").innerText="格式不对!";
				
				return;
			}
		else
			{
				document.getElementById("PressError").innerText=" ";
			}
}
function OnBnameFocus()
{
	document.getElementById("nameError").innerText="";
}
function OnBpriceFocus()
{
	document.getElementById("priceError").innerText="";
}
function OnBauthorFocus()
{
	document.getElementById("authorError").innerText="";
}
function OnBpressFocus()
{
	document.getElementById("PressError").innerText="";
}
function OnBtypeFocus()
{
	document.getElementById("typeError").innerText="";
}
