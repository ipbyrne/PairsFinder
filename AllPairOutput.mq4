#property strict
#property indicator_chart_window

input int timeFrame = 0;
input int sample = 3000;

bool loaded = false;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
//---
   if(loaded) {return(0);}
   int file_handle=FileOpen("Statistics"+"//"+"AllPairOutput.txt",FILE_READ|FILE_WRITE|FILE_CSV|FILE_ANSI);
   if(file_handle!=INVALID_HANDLE)
     {
      PrintFormat("%s file is available for writing","AllPairOutput.txt");
      PrintFormat("File path: %s\\Files\\",TerminalInfoString(TERMINAL_DATA_PATH));

      string strData="";
      
      int x = sample;
      while(x > 0)
         {
         strData += DoubleToStr(iClose("AUDCAD",timeFrame,x),5) + "," + // 1
            DoubleToStr(iClose("AUDCHF",timeFrame,x),5) + "," + // 2
            DoubleToStr(iClose("AUDJPY",timeFrame,x),5) + "," + // 3
            DoubleToStr(iClose("AUDNZD",timeFrame,x),5) + "," + // 4
            DoubleToStr(iClose("AUDUSD",timeFrame,x),5) + "," + // 5
            DoubleToStr(iClose("CADCHF",timeFrame,x),5) + "," + // 6
            DoubleToStr(iClose("CADJPY",timeFrame,x),5) + "," + // 7
            DoubleToStr(iClose("CHFJPY",timeFrame,x),5) + "," + // 8
            DoubleToStr(iClose("EURAUD",timeFrame,x),5) + "," + // 9
            DoubleToStr(iClose("EURCAD",timeFrame,x),5) + "," + // 10
            DoubleToStr(iClose("EURCHF",timeFrame,x),5) + "," + // 11
            DoubleToStr(iClose("EURGBP",timeFrame,x),5) + "," + // 12
            DoubleToStr(iClose("EURJPY",timeFrame,x),5) + "," + // 13
            DoubleToStr(iClose("EURNZD",timeFrame,x),5) + "," + // 14
            DoubleToStr(iClose("EURUSD",timeFrame,x),5) + "," + // 15
            DoubleToStr(iClose("GBPAUD",timeFrame,x),5) + "," + // 16
            DoubleToStr(iClose("GBPCAD",timeFrame,x),5) + "," + // 17
            DoubleToStr(iClose("GBPCHF",timeFrame,x),5) + "," + // 18
            DoubleToStr(iClose("GBPJPY",timeFrame,x),5) + "," + // 19
            DoubleToStr(iClose("GBPNZD",timeFrame,x),5) + "," + // 20
            DoubleToStr(iClose("GBPUSD",timeFrame,x),5) + "," + // 21
            DoubleToStr(iClose("NZDCAD",timeFrame,x),5) + "," + // 22
            DoubleToStr(iClose("NZDCHF",timeFrame,x),5) + "," + // 23
            DoubleToStr(iClose("NZDJPY",timeFrame,x),5) + "," + // 24
            DoubleToStr(iClose("NZDUSD",timeFrame,x),5) + "," + // 25
            DoubleToStr(iClose("USDCAD",timeFrame,x),5) + "," + // 26
            DoubleToStr(iClose("USDCHF",timeFrame,x),5) + "," + // 27
            DoubleToStr(iClose("USDJPY",timeFrame,x),5) + "\n"; // 28
         x--;
         }

      FileWriteString(file_handle,strData);

      //--- close the file
      FileClose(file_handle);
      PrintFormat("Data is written, %s file is closed","AllPairOutput.txt");
      
      return(true);
     }
   else
     {
      PrintFormat("Failed to open %s file, Error code = %d","AllPairOutput.txt",GetLastError());
      return(false);
     }
   loaded = true;
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
