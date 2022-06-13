package com.notrika.service;

import com.notrika.entity.tables.Setting;
import com.notrika.repository.DAO;
import com.notrika.repository.SettingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class SettingsService implements DAO<Setting>{

	private final SettingRepository repo;
    @Autowired
    public SettingsService(SettingRepository repo) {
    	this.repo = repo;
    }
    @Override
    public void save(Setting vo) {
        repo.save(vo);
    }
	@Override
	public List<Setting> findAll() {
		return repo.findAll();
	}
	@Override
	public Setting findById(Long id) {
		return repo.findById(id).get();
	}

	public Setting findBySkey(Keys Skey) {
		return repo.findBySkey(Skey.key);
	}
	public List<Setting> findBySection(Section section) {
		return repo.findBySection(section.value);
	}
	@Override
	public void delete(Long id) {
		repo.deleteById(id);
		
	}

	public void addOrUpdate(Keys skey, String svalue) {
		Setting lastData = findBySkey(skey);
		if(lastData!=null){
			lastData.setSvalue(svalue);
			save(lastData);
		}else{
			save(new Setting(skey.key,svalue, skey.section));
		}
	}

	public enum Keys{
    	ImportSiteUrl(Section.api.value,"ImportSiteUrl"),
    	ImportConsumerKey(Section.api.value,"ImportConsumerKey"),
    	ImportConsumerPassword(Section.api.value,"ImportConsumerPassword");


		public String key;
		public String section;
		Keys(String _section,String _key) {
			this.section = _section;
			this.key = _key;
		}
	}
	public enum Section {
    	api("api");



		public String value;
		Section(String _section) {
			this.value = _section;
		}
	}
}
