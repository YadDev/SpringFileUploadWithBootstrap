package co.dev.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import co.dev.form.Product;
import co.dev.service.LoadDataService;


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
    
    @RequestMapping("/download/{imgName}")
    public void doDownload(HttpServletRequest request,HttpServletResponse response,@PathVariable String imgName)throws IOException{
    	String fileName=request.getServletContext().getRealPath("/image/"+imgName+".jpg");
    	File downloadFile = new File(fileName);
    	System.out.println("Complete File Path to download "+fileName);
        FileInputStream inputStream = new FileInputStream(downloadFile);
        String mimeType = request.getServletContext().getMimeType(fileName);
        System.out.println("MIME type: " + mimeType);
        // set content attributes for the response
        response.setContentType(mimeType);
        response.setContentLength((int) downloadFile.length());
        
     // set headers for the response
        String headerKey = "Content-Disposition"; 
        String headerValue = String.format("attachment; filename=\"%s\"",
                downloadFile.getName());
        response.setHeader(headerKey, headerValue);
        
        // get output stream of the response
        OutputStream outStream = response.getOutputStream();
 
        byte[] buffer = new byte[4096];
        int bytesRead = -1;
 
        // write bytes read from the input stream into the output stream
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            outStream.write(buffer, 0, bytesRead);
        }
 
        inputStream.close();
        outStream.close();
 
    }
    //Pagination Demo
    
    @RequestMapping("/pagination")
    public  String home(Model model) throws JsonGenerationException, JsonMappingException, IOException {

		//LoadDataService dataService = new LoadDataService();
		ObjectMapper mapper = new ObjectMapper();
		System.out.println("Data :" +mapper.writeValueAsString(LoadDataService.getEmployeeList()));
		 Gson gson = new Gson();
		String aData = gson.toJson(LoadDataService.getEmployeeList());

         System.out.println("Email Status" + aData);
         model.addAttribute("employeeList", aData);
//		model.addAttribute("employeeList", mapper.writeValueAsString(LoadDataService.getEmployeeList()));
		return "body";

	}

}