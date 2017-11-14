package com.tutorialspoint;
import java.util.*;
import java.util.ArrayList;
import java.util.List;

import javax.json.Json;
import javax.json.JsonArray;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import java.io.*;

class Student
{
String fn;
String ln;
int age;
int id;
public Student(String fn1,String ln1,int age1,int id1)
{
	fn=fn1;
	ln=ln1;
	age=age1;
	id=id1;
}
}

@Path("/webservice")
public class WebService  {

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Object getResponse() throws Exception{  
        //firstName,LastName,Age,Id
    	Scanner s=new Scanner(new File("C:\\Users\\Sumit\\Desktop\\Hello"));
    	PrintWriter pw=new PrintWriter(new File("C:\\Users\\Sumit\\workspace\\UserManagement\\src\\com\\tutorialspoint\\Hello"));
    	
    	pw.append("New Line\n");
    	int x[]=new int[80];
    	for(int i=0;i<80;i++)
    	x[i]= (int)new Date().getTime()%10+(int)(Math.random()*100);
        
        List<Integer> List = new ArrayList<Integer>();
        for(int i=0;i<80;i++)
        List.add(x[i]);
        
        
        //stuList.add(std2);
        //stuList.add(std3);
        Gson gson = new GsonBuilder().create();
        //com.google.gson.JsonArray jsonarray=gson.toJsonTree(List).getAsJsonArray();  
        //JsonObject user=new JsonObject();
        //user.add("heartbeat", jsonarray);
        //while(true)
       pw.append(gson.toJson(List));
        return  gson.toJson(List);
    }
}
