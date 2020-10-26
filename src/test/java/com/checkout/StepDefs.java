package com.checkout;

import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.Given;
import io.cucumber.java.Before;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

import java.util.List;

import static org.junit.Assert.assertEquals;

public class StepDefs {

    public Item[] items;
    List<String> promotionsList;
    List<String> productsList;

    @Before
    public void setUpDataItem()
    {
        items = new Item[]
        {
            new Item("001", "Travel Card Holder",    9.25,   8.50),
            new Item("002", "Personalised Cufflinks",45.00,  -99),
            new Item("003", "Kids T-shirt",          19.95,  -99)
        };
    }

    @Given("I am running the following promotions")
    public void iAmRunningTheFollowingPromotions(DataTable promotionsDatatable)
    {
        promotionsList = promotionsDatatable.asList(String.class);
    }

    @When("I scan the following products in the checkout")
    public void iScanTheFollowingProductsInTheCheckout(DataTable productsDatatable)
    {
        productsList = productsDatatable.asList(String.class);
    }

    @Then("the total price expected is {double} pounds")
    public void theTotalPriceExpectedIsPounds(double totalPriceExpected) throws Exception
    {
        Checkout checkout = new Checkout(promotionsList);

        for (String productName:productsList)
        {
            checkout.scan(productName.trim(), items);
        }

        // Never run the 'total' method twice in a scenario unless you're really really sure you need to! It contains logic to change the total under certain conditions.
        double finalPrice = checkout.total();

        assertEquals(totalPriceExpected, finalPrice, 0);
    }
}
