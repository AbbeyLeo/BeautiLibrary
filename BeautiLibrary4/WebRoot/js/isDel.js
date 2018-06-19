

function isDel()
{	
	document.getElementById("DelSub").action="/BeautiLibrary/Logined/DeleteHandle";
	var ChangeBt = document.getElementById("ChangeBt"); 
	var SureBt = document.getElementById("SureDel"); 
	var CB = document.getElementsByName("DeleteCB");
	var UpdateBt = document.getElementsByName("Update");
	var QuitBt = document.getElementById("QuitBt");
	var DelBt = document.getElementById("DelBt");
	if(CB[0].style.display == "none")
		for(var i=0; i<CB.length;i++)
			{
				CB[i].style.display = "inline";
				UpdateBt[i].style.display = "none";
			}
	else
		for(var i=0; i<CB.length;i++)
			{
				CB[i].style.display = "none";
			}
	if(ChangeBt.style.display == "inline")
		{
			DelBt.style.display = "none";
			ChangeBt.style.display = "none";
			SureBt.style.display = "inline";
			QuitBt.style.display = "inline";	
		}
}
function isChange()
{
	document.getElementById("DelSub").action="/BeautiLibrary/Logined/DoUpdate";
	var ChangeBt = document.getElementById("ChangeBt"); 
	var SureBt = document.getElementById("SureDel"); 
	var CB = document.getElementsByName("DeleteCB");
	var UpdateBt = document.getElementsByName("Update");
	var QuitBt = document.getElementById("QuitBt");
	var DelBt = document.getElementById("DelBt");

	if(UpdateBt[0].style.display == "none")
		for(var i=0; i<CB.length;i++)
			{
				UpdateBt[i].style.display = "inline";
				CB[i].style.display = "none";
			}
	else
		for(var i=0; i<CB.length;i++)
			{
				CB[i].style.display = "none";
			}
	if(DelBt.style.display == "inline")
		{
		
			DelBt.style.display = "none";
			ChangeBt.style.display = "none";
			SureBt.style.display = "none";
			QuitBt.style.display = "inline";	
		}
}
function isQuit()
{
	var ManageBt = document.getElementById("ManageBt");
	var DelBt = document.getElementById("DelBt");
	var ChangeBt = document.getElementById("ChangeBt");
	var SureBt = document.getElementById("SureDel"); 
	var CB = document.getElementsByName("DeleteCB");
	var UpdateBt = document.getElementsByName("Update");
	var QuitBt = document.getElementById("QuitBt");
	ManageBt.style.display = "inline";
	ChangeBt.style.display = "none";
	SureBt.style.display = "none";
	QuitBt.style.display = "none";
	DelBt.style.display = "none";
	DelBt.style.display = "none";
	for(var i=0; i<CB.length;i++)
	{
		CB[i].style.display = "none";
		CB[i].checked = false;
		UpdateBt[i].style.display = "none";

		
	}
}

function isChar()
{
	var ManageBt = document.getElementById("ManageBt");
	var DelBt = document.getElementById("DelBt");
	var ChangeBt = document.getElementById("ChangeBt");
	if(ManageBt.style.display == "inline")
		{
			ManageBt.style.display = "none";
			DelBt.style.display = "inline";
			ChangeBt.style.display = "inline";	
		}
	else
		{
			ManageBt.style.display = "inline";
			DelBt.style.display = "none";
			ChangeBt.style.display = "none";
		}
}

