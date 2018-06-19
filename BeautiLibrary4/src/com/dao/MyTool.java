package com.dao;

import java.util.Random;

public class MyTool {
	public int ReturnRandom()
	{
		Random rand = new Random();
		int randNum = rand.nextInt(26);
		return randNum;
	}
	public int OtoT()
	{
		Random rand = new Random();
		int randNum = rand.nextInt(9)+1;
		return randNum;
	}
	public String[] AtoZ()
	{
		String [] AtoZ = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P"
				,"Q","R","S","T","U","V","W","X","Y","Z"};
		return AtoZ;	
	}
	public String CreateBookId()
	{
				String id = AtoZ()[ReturnRandom()]+AtoZ()[ReturnRandom()]+
				AtoZ()[ReturnRandom()]+AtoZ()[ReturnRandom()]+AtoZ()[ReturnRandom()]+
				"-"+OtoT()+OtoT()+OtoT()+OtoT()+OtoT()+"-"+OtoT()+OtoT()+OtoT();
				return id;
	}
	public String CreateBookIdHasType(String typeId)
	{
		String id = typeId+
				"-"+OtoT()+OtoT()+OtoT()+OtoT()+OtoT()+"-"+OtoT()+OtoT()+OtoT();
				return id;
	}
}
