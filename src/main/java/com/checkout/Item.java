package com.checkout;

public class Item {

    public String productCode;

    public String productName;

    public double productPrice;
    public int purchaseCount = 0;
    public double volumeDiscountPrice;

    public Item(String _productCode, String _productName, double _productPrice, double _volumeDiscountPrice)
    {
        this.productCode = _productCode;
        this.productName = _productName;
        this.productPrice = _productPrice;
        this.volumeDiscountPrice = _volumeDiscountPrice;
    }

}
