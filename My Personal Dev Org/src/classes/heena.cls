public class heena 
{

    public String adValue { get {return adValue ;} set{ adValue = value ;} }
    public String listingTypeValue{ get {return listingTypeValue;} set{ listingTypeValue= value ;} }
    public String fontValue{ get {return fontValue;} set{ fontValue= value ;} }
    public String colorValue{ get {return colorValue;} set{ colorValue= value ;} }    
    
    public List<SelectOption> getadType()
    {
        List<SelectOption> dl = new List<SelectOption>();
            dl.add(new SelectOption('Listing','Listing11'));
            dl.add(new SelectOption('InColumnSpace','In Column Space'));
            dl.add(new SelectOption('Display','Display'));
            dl.add(new SelectOption('Trade','Trade'));            
            dl.add(new SelectOption('Cover','Cover'));
            dl.add(new SelectOption('Tab','Tab'));            
            dl.add(new SelectOption('WhitePages','White Pages'));  
                        
            return dl ;
    }

    public List<SelectOption> getlistingType()
    {
        List<SelectOption> dl1 = new List<SelectOption>();
            dl1.add(new SelectOption('Main','Main'));
            dl1.add(new SelectOption('Anchor','Anchor'));
            dl1.add(new SelectOption('ExtraLine','Extra Line'));
            dl1.add(new SelectOption('AlternateCall','Alternate Call'));            
            dl1.add(new SelectOption('CrossReference','Cross Reference'));
                        
            return dl1 ;
    }

    public List<SelectOption> getfontList()
    {
        List<SelectOption> dl2 = new List<SelectOption>();
            dl2.add(new SelectOption('Regular','Regular'));
            dl2.add(new SelectOption('SemiBold','Semi Bold'));
            dl2.add(new SelectOption('Bold','Bold'));
            dl2.add(new SelectOption('Super Bold','Super Bold'));            
                         
            return dl2 ;
    }

    public List<SelectOption> getcolorList()
    {
        List<SelectOption> dl3 = new List<SelectOption>();
            dl3.add(new SelectOption('Red','Red'));

            return dl3 ;
    }

}