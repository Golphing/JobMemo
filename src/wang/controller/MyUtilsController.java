package wang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/wang/utils")
public class MyUtilsController {
	@RequestMapping("/strTrim")
	public String strTrim(@RequestParam(value="str",defaultValue="") String str,Model model){
		model.addAttribute("str", str);
		String str1=str.replaceAll("\\r\\n","");
		model.addAttribute("str1", str1);
		System.out.println("sfsdf");
		return "pdf_result";
	}
}
