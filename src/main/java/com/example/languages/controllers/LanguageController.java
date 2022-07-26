package com.example.languages.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.languages.models.Language;
import com.example.languages.services.LanguageServices;


@Controller
@RequestMapping("languages")
public class LanguageController {
	private final LanguageServices languageServices;

	public LanguageController(LanguageServices languageServices) {
		this.languageServices = languageServices;
	}
	
	@RequestMapping("")
	public String index(Model model, @ModelAttribute("language") Language language) {
		List<Language> languages = languageServices.allLanguages();
		model.addAttribute("languages", languages);
		return "/index.jsp";
	}
	
	@RequestMapping(value="", method=RequestMethod.POST)
	public String create(Model model, @Valid @ModelAttribute("language") Language language, BindingResult result, RedirectAttributes redirectAttributes ) {
		if (result.hasErrors()) {
			//return index(model, expense);
			List<Language> languages = languageServices.allLanguages();
			model.addAttribute("languages", languages);
			return "/index.jsp";
        } 
		languageServices.createLanguage(language);
    	redirectAttributes.addFlashAttribute("success", "Language was created successfully");
        return "redirect:/languages";
        
	}
	
	@RequestMapping("/{id}")
	public String show(@PathVariable(value="id") Long id, Model model) {
		Language language = languageServices.findLanguage(id);
        model.addAttribute("language", language);
		return "/show_language.jsp";
	}
	
	@RequestMapping("/{id}/edit")
   	public String edit(@PathVariable("id") Long id, Model model) {
		Language language = languageServices.findLanguage(id);
		model.addAttribute("language", language);
        	return "/edit.jsp";
    	}
    
	@RequestMapping(value="/{id}", method=RequestMethod.PUT)
	public String update(@Valid @ModelAttribute("language") Language language, BindingResult result, RedirectAttributes redirectAttributes) {
		if (result.hasErrors()) {
		    return "/edit.jsp";
		}
		languageServices.updateLanguage(language);
		redirectAttributes.addFlashAttribute("success", "Language was edited successfully");
		return "redirect:/languages";
		
	    }
	
	@RequestMapping(value="/{id}", method=RequestMethod.DELETE)
	public String destroy(@PathVariable(value="id") Long id,RedirectAttributes redirectAttributes) {
		languageServices.deleteLanguage(id);
		redirectAttributes.addFlashAttribute("success", "Language was deleted successfully");
		return "redirect:/languages";
	    }

}
