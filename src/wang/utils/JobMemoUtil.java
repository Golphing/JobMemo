package wang.utils;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

public class JobMemoUtil {
	
	public static List<String> getTypes(){
		 List<String> types=new ArrayList<String>();
	        types.add("内推");
	        types.add("校招");
	        types.add("实习");
	      return types;
	}
	
	public static List<String> getProcesses(){
		 List<String> status=new ArrayList<String>();
		 	status.add("新投递");
	        status.add("面试中");
	        status.add("初面");
	        status.add("二面中");
	        status.add("三面中");
	        status.add("四面中");
	        status.add("五面中");
	        status.add("我拒绝");
	        status.add("被拒");
	        status.add("等待结果");
	        status.add("拿到offer");
	        return status;
	}
	
}
