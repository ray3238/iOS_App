import Foundation

struct ExchangeRateResponseJpy: Codable {
    let date: String
    let jpy: Double
}
struct ExchangeRateResponseUsd: Codable {
    let date: String
    let usd: Double
}
struct ExchangeRateResponseKrw: Codable {
    let date: String
    let krw: Double
}
struct ExchangeRateResponsePhp: Codable {
    let date: String
    let php: Double
}
