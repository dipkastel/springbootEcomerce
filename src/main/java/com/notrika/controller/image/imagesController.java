package com.notrika.controller.image;

import com.notrika.entity.tables.ImageGallery;
import com.notrika.service.ImageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Optional;


@Controller
@RequestMapping("/image")
public class imagesController {
    private static final Logger LOGGER = LoggerFactory.getLogger(imagesController.class);

    private final ImageService imageService;
    @Autowired
    public imagesController(ImageService _imageService) {
        this.imageService = _imageService;
    }



    @GetMapping({"/display/{id}"})
    @ResponseBody
    public void getImage(@PathVariable("id") Long id, @RequestParam("h") Optional<Integer> iheight, @RequestParam("w") Optional<Integer> iwidth, @RequestParam("q") Optional<Integer> iquality, HttpServletResponse response) throws IOException {
        int height = iheight.orElse(0);
        int width = iwidth.orElse(0);
        int quality = iquality.orElse(100);
        ImageGallery image = imageService.findById(id);
        String type = "image/jpeg, image/jpg, image/png, image/gif";
        response.setContentType(type);
        if (image.getImage()!=null) {
            byte[] responceImage = image.getImage();
            if(width>0||height>0)
                responceImage = scale(responceImage,width,height,quality);
            response.getOutputStream().write(responceImage);
        }
        response.getOutputStream().close();
    }
    public byte[] scale(byte[] fileData, int width, int height,int quality) {
        ByteArrayInputStream in = new ByteArrayInputStream(fileData);
        try {
            BufferedImage img = ImageIO.read(in);
            if(height == 0) {
                height = (width * img.getHeight())/ img.getWidth();
            }
            if(width == 0) {
                width = (height * img.getWidth())/ img.getHeight();
            }
            Image scaledImage = img.getScaledInstance(width, height, Image.SCALE_SMOOTH);
            BufferedImage imageBuff = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
            imageBuff.getGraphics().drawImage(scaledImage, 0, 0, new Color(0,0,0), null);

            ByteArrayOutputStream buffer = new ByteArrayOutputStream();

            ImageIO.write(imageBuff, "jpg", buffer);

            return buffer.toByteArray();
        } catch (IOException e) {
            return null;
        }
    }

}
