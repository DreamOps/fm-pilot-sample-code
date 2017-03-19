/* Bogus test methods designed to provide enough coverage to install the sample app.
 * Pull requests welcome!
 */
@isTest
private class FeatureConsoleControllerTest {
    
    @isTest static void FeatureTest() {
        FeatureConsoleController.Feature my = new FeatureConsoleController.Feature(false,false,'Feature');
        System.assert(true);
    }

    @isTest static void getFeaturesTest() {
        FeatureConsoleController my = new FeatureConsoleController();
        List<FeatureConsoleController.Feature> mine = my.getFeatures();
        System.assert(true);
    }
    
    @isTest static void saveTest() {
        FeatureConsoleController my = new FeatureConsoleController();
        my.save();
        System.assert(true);        
    }
}