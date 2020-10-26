package com.checkout;

import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.Given;

import java.util.List;

public class StepDefs {

    Item[] items;

//    @Given("I say hello")
//    public void iSayHello() {
//
//        System.out.println("Hellooooooooooooooooooooooooooooooooooooo!");
//    }

    @Given("I am running the following promotions")
    public void iAmRunningTheFollowingPromotions(DataTable table) {

       List<String> rows = table.asList(String.class);
        System.out.println("Hellooooooooooooooooooooooooooooooooooooo!");
    }
}
