package com.shuohe.file;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.shuohe.util.Json;

public class FileList {

	public Map<String, String> getFileListObject()
	{		
		// ��ȡ�ϴ��ļ���Ŀ¼
		String uploadFilePath = ServletActionContext.getServletContext().getRealPath("/WEB-INF/upload");
		System.out.println("uploadFilePath = "+uploadFilePath);
        // �洢Ҫ���ص��ļ���
        Map<String, String> fileNameMap = new HashMap<String, String>();
        // �ݹ����filepathĿ¼�µ������ļ���Ŀ¼�����ļ����ļ����洢��map������
        listFile(new File(uploadFilePath), fileNameMap);// File�ȿ��Դ���һ���ļ�Ҳ���Դ���һ��Ŀ¼
        // ��Map���Ϸ��͵�listfile.jspҳ�������ʾ
		return fileNameMap;
	}
	public static String getFileList()
	{		
		// ��ȡ�ϴ��ļ���Ŀ¼
		String uploadFilePath = ServletActionContext.getServletContext().getRealPath("/WEB-INF/upload");
		System.out.println("uploadFilePath = "+uploadFilePath);
        // �洢Ҫ���ص��ļ���
        Map<String, String> fileNameMap = new HashMap<String, String>();
        // �ݹ����filepathĿ¼�µ������ļ���Ŀ¼�����ļ����ļ����洢��map������
        listFile(new File(uploadFilePath), fileNameMap);// File�ȿ��Դ���һ���ļ�Ҳ���Դ���һ��Ŀ¼
        // ��Map���Ϸ��͵�listfile.jspҳ�������ʾ
        String ret = Json.toJsonByPretty(fileNameMap);
		return ret;
	}
	 /**
     * �ݹ����ָ��Ŀ¼�µ������ļ�
     * @param file
     * @param map
     */
    public static void listFile(File file, Map<String, String> map) {
        
        if(file == null) return;
        
        // ���file����Ĳ���һ���ļ�������һ��Ŀ¼
        if (!file.isFile()) {
            // �г���Ŀ¼�µ������ļ���Ŀ¼
            File files[] = file.listFiles();
            if(files == null) return;
            // ����files[]����
            for (File f : files) {
                // �ݹ�
                listFile(f, map);
            }
        } else {
            String realName = file.getName().substring(file.getName().indexOf("_") + 1);
            // file.getName()�õ������ļ���ԭʼ���ƣ����������Ψһ�ģ���˿�����Ϊkey��realName�Ǵ����������ƣ��п��ܻ��ظ�
//            System.out.println("realName = "+realName);
            map.put(file.getName(), realName);
        }
    }
}
