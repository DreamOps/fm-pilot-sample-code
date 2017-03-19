/* Encapsulates logic needed by other components to activate and enable features. 
 */
public class FeatureConsoleAPI
{

    /* Checks to see if this customer is part of the pilot program.
     * New Price Optimizer is a pilot feature that we are piloting with select subscribers. 
     */
    public static boolean isNewPriceOptimizerActivated()
    {
        return System.checkPackageBooleanValue('price_optimizer_permitted');
    }

    /* Checks to see if the subscriber’s Salesforce admin has enabled the feature.
     */
    public static boolean isNewPriceOptimizerEnabled()
    {
        return System.checkPackageBooleanValue('price_optimizer_enabled');
    }

    /* Enables the feature. 
     * Before enablement, the Subscriber's Admin needs to activate the feature through the FeatureConsole 
     * Visualforce page -AND- the feature must be activated through the LMO.
     * Here we use a two-step process whereby we activate the permission (price_optimizer_permitted) 
     * from the LMO and subsequently the Subscriber's Admin enables the feature (price_optimizer_enabled).
     */
    public static void enableNewPriceOptimizerEngine()
    {
        if (!System.checkPackageBooleanValue('price_optimizer_permitted'))
        {
            // TODO: throw exception
        }
        else {
            // Unprotects the related custom permission so that it can be assigned to users.
            // This method gates visibility or usage of features.
            System.changeProtection('can_run_new_price_optimizer', 'CustomPermission','Unprotected');
    
            // Unprotects the related custom object that is required for this feature.
            System.changeProtection('new_price_optimizer_entity__c', 'CustomObject','Unprotected');
    
            // Enables the feature.
            System.setPackageBooleanValue('price_optimizer_enabled', true);
        }
    }

    public static void disableNewPriceOptimizerEngine()
    {
        System.changeProtection('can_run_new_price_optimizer', 'CustomPermission','Protected');
        System.setPackageBooleanValue('price_optimizer_enabled', false);
    }
    
    public @future static void updateRecordCount(integer newCount)
    {
        System.setPackageIntegerValue('num_of_price_optimizer_runs', newCount);
    }
}