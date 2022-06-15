package com.notrika.controller.admin.menu;

import com.notrika.entity.tables.Menu;
import com.notrika.entity.testentity;
import com.notrika.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping(path = "/api", produces = "application/json", headers = "Accept=*/*")
@CrossOrigin(origins = "*")
public class AdminMenuRController {


    private final MenuService menuService;

    @Autowired
    public AdminMenuRController(MenuService _menuService) {
        this.menuService = _menuService;
    }

    @GetMapping("/menu/all")
    public List<Menu> getAll(Model model, Authentication authentication) {
        return menuService.findAll();
    }

    @GetMapping("/menu/get")
    public Menu get(@RequestParam(name = "id") Long id,Model model, Authentication authentication) {
        return menuService.findById(id);
    }
    @PostMapping("/menu/add")

    public void add(@RequestBody Menu menu, Model model, Authentication authentication) {
         menuService.save(menu);
    }
    @PostMapping("/menu/update")
    public void update(@RequestBody Menu menu, Model model, Authentication authentication) {
         menuService.save(menu);
    }
    @DeleteMapping("/menu/delete")
    public void delete(@RequestParam(name = "id") Long id,Model model, Authentication authentication) {
         menuService.delete(id);
    }
}
