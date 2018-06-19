function isEdit(id)
{
	var BId = id+"Bid";
	

	var BName = id+"Bname";
	var BNameText = id+"BnameText";
	
	var BType = id+"Btype";
	var BTypeText = id+"BtypeText";
	
	var BPrice = id+"Bprice";
	var BPriceText = id+"BpriceText";
	
	var BAuthor = id+"Bauthor";
	var BAuthorText = id+"BauthorText";
	
	var BPress = id+"Bpress";
	var BPressText = id+"BpressText";
	
	var BUpdate = id+"Update";
	var BUpdateAct = id+"UpdateAct";
	var BCancel = id+"Cancel";
	
	
	if(document.getElementById(BName).style.display == "none")
		{
			document.getElementById(BId).value = id;
			
		
			document.getElementById(BName).style.display="inline";
			document.getElementById(BName).value = document.getElementById(BNameText).innerText;
			document.getElementById(BNameText).style.display="none";
			
			
			document.getElementById(BType).style.display="inline";
			document.getElementById(BType).value = document.getElementById(BTypeText).innerText;
			document.getElementById(BTypeText).style.display="none";
			
			document.getElementById(BPrice).style.display="inline";
			document.getElementById(BPrice).value = document.getElementById(BPriceText).innerText;
			document.getElementById(BPriceText).style.display="none";
			
			document.getElementById(BAuthor).style.display="inline";
			document.getElementById(BAuthor).value = document.getElementById(BAuthorText).innerText;
			document.getElementById(BAuthorText).style.display="none";
			
			document.getElementById(BPress).style.display="inline";
			document.getElementById(BPress).value = document.getElementById(BPressText).innerText;
			document.getElementById(BPressText).style.display="none";
			
			document.getElementById(BUpdate).style.display="none";
			document.getElementById(BUpdateAct).style.display="inline";
			document.getElementById(BCancel).style.display="inline";
			
			
		}
	else
		{
			
			document.getElementById(BId).value = "a";
			document.getElementById(BId).style.display = "none";
		
			document.getElementById(BName).style.display="none";
			document.getElementById(BNameText).style.display="inline";
			
			document.getElementById(BType).style.display="none";
			document.getElementById(BTypeText).style.display="inline";
			
			document.getElementById(BPrice).style.display="none";
			document.getElementById(BPriceText).style.display="inline";
			
			document.getElementById(BAuthor).style.display="none";
			document.getElementById(BAuthorText).style.display="inline";
			
			document.getElementById(BPress).style.display="none";
			document.getElementById(BPressText).style.display="inline";
			
			document.getElementById(BUpdate).style.display="inline";
			document.getElementById(BUpdateAct).style.display="none";
			document.getElementById(BCancel).style.display="none";
			
		}
	
	
}

