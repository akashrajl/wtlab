package com.cc;

import javax.jws.WebService;

@WebService(endpointInterface = "com.cc.CCI")  // Link to the interface CCI
public class CC1 implements CCI {

    @Override
    public double convertCurrency(String fromCurrency, String toCurrency, double amount) {
        // Simple conversion logic (mocked with a static conversion rate)
        double conversionRate = 1.2; // Mock conversion rate for demonstration
        if (fromCurrency.equals("USD") && toCurrency.equals("EUR")) {
            return amount * conversionRate;
        } else if (fromCurrency.equals("EUR") && toCurrency.equals("USD")) {
            return amount / conversionRate;
        } else {
            return amount;  // If currencies are the same
        }
    }
}
