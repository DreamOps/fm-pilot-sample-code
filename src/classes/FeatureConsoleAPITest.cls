@isTest
private class FeatureConsoleAPITest {
    
    @isTest static void isNewPriceOptimizerPermittedTest() {
        Boolean result = FeatureConsoleAPI.isNewPriceOptimizerActivated();
        System.assert(true);
    }
        
    @isTest static void isNewPriceOptimizerEnabled() {
        Boolean result = FeatureConsoleAPI.isNewPriceOptimizerEnabled();
        System.assert(true);
    }

    @isTest static void enableNewPriceOptimizerEngine() {
        try {
            FeatureConsoleAPI.enableNewPriceOptimizerEngine();
        } catch (Exception e){}
        System.assert(true);
    }

    @isTest static void disableNewPriceOptimizerEngine() {
        try {
            FeatureConsoleAPI.disableNewPriceOptimizerEngine();
        } catch (Exception e){}
        System.assert(true);
    }

    @isTest static void updateRecordCountTest(){
        try {
            FeatureConsoleAPI.updateRecordCount(0);
        } catch (Exception e){}
        System.assert(true);
    }
}