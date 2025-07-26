public class TriggerControl {
    public static Boolean bypassAccountTrigger = false;
    private static Boolean hasRun = false;

    public static Boolean isFirstRun() {
        if (!hasRun) {
            hasRun = true;
            return true;
        }
        return false;
    }
}