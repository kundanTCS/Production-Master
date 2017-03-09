public class googleChartCon
{

        private String chartData;
        public String getChartData()
        {
            return chartData;
        }

        public googleChartCon()
        {
            Schema.DescribeFieldResult F = Account.Type.getDescribe();
            List<Schema.PicklistEntry> P = F.getPicklistValues();
            List<ChartDataItem> items = new List<ChartDataItem>();

            for(Schema.PicklistEntry pValue : P)
            {
                integer Count = [select count() from Account where Type = :pValue.getValue() limit 10000];
                if (Count > 0)
                    items.add(new ChartDataItem(pValue.getValue()+ '-['+ Count.format() + ']' , Count.format()));
            }

            String chartPath = 'http://chart.apis.google.com/chart?chs=600x200&cht=p3';
            chartData = chartPath +  getChartData(items);
        }

        private String getChartData(List<ChartDataItem> items)
        {
            String chd = ''; // 23,34,56
            String chl = ''; // Hello|World

            for(ChartDataItem citem : items)
            {
                chd += citem.ItemValue + ',';
                chl += citem.Label + '|';
            }
            // remove the last comma or pipe
            chd = chd.substring(0, chd.length() -1);
            chl = chl.substring(0, chl.length() -1);

            String result = '&chd=t:' + chd + '&chl=' + chl;
            return result;
        }

        public class ChartDataItem
        {
            public String ItemValue {get; set;}
            public String Label {get;set;}
        
            public ChartDataItem(String Label, String Value)
            {
                this.Label = Label;
                this.ItemValue = Value;
            }
        }
}