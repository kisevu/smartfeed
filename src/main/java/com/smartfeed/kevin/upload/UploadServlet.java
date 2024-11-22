package com.smartfeed.kevin.upload;
/*
*
@author ameda
@project SmartFeed
*
*/

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/secure/upload")
public class UploadServlet extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "C:/Users/ameda/Downloads/smartfeed/SmartFeed/images"; //Absolute path
    private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3;  // 3 MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 50;  // 50 MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 100;  // 100 MB

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        if (!ServletFileUpload.isMultipartContent(request)) {
            PrintWriter writer = response.getWriter();
            writer.println("Error: Form must have enctype=multipart/form-data.");
            writer.flush();
            return;
        }

        // Create a file upload factory and upload handler
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));;

        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setFileSizeMax(MAX_FILE_SIZE);
        upload.setSizeMax(MAX_REQUEST_SIZE);


        // Fix the path to save files within the images folder
        String uploadPath = UPLOAD_DIRECTORY; //specified in the absolutePath

        // Create the directory if it doesn't exist
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        try {
            // Parse the request to get file items
            List<FileItem> formItems = upload.parseRequest(request);
            for (FileItem item : formItems) {
                if (!item.isFormField()) {
                    String fileName = new File(item.getName()).getName();
                    String filePath = uploadPath + File.separator + fileName;

                    // Save the file on the server
                    File storeFile = new File(filePath);
                    item.write(storeFile);

                    // Send a success message
                    response.getWriter().println("Upload has been done successfully!");
                    response.getWriter().println("File path: " + filePath);
                    response.sendRedirect("dashboard.jsp");
                }
            }
        } catch (Exception ex) {
            response.getWriter().println("Error: " + ex.getMessage());
        }
    }
}
