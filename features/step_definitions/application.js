const {Given, Then, When} = require('cucumber');
const nodeAssert = require('assert');
const fetch = require('node-fetch');
const suitest = require('suitest-js-api');
const {assert} = suitest;

const getSelector = require('../support/selectors');
const getTestId = require('../support/testEditorTests');

// How long should we wait for element assertions
const DEFAULT_TIMEOUT = 5000;

/**
 * Helper functions
 */
function isFocused(element) {
	return element.matches(suitest.PROP.CLASS, 'focus', suitest.COMP.CONTAIN);
}

function isSelected(element) {
	return element.matches(suitest.PROP.CLASS, 'active', suitest.COMP.CONTAIN);
}

/**
 * Application-specific element assertions
 */
Given('application is open', async () => {
	// Open the application on the main page
	await suitest.openApp();
	// Wait until main content element exists on the page, i.e. it's loaded and ready for interaction
	await assert.element(getSelector('Main page content')).exists().timeout(10000);
	// And loader is hidden
	await assert.element(getSelector('Loading overlay')).doesNot().exist().timeout(10000);
});

Then('{string} navigation item is focused', async selector => {
	// Element is focused when it contains class "focus"
	await isFocused(assert.element(getSelector(selector))).timeout(DEFAULT_TIMEOUT);
});

Then('{string} navigation item is selected', async selector => {
	// Element is selected when it has class "active"
	await isSelected(assert.element(getSelector(selector))).timeout(DEFAULT_TIMEOUT);
});

Then('main menu items are selectable:', async items => {
	// Example of complex scenario, written with JS
	// Expect at the beginning focus to be on main menu item
	// Traverse main menu and make sure every item can be selected
	for (const selector of items.rows()) {
		// Press right until item in question is focused
		await assert.press(suitest.VRC.RIGHT).until(
			isFocused(suitest.element(getSelector(selector)))
		).repeat(5);

		// Press OK
		await suitest.press(suitest.VRC.OK);

		// Make sure that item is now selected
		await isSelected(assert.element(getSelector(selector))).timeout(DEFAULT_TIMEOUT);

		// Wait until focus is moved to content tile in case it exists
		if (!await suitest.element(getSelector('First tile')).exists().timeout(DEFAULT_TIMEOUT)) {
			// Log a message to the console - could be useful
			console.log(`Top menu item "${selector}" does not have any data, skipping some steps`);

			continue;
		}

		// There is some contents, have to press up
		await suitest.press(suitest.VRC.UP).until(
			isFocused(suitest.element(getSelector(selector)))
		).repeat(3);
	}
});

When('user navigates to pause button', async () => {
	// This step would focus "pause" button in video player from 2 state:
	// * video just started and focus is on suggested videos
	// * video was playing for some time and controls are now hidden
	await suitest.press(suitest.VRC.DOWN).until(
		isFocused(suitest.element(getSelector('Pause button')))
	).repeat(3);
});

Then('run Test Editor snippet {string}', async testName => {
	// Run pre-defined test editor test snippet
	await suitest.assert.runTest(getTestId(testName));
});

Then("{string} page items are rendered", async page => {
	// Fetch data from server
	const response = await fetch(`http://file.suite.st/sampleapp/api/${page}.json`);

	// ensure status code is 200. If it's something else
	// - we have a problem already and it does not make sense to continue
	nodeAssert.strictEqual(response.status, 200, 'Failed to load category data');

	// wait for data to be loaded and JSON parsed
	const data = await response.json();

	// For each item in data list
	for (const item of data.list) {
		// Make sure there is an element with item's name present in DOM
		await assert.element({text: item.name}).exists().timeout(DEFAULT_TIMEOUT);

		// Make sure there is an image for given item and that it's loaded
		await assert.element({css: `#listpageItem-img-${item.id}_img`}).matches(suitest.PROP.IMAGE_LOAD_STATE, suitest.IMAGE_LOAD_STATE.LOADED).timeout(DEFAULT_TIMEOUT);
	}
});
