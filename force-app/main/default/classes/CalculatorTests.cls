@istest
public class CalculatorTests {
@isTest
static  void testDivideByZero()
{
    try {
    Test.startTest();
    Calculator.divide(1,0);
    Test.stopTest();
    }
   catch (Calculator.CalculatorException ex) {
            System.assertEquals('You still can\'t divide by zero', ex.getMessage());
        }
        Test.stopTest();

}
}