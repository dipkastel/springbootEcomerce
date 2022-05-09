package com.notrika.controller.image;

import com.notrika.service.ImageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@Controller
@RequestMapping("/image")
public class imagesController {
    private static final Logger LOGGER = LoggerFactory.getLogger(imagesController.class);

    private final ImageService imageService;
    @Autowired
    public imagesController(ImageService _imageService) {
        this.imageService = _imageService;
    }


    @GetMapping("/display/{id}")
    @ResponseBody
    public void showImage(@PathVariable("id") Long id, HttpServletResponse response) throws IOException {
        String contentTypes = "image/jpeg, image/jpg, image/png, image/gif";
        response.setContentType(contentTypes);
        response.getOutputStream().write(imageService.findById(id).getImage());

        response.getOutputStream().close();
    }

}
