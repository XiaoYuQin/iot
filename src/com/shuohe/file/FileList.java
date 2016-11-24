package com.shuohe.file;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.shuohe.util.Json;

public class FileList {

	public Map<String, String> getFileListObject()
	{		
		// 获取上传文件的目录
		String uploadFilePath = ServletActionContext.getServletContext().getRealPath("/WEB-INF/upload");
		System.out.println("uploadFilePath = "+uploadFilePath);
        // 存储要下载的文件名
        Map<String, String> fileNameMap = new HashMap<String, String>();
        // 递归遍历filepath目录下的所有文件和目录，将文件的文件名存储到map集合中
        listFile(new File(uploadFilePath), fileNameMap);// File既可以代表一个文件也可以代表一个目录
        // 将Map集合发送到listfile.jsp页面进行显示
		return fileNameMap;
	}
	public static String getFileList()
	{		
		// 获取上传文件的目录
		String uploadFilePath = ServletActionContext.getServletContext().getRealPath("/WEB-INF/upload");
		System.out.println("uploadFilePath = "+uploadFilePath);
        // 存储要下载的文件名
        Map<String, String> fileNameMap = new HashMap<String, String>();
        // 递归遍历filepath目录下的所有文件和目录，将文件的文件名存储到map集合中
        listFile(new File(uploadFilePath), fileNameMap);// File既可以代表一个文件也可以代表一个目录
        // 将Map集合发送到listfile.jsp页面进行显示
        String ret = Json.toJsonByPretty(fileNameMap);
		return ret;
	}
	 /**
     * 递归遍历指定目录下的所有文件
     * @param file
     * @param map
     */
    public static void listFile(File file, Map<String, String> map) {
        
        if(file == null) return;
        
        // 如果file代表的不是一个文件，而是一个目录
        if (!file.isFile()) {
            // 列出该目录下的所有文件和目录
            File files[] = file.listFiles();
            if(files == null) return;
            // 遍历files[]数组
            for (File f : files) {
                // 递归
                listFile(f, map);
            }
        } else {
            String realName = file.getName().substring(file.getName().indexOf("_") + 1);
            // file.getName()得到的是文件的原始名称，这个名称是唯一的，因此可以作为key，realName是处理过后的名称，有可能会重复
//            System.out.println("realName = "+realName);
            map.put(file.getName(), realName);
        }
    }
}
