package kr.co.brownie;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}

	@RequestMapping(value = "index")
	public String index() {
		return "index";
	}

	@RequestMapping(value = "404")
	public String error404() {
		return "404";
	}

	@RequestMapping(value = "categories-grid")
	public String categories_grid() {
		return "categories-grid";
	}

	@RequestMapping(value = "categories-list")
	public String categories_list() {
		return "categories-list";
	}

	@RequestMapping(value = "contact")
	public String contact() {
		return "contact";
	}

	@RequestMapping(value = "details-post-default")
	public String details_post_default() {
		return "details-post-default";
	}

	@RequestMapping(value = "details-post-gallery")
	public String details_post_gallery() {
		return "details-post-gallery";
	}

	@RequestMapping(value = "details-post-review")
	public String details_post_review() {
		return "details-post-review";
	}

	@RequestMapping(value = "main")
	public String main() {
		return "main";
	}

	@RequestMapping(value = "typography")
	public String typography() {
		return "typography";
	}

}
