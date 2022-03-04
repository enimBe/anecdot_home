package com.enimbe.anecdot.timeline;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/anecdot")
public class TimelineController {

	@GetMapping("/timeline")
	public String timeline() {
		return "timeline/timeline";
	}
}
