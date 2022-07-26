package com.example.languages.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.languages.models.Language;
import com.example.languages.repositories.*;


@Service
public class LanguageServices {
    private final LanguageRepository languageRepository;

	public LanguageServices(LanguageRepository languageRepository) {
		this.languageRepository = languageRepository;
	}
    
	public List<Language> allLanguages() {
        return languageRepository.findAll();
    }
	public Language createLanguage(Language b) {
        return languageRepository.save(b);
    }
	
	public Language findLanguage(Long id) {
        Optional<Language> optionalLanguage = languageRepository.findById(id);
        return (optionalLanguage.isPresent())? optionalLanguage.get(): null;
    }

	public Language updateLanguage(Language expense) {
		return languageRepository.save(expense);
	}
	
	public void deleteLanguage(Long id) {
		languageRepository.deleteById(id);
	}
    

}
