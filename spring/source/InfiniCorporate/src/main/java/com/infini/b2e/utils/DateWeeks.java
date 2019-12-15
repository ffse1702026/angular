package com.infini.b2e.utils;

public enum DateWeeks {
    月(2),
    火(3),
    水(4),
    木(5),
    金(6),
    土(7),
    日(1);
    private int date;
    public int getDate() {
        return this.date;
    }
    
    
    private DateWeeks(int date) {
        this.date = date;
    }   
    public static DateWeeks create(int date) throws Exception {
        for(DateWeeks DateValue : DateWeeks.values() ) {
            if(DateValue.date == date) {
                return DateValue;
            }
        }
        throw new Exception("cannot create" );
    }
}
