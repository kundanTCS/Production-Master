public class documentExt {
    public documentExt(ApexPages.StandardController controller) {
    Attachment d = (Attachment) controller.getRecord();
    Contact c = [Select id, name from Contact where name =: 'abc' limit 1];
    //d.folderid = UserInfo.getUserId(); //this puts it in My Personal Documents
    d.ParentId = c.Id;
    //insert d;
    }
}