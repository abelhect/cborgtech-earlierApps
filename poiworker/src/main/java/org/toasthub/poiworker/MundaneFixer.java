package org.toasthub.poiworker;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

public class MundaneFixer {

	public static void main(String[] args) {
		try {
		// the test file is in src/main/resources  copy it to your directory
	    InputStream inp = new FileInputStream("/Users/abelhectMACHOME/Documents/inpoi.xlsx");
	    //InputStream inp = new FileInputStream("workbook.xlsx");

	    // get the workbook
	    Workbook wb = WorkbookFactory.create(inp);
		
	    // get the sheet you want
	    Sheet sheet = wb.getSheetAt(0);
	    Sheet sheetTwo = wb.getSheetAt(1);
	    
	    // get the row you want
	    Row row = sheet.getRow(2);
	    Row rowOneSheetTwo = sheetTwo.getRow(1);
	    Row rowCeroSheetTwo = sheetTwo.getRow(0);
	    
	    // get the cell you want
	    Cell cell1 = row.getCell(1);
	    Cell cell2 = row.getCell(2);
	    Cell cell3 = null;
	    Cell cell1SheetTwo = rowOneSheetTwo.getCell(1);
	    Cell cell2SheetTwo = rowOneSheetTwo.getCell(2);
	    Cell cell3SheetTwo = rowOneSheetTwo.getCell(3);
	    Cell cell4SheetTwo = null;
	    Cell cell4RowCeroSheetTwo = null;
	    
	    if (cell1 != null && cell2 != null){
	    	// add them
	    	double total = cell1.getNumericCellValue() + cell2.getNumericCellValue();
	    	cell3 = row.createCell(3);
	    	cell3.setCellType(Cell.CELL_TYPE_STRING);
	 	    cell3.setCellValue(Double.toString(total));
	    }
	    //For the second sheet
	    if (cell1SheetTwo != null && cell2SheetTwo != null && cell3SheetTwo != null){
	    	// add them
	    	double totalTwo = cell1SheetTwo.getNumericCellValue() + cell2SheetTwo.getNumericCellValue()
	    	+ cell3SheetTwo.getNumericCellValue();
	    	cell4SheetTwo = rowOneSheetTwo.createCell(4);
	    	cell4RowCeroSheetTwo = rowCeroSheetTwo.createCell(4);
	    	cell4SheetTwo.setCellType(Cell.CELL_TYPE_STRING);
	 	    cell4SheetTwo.setCellValue(Double.toString(totalTwo));
	 	    cell4RowCeroSheetTwo.setCellType(Cell.CELL_TYPE_STRING);
	 	    cell4RowCeroSheetTwo.setCellValue("g1 + g2 + g3");
	    }
	   
	    // Write the output to a file
	    FileOutputStream fileOut = new FileOutputStream("/Users/abelhectMACHOME/Documents/outpoi.xlsx");
	    wb.write(fileOut);
	    fileOut.close();
	    
		} catch (InvalidFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
