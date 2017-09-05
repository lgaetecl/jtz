import java.util.*;
import java.text.*;
import java.text.SimpleDateFormat;

public class PrintDate
{
        public static void main(String args[])
        {
           String days = args.length == 0 ? "0" : args[0];
           Date now = new Date();
           Calendar cal = Calendar.getInstance();
           System.out.println("\nTIME ZONE\t\t\t: " + cal.getTimeZone().getID()+"\n");
           long nowLong = now.getTime();
           cal.add(Calendar.DATE, Integer.parseInt(days));
           String s = now.toString();
           SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss zzzz Z");
           Calendar cal1 = Calendar.getInstance();
           SimpleDateFormat df2 = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss zzzz Z");
           System.out.println("Date and time today \t\t: " + df2.format(cal1.getTime()));
           System.out.println("Date and time in " + days + " days \t: " + (df.format(cal.getTime()))+"\n");
        }
}
