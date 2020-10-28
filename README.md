# NOTHS Checkout Code Challenge (Submission by Haden J-Robbins)

## Running the Tests

#### 

These tests are designed to be run using the 'Run' functionality built into IntelliJ, i.e. they can be run using the green 'Play' button or shift-F10.
The reason for opting for this method of running the tests, and not using Maven through the command line, is because the IntelliJ runner gives you immediate visual feedback as to whether your test run has passed.
If the tests were intended for CI use, then Maven would be the mechanism of choice for running the suite.

#### How to run the tests for the first time

- Open this repository in IntelliJ. The required dependencies should download automatically.   
- Double check that src/main/java and src/test/java are set to be the 'Sources' (blue) folder and the 'Tests' (green) folders respectively.
- Open src/test/java/com/checkout/CukeRunner.java and click on the green 'play' icon next to the 'CukeRunner' method in the left hand column that contains the line numbers. Then select 'Run CukeRunner'. The tests will now run. All should pass.
- For future test runs, you are now set up to run the suite using the green play arrow in the toolbar.


### Assumption

It was necessary to make the following assumption to complete the task:

- Once you have purchased more than one Travel Card Holder (TCH), you pay the discounted price for all items, as opposed to paying full price for your first TCH and the discounted price for all subsequent TCHs.

### General Notes

- In the test scenarios, the product name has been used for readability purposes as opposed to the product code.
- If an incorrect promotion name is detected in a scenario, this will be detected.
- An attempt to apply a volume discount to an incorrectly set up item will fail, assuming the item's volume discount price is set to -99. 

### Potential Enhancements

- A high-priority enhancement would be to use Enums for the discount and product types.  
- Volume discount logic could be made generic for multiple product types.
- But... even better would be a modular 'discount engine' with discount precedence, i.e. which discount is applied in which order. Such an engine would need to be as simple as possible and would need careful planning and design. 
- There shoud bedetection of products that don’t exist/incorrectly spelled products in the scenario datatables. This would be simple to sort out once Enum based types are in use.
- Financial calculations should use BigDecimal



