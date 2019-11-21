package com.zhg.javakc.base.util.excel;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



@Component
public class ImportExcel {
	
	@SuppressWarnings("unused")
//	@Autowired
//	private TestService testService;
	
	/**
	 * 解析Excel文档内容
	 * @param input	文件输入流
	 * @param fileName 文档名称
	 * @throws IOException 
	 */
	public static void read(InputStream input, String fileName) throws IOException
	{
		//1. 获取一个Excel文档
		Workbook book = null;
		if(fileName.endsWith("xlsx"))
		{
			book = new XSSFWorkbook(input);
		}
		else if(fileName.endsWith("xls"))
		{
			book = new HSSFWorkbook(input);
		}
		//2. 获取当前文档中Sheet个数
		int sheetNumber = book.getNumberOfSheets();
		for(int i=0;i<sheetNumber;i++)
		{
			//3. 获取到每个Sheet单元格对象
			Sheet sheet = book.getSheetAt(i);
			//4. 根据Sheet获取当前行数
			int numberRows = sheet.getPhysicalNumberOfRows();
			for(int x=1;x<numberRows;x++)
			{
				//5. 获取每行对象
				Row row = sheet.getRow(x);
//				int cellNum = row.getLastCellNum();
//				for()
//				{
//					
//				}
				//封装对象
				System.out.println(  getValueByCellType(row.getCell(0)) +"  "+ row.getCell(1) +"  "+ row.getCell(2)   +"  "+ row.getCell(3) );
			}
			
		}
	}
	
	/**
	 * 根据单元内数据类型进行判断， 返回相应的值
	 * @param cell
	 * @return
	 */
	public static String getValueByCellType(Cell cell)
	{
		String cellValue = "";
		switch(cell.getCellType())
		{
			case Cell.CELL_TYPE_NUMERIC://数字类型 包含（2018-03-07日期     100.00数字）
				if(
						cell.getCellStyle().getDataFormatString().equals("yyyy/mm/dd")
						||
						cell.getCellStyle().getDataFormatString().equals("m/d/yy")
						||
						cell.getCellStyle().getDataFormatString().equals("mm/dd/yy")
					)
				{
					cellValue = new SimpleDateFormat("yyyy/MM/dd").format( cell.getDateCellValue() );
				}
				else
				{
					cellValue = String.valueOf( cell.getNumericCellValue() );
				}
				break;
			case Cell.CELL_TYPE_STRING:
				cellValue = cell.getStringCellValue();
				break;
			case Cell.CELL_TYPE_BOOLEAN:
				cellValue = String.valueOf( cell.getBooleanCellValue() );
				break;
			case Cell.CELL_TYPE_BLANK:
				cellValue = "";
				break;
		}
		return cellValue;
	}
	
	public static void main(String[] args) {
		File file = new File("C:\\Users\\thinkpad\\Desktop\\excel.xlsx");
		InputStream input = null;
		try {
			input = new FileInputStream(file);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			read(input, file.getName());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
}
