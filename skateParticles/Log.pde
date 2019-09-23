import java.io.FileWriter;
import java.io.IOException;

boolean logDebug=true;
boolean logConsole=true;

String deb="DEBUG";
String inf="INFORMATION";
String met="METRIC";
String war="WARNING";
String err="ERROR";
String tra="TRACE";

String buta="BUTTON";
String cona="CONFIG";
String dica="DICTIONARY";
String disa="DISPLAY";
String loga="LOGGER";
String paga="PAGE";
String para="PARTICLES";
String tuia="TUIO";
String udpa="UDP";
String tima="TIMER";

String fileName="skateParticlesLog"+year()+logForm(month())+logForm(day())+".txt";

int DEBUG=1;

void setupLog() {
  deLog(inf, loga, "Program start");
  fileName="tuioBridgeLog"+year()+logForm(month())+logForm(day())+".txt";
}

void deLog(String level, String agent, String text) {

  if ((agent.equals("DEBUG"))&&(logDebug==false)) {
    //do not log (only case)
  } else {

    //    File file = new File("tuioBridgeLog.txt");
    File file = new File(fileName);
    FileWriter fr = null;
    try {
      fr = new FileWriter(file, true);
      String conLine=timestamp()+level+","+agent+","+text;
      String logLine=conLine+"\n";
      fr.append(logLine);
      if (logConsole) {
        println(conLine);
      }
    } 
    catch (IOException e) {
      e.printStackTrace();
    } 
    finally {
      try {
        fr.close();
      } 
      catch (IOException e) {
        e.printStackTrace();
      }
    }
  }
}

String timestamp() {
  String output = "";
  output+=year()+"-";
  output+=logForm(month())+"-";
  output+=logForm(day())+"T";
  output+=logForm(hour())+":";
  output+=logForm(minute())+":";
  output+=logForm(second())+".";
  output+=String.format("%03d", (millis()%1000));
  return output+",";
}
String getLevel(int input) {

  String output;
  switch (input) {
  case 1: 
    output="DEBUG"; 
    break;
  case 2: 

    output="INFO"; 
    break;
  case 3: 

    output="WARN"; 
    break;
  case 4: 

    output="ERROR"; 
    break;
  default: 

    output="TRACE"; 
    break;
  }
  return output+",";
}

String logForm(int input) {
  return String.format("%02d", input);
}
