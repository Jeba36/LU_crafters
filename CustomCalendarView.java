package com.example.project01;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.util.AttributeSet;
import android.widget.CalendarView;

import java.util.Calendar;
import java.util.HashSet;

public class CustomCalendarView extends CalendarView {

    private HashSet<String> taskDates = new HashSet<>();
    private Paint paint = new Paint();

    public CustomCalendarView(Context context, AttributeSet attrs) {
        super(context, attrs);
        paint.setStyle(Paint.Style.FILL);
        paint.setColor(Color.BLUE);
        setFirstDayOfWeek(Calendar.MONDAY);
    }

    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        for (String date : taskDates) {
            String[] parts = date.split("/");
            int year = Integer.parseInt(parts[0]);
            int month = Integer.parseInt(parts[1]) - 1; // Month is 0-based in Calendar
            int day = Integer.parseInt(parts[2]);

            drawDotForDate(canvas, year, month, day);
        }
    }

    public void setTaskDates(HashSet<String> taskDates) {
        this.taskDates = taskDates;
        invalidate();
    }

    private void drawDotForDate(Canvas canvas, int year, int month, int day) {
        Calendar calendar = Calendar.getInstance();
        calendar.set(year, month, day);

        // Get the day of the week (1-based index, where Sunday is 1, Saturday is 7)
        int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);

        // Get the week of the month (1-based index)
        int weekOfMonth = calendar.get(Calendar.WEEK_OF_MONTH);

        // Calculate the x and y coordinates for the dot
        float cellWidth = getWidth() / 7;
        float cellHeight = getHeight() / 6;

        float x = cellWidth * (dayOfWeek - 1) + cellWidth / 2;
        float y = cellHeight * (weekOfMonth - 1) + cellHeight / 2;

        // Draw the dot on the date
        canvas.drawCircle(x, y, 10, paint); // Adjust the radius and paint as needed
    }
}
