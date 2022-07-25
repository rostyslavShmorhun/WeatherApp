
import Foundation

// MARK: - WeatherModel
struct WeatherModel: Codable {
    let lat, lon: Double
    let timezone: String
    let timezoneOffset: Int
    let current: Current
    let hourly: [Hourly]
    let daily: [Daily]
    
    enum CodingKeys: String, CodingKey {
        case lat, lon, hourly, daily
        case timezone, current
        case timezoneOffset = "timezone_offset"
    }
}
