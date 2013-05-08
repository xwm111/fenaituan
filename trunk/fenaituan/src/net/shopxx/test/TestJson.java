package net.shopxx.test;

import net.sf.json.JSONArray;
import net.shopxx.entity.Region;

public class TestJson {

	public static void main(String[] args) {
//		JSONArray ja = new JSONArray();
//		ja.add(new Region().toJsonString());
//		ja.add(new Region().toJsonString());
//		System.out.println(ja);
		int count=0;
		for(int i=0;i<3;i++)
		{
			for(int j=0;j<4;j++)
			{
				 count++;
				 if(count==1||count==5)
				 {
					 System.out.println("A");
				 }
				 else
				 {
					 System.out.println("B");
				 }
				 if(count==8) break;
				
			}
			if(count==8) break;
		}
	}
}
