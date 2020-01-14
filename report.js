const reporter = require('cucumber-html-reporter');

reporter.generate({
	theme: 'bootstrap',
	jsonFile: 'report/cucumber_report.json',
	output: 'report/cucumber_report.html',
	reportSuiteAsScenarios: true,
	scenarioTimestamp: true,
	launchReport: true,
});
