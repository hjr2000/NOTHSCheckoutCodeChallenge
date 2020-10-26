Feature: Negative Tests to Exercise Checkout Promotion Functionality

  # The purpose of these tests is to check promotions do not fire under a variety of conditions 

  @Runme
  Scenario: With promotions configured as active, check no promotions fire inappropriately as neither promotion condition is fulfilled
    Given I am running the following promotions
      |   Travel card holder promo                  |
      |   Over 60 pounds spend 10 pc discount promo |
    When I scan the following products in the checkout
      |   Travel Card Holder      |
      |   Personalised Cufflinks  |
    Then the total price expected is 54.25 pounds

  @Runme
  Scenario: Check no "over 60 pounds total giving a 10% discount" promotion fires inappropriately when total is over 60 but the promotion is not active
    Given I am running the following promotions
      |   Travel card holder promo    |
    When I scan the following products in the checkout
      |   Travel Card Holder      |
      |   Personalised Cufflinks  |
      |   Kids T-shirt            |
    Then the total price expected is 74.2 pounds

  @Runme
  Scenario: With no promotions configured to run, check no promotions fire inappropriately
    Given I am running the following promotions
      |   None                    |
    When I scan the following products in the checkout
      |   Travel Card Holder      |
      |   Personalised Cufflinks  |
      |   Travel Card Holder      |
      |   Kids T-shirt            |
    Then the total price expected is 83.45 pounds

  @Runme
  Scenario: With promotions configured as active, check no promotions fire inappropriately when just one product is purchased
    Given I am running the following promotions
      |   Travel card holder promo                   |
      |   Over 60 pounds spend 10 pc discount promo  |
    When I scan the following products in the checkout
      |   Travel Card Holder    |
    Then the total price expected is 9.25 pounds

  @Runme
  Scenario: With no promotions configured to run, and just one product being purchased,check no promotions fire inappropriately
    Given I am running the following promotions
      |   None                    |
    When I scan the following products in the checkout
      |   Travel Card Holder      |
    Then the total price expected is 9.25 pounds