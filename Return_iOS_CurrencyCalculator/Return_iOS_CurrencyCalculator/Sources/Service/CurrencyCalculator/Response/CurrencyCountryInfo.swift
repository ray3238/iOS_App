import Foundation

class CurrencyCountryInfo {
    static let shared = CurrencyCountryInfo()
    
    var fromCurrency: String?
    var toCurrency: String?
    
    private init() { }
}

class CurrencyCountry {
    static let shared = CurrencyCountry()
    
    var date: String = "2007-04-10"
    var currency: String = "0.75"
    var numberData: String = "dd"
    
    private init() { }
}
