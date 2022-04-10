import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

/*
class DailyStepsApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        return [ new DailyStepsView() ] as Array<Views or InputDelegates>;
    }

}

function getApp() as DailyStepsApp {
    return Application.getApp() as DailyStepsApp;
}
*/

using Toybox.Application as App;

class DailyStepsApp extends App.AppBase {

	hidden var _DailyStepsView;

	function initialize() {
        AppBase.initialize();
        _DailyStepsView = new DailyStepsView();
    }

    // onStart() is called on application start up
    function onStart(state) {
    	_DailyStepsView.onStart(self, state);
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    	_DailyStepsView.onStop(self, state);
    }

    // Return the initial view of your application here
    function getInitialView() {
        return [ _DailyStepsView ];
    }

}