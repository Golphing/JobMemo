package wang.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ebaoyang.utils.JsonUtil;

import wang.model.Company;
import wang.model.SearchParams;
import wang.model.SendRecord;
import wang.model.StatusUpdate;
import wang.service.CompanyService;
import wang.service.SendRecordService;
import wang.service.StatusUpdateService;
import wang.service.UserService;
import wang.utils.JobMemoUtil;

@Controller
@RequestMapping("/jobRecord")
public class JobRecordController {
	@Autowired
	SendRecordService sendRecordService;
	@Autowired
	StatusUpdateService statusUpdateService;
	@Autowired
	CompanyService companyService;
	@Autowired
	UserService userService;
	@RequestMapping("/add")
	@ResponseBody
	public String add(@RequestParam(value="companyId",defaultValue="0") int companyId,
					@RequestParam(value="recruitType",defaultValue="") String recruitType,
					@RequestParam(value="startTime",defaultValue="") String startTime,
					@RequestParam(value="endTime",defaultValue="") String endTime,
					@RequestParam(value="process",defaultValue="") String process,
					@RequestParam(value="remark",defaultValue="") String remark,
					@RequestParam(value="url",defaultValue="") String url,
					@RequestParam(value="sendTime",defaultValue="") String sendTime,
					@RequestParam(value="position",defaultValue="") String position,
					HttpServletRequest request
	){
		Company company=companyService.getById(companyId);
		SendRecord sendRecord=new SendRecord();
		sendRecord.setCompanyName(company.getName());
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
	
		if(!(startTime.equals("") || startTime==null)){
			sendRecord.setStartTime(startTime);
		}else{
			sendRecord.setStartTime(format.format(new Date()));
		}
		if(!(endTime.equals("") || endTime==null)){
			sendRecord.setEndTime(endTime);
		}else{
			sendRecord.setEndTime(format.format(new Date()));
		}
		if(!(sendTime.equals("") || sendTime==null)){
			sendRecord.setSendTime(sendTime);
		}else{
			sendRecord.setSendTime(format.format(new Date()));
		}
		System.out.println(endTime);
		sendRecord.setProcess(process);
		if("".equals(recruitType)){
			sendRecord.setRecruitType(company.getType());
		}else{
			sendRecord.setRecruitType(recruitType);
		}
		if("".equals(url)){
			sendRecord.setUrl(company.getUrl());
		}else{
			sendRecord.setUrl(url);
		}
		sendRecord.setRemark(remark);
		sendRecord.setProcess("新投递");
		sendRecord.setPosition(position);
		sendRecord.setUserId((Integer)request.getSession().getAttribute("id"));
		int aaa=sendRecordService.add(sendRecord);
		StatusUpdate statusUpdate=new StatusUpdate();
		statusUpdate.setRecordId(sendRecord.getId());
		statusUpdate.setRemark("新投递");
		statusUpdate.setUpdateTime(format.format(new Date()));
		statusUpdate.setStatus("新投递");
		statusUpdateService.add(statusUpdate);
		return JsonUtil.getOkJson().toString();
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public String delete(@RequestParam(value="id",defaultValue="0") int id){
		sendRecordService.delete(id);
		return JsonUtil.getOkJson().toString();
	}
	
	/*@RequestMapping("/list")
	public String list(HttpServletRequest request,Model model){
		Integer userId=(Integer)request.getSession().getAttribute("id");
		List<SendRecord> records=sendRecordService.getAll(userId);
		model.addAttribute("records", records);
		return "list";
	}*/
	
	/*@RequestMapping("/list")
	public String listByParams(HttpServletRequest request,
								@RequestParam(value="page",defaultValue="1") int page,
								@RequestParam(value="limit",defaultValue="30") int limit,
								Model model){
		Integer userId=(Integer)request.getSession().getAttribute("id");
		int start=(page-1)*limit;
		List<SendRecord> records=sendRecordService.getAllByParams(userId,start,limit);
		int count=sendRecordService.getAll(userId).size();
		int totalPage = (count + limit - 1) / limit;
        totalPage = totalPage == 0 ? 1 : totalPage;
        List<Company> companies=companyService.getAllCompany();
        model.addAttribute("companies", companies);
        model.addAttribute("totalPage", totalPage);
		model.addAttribute("count",count);
		model.addAttribute("records", records);
		model.addAttribute("page",page);
		model.addAttribute("limit",limit);
		return "list";
	}*/
	
	@RequestMapping("/list")
	public String listByParams(HttpServletRequest request,
								@RequestParam(value="recruitType",defaultValue="") String recruitType,
								@RequestParam(value="process",defaultValue="") String process,
								@RequestParam(value="page",defaultValue="1") int page,
								@RequestParam(value="limit",defaultValue="10") int limit,
								Model model){
		Integer userId=(Integer)request.getSession().getAttribute("id");
		int count1=userService.count1();
		int start=(page-1)*limit;
		System.out.println(recruitType);
		System.out.println(process);
		SearchParams searchParams=new SearchParams();
		searchParams.setProcess(process);
		searchParams.setRecruitType(recruitType);
	//	List<SendRecord> records=sendRecordService.getAllByParams(userId,start,limit);
		List<SendRecord> records=sendRecordService.getAllBySearchParams(userId, searchParams, start, limit);
//		int count=sendRecordService.getAll(userId).size();
		int count=sendRecordService.getCountBySearchParams(userId, searchParams);
		int totalPage = (count + limit - 1) / limit;
        totalPage = totalPage == 0 ? 1 : totalPage;
        List<Company> companies=companyService.getAllCompany(null);
        List<String> types=JobMemoUtil.getTypes();
        List<String> status=JobMemoUtil.getProcesses();
        model.addAttribute("searchParams", searchParams);
        model.addAttribute("types", types);
        model.addAttribute("status", status);
        model.addAttribute("companies", companies);
        model.addAttribute("totalPage", totalPage);
		model.addAttribute("count",count);
		model.addAttribute("records", records);
		model.addAttribute("page",page);
		model.addAttribute("limit",limit);
		model.addAttribute("userCount",count1);
		return "list";
	}
	
	@RequestMapping("/detail")
	public String list(@RequestParam(value="id",defaultValue="0") int id,Model model){
		SendRecord record=sendRecordService.getById(id);
		model.addAttribute("record", record);
		return "detail";
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public String update(@RequestParam(value="companyName",defaultValue="") String companyName,
					@RequestParam(value="recruitType",defaultValue="") String recruitType,
					@RequestParam(value="startTime",defaultValue="") String startTime,
					@RequestParam(value="endTime",defaultValue="") String endTime,
					@RequestParam(value="process",defaultValue="") String process,
					@RequestParam(value="remark",defaultValue="") String remark,
					@RequestParam(value="url",defaultValue="") String url,
					@RequestParam(value="id",defaultValue="0") int id,
					@RequestParam(value="sendTime",defaultValue="") String sendTime,
					@RequestParam(value="position",defaultValue="") String position
					
	){
		SendRecord sendRecord=sendRecordService.getById(id);
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		sendRecord.setCompanyName(companyName);
		if(!(startTime.equals("") || startTime==null)){
			sendRecord.setStartTime(startTime);
		}else{
			sendRecord.setStartTime(format.format(new Date()));
		}
		if(!(endTime.equals("") || endTime==null)){
			sendRecord.setEndTime(endTime);
		}else{
			sendRecord.setEndTime(format.format(new Date()));
		}
		if(!(sendTime.equals("") || sendTime==null)){
			sendRecord.setSendTime(sendTime);
		}else{
			sendRecord.setSendTime(format.format(new Date()));
		}
		System.out.println(endTime);
		sendRecord.setProcess(process);
		sendRecord.setRecruitType(recruitType);
		sendRecord.setUrl(url);
		sendRecord.setRemark(remark);
		sendRecord.setPosition(position);
		sendRecordService.update(sendRecord);
		return JsonUtil.getOkJson().toString();
	}
	
	@RequestMapping("/statusList")
	public String statusList(@RequestParam(value="id",defaultValue="0") int id,Model model){
		List<StatusUpdate> statusList=statusUpdateService.getStatusByRecordId(id);
		List<String> status=JobMemoUtil.getProcesses();
		model.addAttribute("status", status);
		model.addAttribute("recordId", id);
		model.addAttribute("statuses", statusList);
		return "status_list";
	}
	
	@RequestMapping("/alterStatus")
	@ResponseBody
	public String alterStatus(@RequestParam(value="id",defaultValue="0") int id,
								@RequestParam(value="status",defaultValue="") String status,
								@RequestParam(value="remark",defaultValue="") String remark){
		StatusUpdate statusUpdate=new StatusUpdate();
		SendRecord sendRecord=sendRecordService.getById(id);
		sendRecord.setProcess(status);
		statusUpdate.setRecordId(id);
		statusUpdate.setRemark(remark);
		statusUpdate.setStatus(status);
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		statusUpdate.setUpdateTime(format.format(new Date()));
		statusUpdateService.add(statusUpdate);
		sendRecordService.update(sendRecord);
		return JsonUtil.getOkJson().toString();
	}
	
	@RequestMapping("/listCompany")
	public String listCompany(@RequestParam(value="type",defaultValue="") String type,Model model){
		Company com=new Company();
		com.setType(type);
		List<Company> companies=companyService.getAllCompany(com);
		List<String> types=JobMemoUtil.getTypes();
		
		int count1=userService.count1();
		model.addAttribute("type", type);
		model.addAttribute("userCount", count1);
		model.addAttribute("types", types);
		model.addAttribute("companies", companies);
		return "list_company";
	}
	
	@RequestMapping("/addCompany")
	@ResponseBody
	public String addCompany(@RequestParam(value="name",defaultValue="") String name,
							@RequestParam(value="type",defaultValue="") String type,
							@RequestParam(value="remark",defaultValue="") String remark,
							@RequestParam(value="url",defaultValue="") String url
			
	){
		Company company=new Company();
		company.setName(name);
		company.setRemark(remark);
		company.setType(type);
		company.setUrl(url);
		companyService.add(company);
		return JsonUtil.getOkJson().toString();
	}
	
	@RequestMapping("/getCompany")
	@ResponseBody
	public String getCompany(@RequestParam(value="id",defaultValue="0") int id){
		Company company=companyService.getById(id);
		//return JSONObject.fromObject(company).toString();
		System.out.println(JsonUtil.getOkJsonResult(company).toString());
		return JsonUtil.getOkJsonResult(company).toString();
		
	}
}
