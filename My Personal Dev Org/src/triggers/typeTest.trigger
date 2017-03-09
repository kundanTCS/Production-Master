trigger typeTest on Account (before insert, before update) 
{
    Account a = Trigger.New[0];
    if(a.Type == null)
    {
        //string s = System.Label.Test_Label;
        a.Type.addError(System.Label.Test_Label);
    }
}