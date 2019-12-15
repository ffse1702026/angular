package com.infini.b2e.utils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtils {

    public static int getYearBetweenTwoDate(Date birthday) {
        Calendar today = Calendar.getInstance();
        Calendar birthDate = Calendar.getInstance();
        birthDate.setTime(birthday);
        return today.get(Calendar.YEAR) - birthDate.get(Calendar.YEAR);
    }
    
    public static String getDateTime(Date date) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm"); 
        return dateFormat.format(date);
    }
    
    public static String getWeekDays(Date date) throws Exception {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        return DateWeeks.create(calendar.get(Calendar.DAY_OF_WEEK)).toString();
    }
}
