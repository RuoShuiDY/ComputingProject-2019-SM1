package com.txg.project.utils;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.txg.project.domain.Mark;
import com.txg.project.domain.Student;
import com.txg.project.domain.TutorAssignment;

public class ExcelUtils {
	public List<Student> getExcelStudent(String fileName) throws FileNotFoundException, IOException{
		XSSFWorkbook xssfWorkbook = new XSSFWorkbook(new FileInputStream(fileName));
        XSSFSheet sheet = xssfWorkbook.getSheetAt(0);
        int lastRowNum = sheet.getLastRowNum();
        ArrayList<Student> list = new ArrayList<Student>();
        for (int i = 1; i <= lastRowNum; i++) {//遍历每一行
            XSSFRow row = sheet.getRow(i);
            Student student = new Student();
            student.setStudentId((int)row.getCell(0).getNumericCellValue());
            student.setStudentSurname(row.getCell(1).getStringCellValue());
            student.setStudentGivenname(row.getCell(2).getStringCellValue());
            student.setStudentEmail(row.getCell(3).getStringCellValue());
            student.setStudentUsername(row.getCell(4).getStringCellValue());
            list.add(student);
        }
		return list;
	}

	public List<Mark> getExcelMark(String fileName, Integer tutorAssignmentId) throws FileNotFoundException, IOException{
		XSSFWorkbook xssfWorkbook = new XSSFWorkbook(new FileInputStream(fileName));
        XSSFSheet sheet = xssfWorkbook.getSheetAt(0);
        int lastRowNum = sheet.getLastRowNum();
        ArrayList<Mark> list = new ArrayList<Mark>();
        for (int i = 1; i <= lastRowNum; i++) {//遍历每一行
            XSSFRow row = sheet.getRow(i);
            Mark mark = new Mark();
            Student student = new Student();
            TutorAssignment tutorAssignment = new TutorAssignment();
            
            student.setStudentId((Integer.parseInt(row.getCell(0).getStringCellValue())));
            mark.setComment(row.getCell(5).getStringCellValue());
            mark.setMarks((float) row.getCell(6).getNumericCellValue());
            mark.setMaxMark((float) row.getCell(7).getNumericCellValue());
            
            tutorAssignment.setTutorAssignmentId(tutorAssignmentId);
            
            mark.setTutorAssignment(tutorAssignment);
            mark.setStudent(student);
            
            list.add(mark);
        }
		return list;
	}
	
	public void createExcel(String fileDir,String sheetName,
			String titleRow[], List<List<String>> content) throws Exception{  
        //创建workbook  
        XSSFWorkbook workbook = new XSSFWorkbook();  
        //添加Worksheet（不添加sheet时生成的xls文件打开时会报错)  
        XSSFSheet sheet1 = workbook.createSheet(sheetName);    
        //新建文件  
        FileOutputStream out = null;  
        try {  
            //添加表头  
            XSSFRow row = workbook.getSheet(sheetName).createRow(0);    //创建第一行    
            for(short i = 0;i < titleRow.length;i++){  
                XSSFCell cell = row.createCell(i);  
                cell.setCellValue(titleRow[i]);  
            }  
            for(int i=0;i<content.size();i++) { 
            	List<String> c = content.get(i); 
            	XSSFRow row1 = sheet1.createRow(i + 1); 
            	for(int j=0;j<c.size();j++) { 
            		//创建单元格设值 
            		row1.createCell(j).setCellValue(c.get(j)); 
            	} 
            }

            out = new FileOutputStream(fileDir);  
            workbook.write(out);  
        } catch (Exception e) {  
            throw e;
        } finally {    
            try {    
                out.close();    
            } catch (IOException e) {    
                e.printStackTrace();  
            }    
        }    
    }  

    
}
