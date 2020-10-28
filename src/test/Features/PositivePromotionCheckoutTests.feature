Feature: Positive Tests to Exercise Checkout Promotion Functionality

# The purpose of these tests is to check promotions fire as expected under a variety of conditions

  @Runme
  Scenario: Happy path promo check 1. Check "Over 60 pound spend results in total 10% discount" promotion fires appropriately.
    Given I am running the following promotions
      |   Travel card holder promo                  |
      |   Over 60 pounds spend 10 pc discount promo |
    When I scan the following products in the checkout
      |   Travel Card Holder      |
      |   Personalised Cufflinks  |
      |   Kids T-shirt            |
    Then the total price expected is 66.78 pounds

  @Runme
  Scenario: Happy path promo check 2. Check volume discount applied for travel cards holders.
    Given I am running the following promotions
      |   Travel card holder promo   |
    When I scan the following products in the checkout
      |   Travel Card Holder    |
      |   Kids T-shirt          |
      |   Travel Card Holder    |
    Then the total price expected is 36.95 pounds

  @Runme
  Scenario: Happy path promo check 3. Check volume discount applied for travel card holders and "over 60 pounds spend 10% discount" applied.
    Given I am running the following promotions
      |   Travel card holder promo                  |
      |   Over 60 pounds spend 10 pc discount promo |
    When I scan the following products in the checkout
      |   Travel Card Holder      |
      |   Personalised Cufflinks  |
      |   Travel Card Holder      |
      |   Kids T-shirt            |
    Then the total price expected is 73.76 pounds

  @Runme
  Scenario: Happy path promo check 4. Check volume discount applied for a purchase consisting solely of travel card holders.
    Given I am running the following promotions
      |   Over 60 pounds spend 10 pc discount promo |
      |   Travel card holder promo    |
    When I scan the following products in the checkout
      |   Travel Card Holder    |
      |   Travel Card Holder    |
    Then the total price expected is 17.00 pounds

  @Runme
  Scenario: Happy path promo check 5. Check volume discount applied for a purchase consisting solely of ten travel cards holders.
    Given I am running the following promotions
      |   Travel card holder promo    |
    When I scan the following products in the checkout
      |   Travel Card Holder    |
      |   Travel Card Holder    |
      |   Travel Card Holder    |
      |   Travel Card Holder    |
      |   Travel Card Holder    |
      |   Travel Card Holder    |
      |   Travel Card Holder    |
      |   Travel Card Holder    |
      |   Travel Card Holder    |
      |   Travel Card Holder    |
    Then the total price expected is 85.00 pounds
