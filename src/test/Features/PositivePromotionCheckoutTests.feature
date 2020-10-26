Feature: Tests to Exercise Checkout Functionality

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

  @Runme
  Scenario: Happy path promo check 4. Check volume discount applied for a purchase consisting solely of travel card holders.
    Given I am running the following promotions
      |   Travel card holder promo                  |
    When I scan the following products in the checkout
      |   Travel Card Holder    |
      |   Travel Card Holder    |
    Then the total price expected is 17.00 pounds

  @Runme
  Scenario: Happy path promo check 4. Check volume discount applied for a purchase consisting solely of travel cards.
    Given I am running the following promotions
      |   Travel card holder promo                  |
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
