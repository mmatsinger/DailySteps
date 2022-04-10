import Toybox.Activity;
import Toybox.Lang;
import Toybox.Time;
import Toybox.WatchUi;

/*
class DailyStepsView extends WatchUi.SimpleDataField {

    // Set the label of the data field here.
    function initialize() {
        SimpleDataField.initialize();
        label = "My Label";
    }

    // The given info object contains all the current workout
    // information. Calculate a value and return it in this method.
    // Note that compute() and onUpdate() are asynchronous, and there is no
    // guarantee that compute() will be called before onUpdate().
    function compute(info as Activity.Info) as Numeric or Duration or String or Null {
        // See Activity.Info in the documentation for available information.
        return 0.0;
    }

}
*/
using Toybox.WatchUi as Ui;

class DailyStepsView extends Ui.SimpleDataField 
{
	// member variables
	hidden var fitContributor = null;

    // Set the label of the data field here.
    function initialize() {
        SimpleDataField.initialize();
        fitContributor = new FitContributor(self);
        label = Ui.loadResource( Rez.Strings.label );
    }

	function onStart(app, state) {
        fitContributor.onStart(app);
    }

    function onStop(app, state) {
        fitContributor.onStop(app);
    }

    // Return number of steps. 
    function compute(info) {
        return fitContributor.compute();
    }
    
    function onTimerStart() {
    	fitContributor.onActivityStart();
    }
    
    function onTimerStop() {
    	fitContributor.onActivityStop();
    }
    
    function onTimerResume() {
    	fitContributor.onActivityStart();
    }
    
    function onTimerPause() {
    	fitContributor.onActivityStop();
    }
    
    function onTimerLap() {
    	fitContributor.onTimerLap();
    }
	
	function onTimerReset() {
    	fitContributor.onTimerReset();
    }
    
    function onNextMultisportLeg() {
    	fitContributor.onTimerReset();
    }
}