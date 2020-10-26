package com.checkout;

import io.cucumber.java.en.Given;

public class StepDefs {

    Item[] items;

    @Given("I say hello")
    public void iSayHello() {

        System.out.println("Hellooooooooooooooooooooooooooooooooooooo!");
    }
}
