package com.linksharing.date


class CustomDate {
    static Date firstDayInWeek(Date day) {
        day.clearTime()
        day - (day.calendarDate.dayOfWeek-1)
    }
    static Date firstDayInMonth(Date day) {
        day.clearTime()
        day - (day.calendarDate.dayOfMonth-1)
    }
    static Date firstDayInYear() {
        Calendar cal =Calendar.getInstance();
        cal.set(Calendar.MONTH,0);
        cal.set(Calendar.DAY_OF_MONTH, 1);
        cal.getTime().clearTime();
    }
}
