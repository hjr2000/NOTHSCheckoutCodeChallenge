Feature: Tests to Exercise Checkout Functionality

  @Runme
  Scenario: Check no promotions fire inappropriately when promotions could be applied
    Given I am running the following promotions
      |   Travel card holder promo                  |
      |   Over 60 pounds spend 10 pc discount promo |
    When I scan the following products in the checkout
      |   Travel Card Holder    |
      |   Personalised Cufflinks|
    Then the total price expected is 54.25 pounds

  @Runme
  Scenario: Check no over 60 total 10% discount promotion fires inappropriately when total is over 60
    Given I am running the following promotions
      |   Travel card holder promo                  |
    When I scan the following products in the checkout
      |   Travel Card Holder    |
      |   Personalised Cufflinks|
      |   Kids T-shirt          |
    Then the total price expected is 74.2 pounds

  @Runme
  Scenario: Happy path promo check 1. Check over 60 total 10% discount promotion fires appropriately.
    Given I am running the following promotions
      |   Travel card holder promo                  |
      |   Over 60 pounds spend 10 pc discount promo |
    When I scan the following products in the checkout
      |   Travel Card Holder    |
      |   Personalised Cufflinks|
      |   Kids T-shirt          |
    Then the total price expected is 66.78 pounds

  @Runme
  Scenario: Happy path promo check 2. Check volume discount applied for travel cards.
    Given I am running the following promotions
      |   Travel card holder promo                  |
    When I scan the following products in the checkout
      |   Travel Card Holder    |
      |   Kids T-shirt          |
      |   Travel Card Holder    |
    Then the total price expected is 36.95 pounds

  @Runme
  Scenario: Happy path promo check 3. Check volume discount applied for travel cards and over 60 pounds spend 10% discount applied.
    Given I am running the following promotions
      |   Travel card holder promo                  |
      |   Over 60 pounds spend 10 pc discount promo |
    When I scan the following products in the checkout
      |   Travel Card Holder      |
      |   Personalised Cufflinks  |
      |   Travel Card Holder      |
      |   Kids T-shirt            |
    Then the total price expected is 73.76 pounds

#  @Runme
#  Scenario: test 2
#    Given I am running the following promotions
#      | Travel card holder promo                  |
#
