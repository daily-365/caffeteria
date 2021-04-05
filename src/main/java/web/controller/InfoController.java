package web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/info/*")
public class InfoController {

	
	@RequestMapping("/location")
	public void location() {};
	
	@RequestMapping("/privacy")
	public void privacy() {};
	
	@RequestMapping("/useragree")
	public void useragree() {};
	
	
}
