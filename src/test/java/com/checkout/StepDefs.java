package com.checkout;

import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.Given;
import io.cucumber.java.Before;
import io.cucumber.java.en.When;

import java.util.List;

public class StepDefs {

    Item[] items;
    List<String> promotionsList;
    List<String> productsList;


    @Before
    public void setUpDataItem() {

        System.out.println("***** BEFORE ******");
        items = new Item[]{
                new Item("001", "Travel Card Holder", 9.25),
                new Item("002", "Personalised Cufflinks", 9.25),
                new Item("003", "Kids T-shirt", 9.25)
        };
    }

    @Given("I am running the following promotions")
    public void iAmRunningTheFollowingPromotions(DataTable promotionsDatatable) {

        promotionsList = promotionsDatatable.asList(String.class);
        System.out.println("-------------------------------------------");
        for (String promotionName:promotionsList){
            System.out.println(promotionName);
        }
        System.out.println("-------------------------------------------");
    }

    @When("I scan the following products in the checkout")
    public void iScanTheFollowingProductsInTheCheckout(DataTable productsDatatable) {

        productsList = productsDatatable.asList(String.class);
        System.out.println("-------------------------------------------");
        for (String productName:productsList){
            System.out.println(productName);
        }
        System.out.println("-------------------------------------------");

    }
}
