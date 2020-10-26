package com.checkout;

public class Item {

    public String productCode;

    public String productName;

    public double productPrice;

    public Item(String _productCode, String _productName, double _productPrice)
    {
        this.productCode = _productCode;
        this.productName = _productName;
        this.productPrice = _productPrice;
    }

}
