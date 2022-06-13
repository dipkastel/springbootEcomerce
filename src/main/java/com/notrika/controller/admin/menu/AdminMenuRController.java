package com.notrika.controller.admin.menu;

import com.notrika.entity.tables.Menu;
import com.notrika.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "/api/menu", produces = "application/json", headers = "Accept=*/*")
@CrossOrigin(origins = "*")
public class AdminMenuRController {


    private final MenuService menuService;

    @Autowired
    public AdminMenuRController(MenuService _menuService) {
        this.menuService = _menuService;
    }

    @GetMapping("/all")
    public List<Menu> getAll(Model model, Authentication authentication) {
        return menuService.findAll();
    }

    @GetMapping("/get")
    public Menu get(@RequestParam(name = "id") Long id,Model model, Authentication authentication) {
        return menuService.findById(id);
    }
    @PostMapping("/add")
    public void add( Menu menu,Model model, Authentication authentication) {
         menuService.save(menu);
    }
    @PostMapping("/update")
    public void update( Menu menu,Model model, Authentication authentication) {
         menuService.save(menu);
    }
    @DeleteMapping("/delete")
    public void delete(@RequestParam(name = "id") Long id,Model model, Authentication authentication) {
         menuService.delete(id);
    }
}
