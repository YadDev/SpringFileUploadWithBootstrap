package co.dev.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import co.dev.form.Product;


@Controller
public class ProductImageController 
{
    @RequestMapping("/save-product")
    public String uploadResources( HttpServletRequest servletRequest, 
                                 @ModelAttribute Product product,
                                 Model model) 
    {
        //Get the uploaded files and store them
        List<MultipartFile> files = product.getImages();
        List<String> fileNames = new ArrayList<String>();
        if (null != files && files.size() > 0) 
        {
            for (MultipartFile multipartFile : files) {
 
                String fileName = multipartFile.getOriginalFilename();
                fileNames.add(fileName);
                System.out.println("Uploaded Location is: "+servletRequest.getServletContext().getRealPath("/image"));
                File imageFile = new File(servletRequest.getServletContext().getRealPath("/image"), fileName);
                try
                {
                    multipartFile.transferTo(imageFile);
                    System.out.println("Transfer Successfully");
                } catch (IOException e) 
                {
                    e.printStackTrace();
                }
            }
        }
 
        System.out.println("Product Name:"+product.getName());
        System.out.println("Product Desc:"+product.getDescription());
        // Here, you can save the product details in database
         
        model.addAttribute("product", product);
        return "viewProductDetail";
    }
     
    @RequestMapping("/index")
	public ModelAndView getLogin(@ModelAttribute("product") Product product,
			BindingResult res) {
		System.out.println("");
		return new ModelAndView("productForm");

	}
}