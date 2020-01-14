const {Before, AfterAll} = require('cucumber');
const suitest = require('suitest-js-api');

Before(async () => {
	// Before each scenario - start new Suitest test
	// We do not need a unique id, it's not used with Cucumber
	await suitest.startTest('Suitest test');
});

AfterAll(async () => {
	// Let Suitest know that we ended our testing, so that it kill connection to server and process could end naturally
	await suitest.closeSession();
});
