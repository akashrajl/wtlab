package com.cc;

import javax.jws.WebService;
import javax.jws.WebMethod;

@WebService
public interface CCI {
    @WebMethod
    double convertCurrency(String fromCurrency, String toCurrency, double amount);
}
