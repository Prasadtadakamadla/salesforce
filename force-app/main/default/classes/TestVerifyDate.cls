@isTest
public class TestVerifyDate {
    @TestVisible
    private static void CheckDates() {
       VerifyDate.CheckDates(Date.newInstance(2024, 3, 26),Date.newInstance(2024, 3, 1));
    }
}