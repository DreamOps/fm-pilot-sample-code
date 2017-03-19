public class FeatureConsoleController
{
    public List<Feature> features;
    
    public FeatureConsoleController()
    {
        features = new List<Feature>();
        String name = 'Price Optimizer Enabled';
        Feature f = new Feature(FeatureConsoleAPI.isNewPriceOptimizerActivated(),
                                FeatureConsoleAPI.isNewPriceOptimizerEnabled(), name);
        features.add(f);
    }
 
    public class Feature
    {
        public Boolean activated {get; set;}
        public Boolean enabled {get; set;}
        public String name{get;set;}
        public Feature(boolean activated, boolean enabled, String name)
        {
            this.activated = activated;
            this.enabled = enabled;
            this.name = name;
        }
    }
	
    public List<Feature> getFeatures()
 	{
 		return features;
 	}

    public void save()
 	{
 		for (Feature feature : features)
 		{
 			if (feature.name.equals('Price Optimizer Enabled'))
 			{
                if (feature.enabled)
                {
                    FeatureConsoleAPI.enableNewPriceOptimizerEngine();
                }
                else
                {
                    FeatureConsoleAPI.disableNewPriceOptimizerEngine();
                }
 			}
 		}
 	}
}