public class StatusActive {
    public static void Campaigns_statusCheck(List<campaign> Campaigns){
        for(campaign camp:Campaigns){
            if(camp.IsActive== True){
                camp.addError('You cannot delete the active'+camp.name);
            }
        }
    }
}