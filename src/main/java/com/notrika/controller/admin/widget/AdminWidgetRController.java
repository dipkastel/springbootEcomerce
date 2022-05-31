package com.notrika.controller.admin.widget;

import com.notrika.entity.ImageGallery;
import com.notrika.entity.Widget;
import com.notrika.service.WidgetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;
import java.util.Locale;

@RestController
@RequestMapping(path = "/api/widget", produces = "application/json", headers = "Accept=*/*")
@CrossOrigin(origins = "*")
public class AdminWidgetRController {


    private final WidgetService widgetserService;

    @Autowired
    public AdminWidgetRController(WidgetService widgetserService) {
        this.widgetserService = widgetserService;
    }

    @GetMapping("/all")
    public List<Widget> getAll(Model model, Authentication authentication) {
        return widgetserService.findAll();
    }

    @GetMapping("/get")
    public Widget get(@RequestParam(name = "id") Long id,Model model, Authentication authentication) {
        return widgetserService.findById(id);
    }

    @PostMapping(value = "/add")
    public void saveBanner(@RequestParam("file") MultipartFile image, Widget widget, Locale locale, Model model, HttpServletRequest request)
            throws IOException {
                ImageGallery imageGallery = new ImageGallery();
                imageGallery.setImage(image.getBytes());
                widget.setImage(imageGallery);
                widgetserService.save(widget);
    }
    @PostMapping("/update")
    public void update(@RequestParam("file") MultipartFile image, Widget widget, Locale locale, Model model, HttpServletRequest request)
            throws IOException {
        ImageGallery imageGallery = new ImageGallery();
        imageGallery.setImage(image.getBytes());
        widget.setImage(imageGallery);
        widgetserService.save(widget);
    }
    @DeleteMapping("/delete")
    public void delete(@RequestParam(name = "id") Long id,Model model, Authentication authentication) {
        widgetserService.delete(id);
    }
}
