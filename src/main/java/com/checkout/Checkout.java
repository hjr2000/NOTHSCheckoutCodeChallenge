package com.checkout;

import java.util.List;

public class Checkout {

    List<String> promotionsList;
    double total;
    boolean sixtyPoundsAndOverTenPercentDiscount = false;
    boolean multipleTravelCardDiscount = false;

    public Checkout(List<String> _promotionsList) throws Exception {
        promotionsList = _promotionsList;

        for(String promotion:promotionsList)
        {
            if (promotion.equals("Over 60 pounds spend 10 pc discount promo"))
            {
                sixtyPoundsAndOverTenPercentDiscount = true;
            }
            else if (promotion.equals("Travel card holder promo"))
            {
                multipleTravelCardDiscount = true;
            }
            else if (promotion.equals("None"))
            {
                // Do nothing, no promotions are set.
            }
            else
                throw new Exception("Unknown promotion used in the promotion table for this test! \n Promotion name: '" + promotion +"'");
        }
    }

    public void scan(String productToBeScanned, Item[] items) throws Exception {

        for (Item item: items)
        {
            if (productToBeScanned.equals(item.productName))
            {
                // Deal with the volume discount requirement.
                if (productToBeScanned.equals("Travel Card Holder") && multipleTravelCardDiscount)
                {
                    if (item.purchaseCount == 0)
                    {
                        total = total + item.productPrice;
                    }
                    else
                    {
                        if (item.volumeDiscountPrice < 0)
                            throw new Exception("Attempt made to use volume discount for the '" + item.productName + "' product, which is not set up for this disount type");
                        if (item.purchaseCount == 1){
                            total = total - item.productPrice;
                            total = total + item.volumeDiscountPrice;
                        }
                        total = total + item.volumeDiscountPrice;
                    }
                }
                // Nothing to see here, we're not dealing with a volume discount situation
                else
                {
                    total = total + item.productPrice;
                }
                // An item is being purchased, so no matter what, we increase the purchase count for the item.
                item.purchaseCount++;
            }
        }
    }

    public double total()
    {
        // Apply final total promotion(s) if required
        if (total >= 60 && sixtyPoundsAndOverTenPercentDiscount){
            total = total * 0.9;
        }

        // Return the total, rounded to two decimal places
        return (Math.round(total * 100.0) / 100.0);
    }

}
