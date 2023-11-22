import Foundation

protocol Country {
    var name: String { get }
}

struct korea: Country {
    let name: String = "한국"
}

struct japen: Country {
    let name: String = "일본"
}

struct china: Country {
    let name: String = "중국"
}

class Flag {
    let country: Country
    
    init(country: Country) {
        self.country = country
    }
}

func printNameOfCountry(flag: Flag) {
    print(flag.country.name)
}
