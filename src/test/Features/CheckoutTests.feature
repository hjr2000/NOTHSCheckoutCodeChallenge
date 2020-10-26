Feature: Tests to Exercise Checkout Functionality

  @Runme
  Scenario: test 1
    Given I am running the following promotions
      |   Travel card holder promo                  |
      |   Over 60 pounds spend 10 pc discount promo |
    When I scan the following products in the checkout
      |   Travel Card Holder    |
      |   Personalised Cufflinks|
      |   Kids T-shirt          |

#  @Runme
#  Scenario: test 2
#    Given I am running the following promotions
#      | Travel card holder promo                  |
#
