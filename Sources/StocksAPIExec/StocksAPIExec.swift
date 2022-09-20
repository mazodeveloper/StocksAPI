import Foundation
import StocksAPI

@main
struct StocksAPIExec {
    static let stocksAPI = StocksAPI()

    static func main() async {
        do {
            print("\n/**** Quotes ******/\n")
            let quotes = try await stocksAPI.fetchQuotes(symbols: "AAPL,TSLA,GOOG,MSFT")
            print(quotes)

            print("\n/**** Tickers ******/\n")

            let tickers = try await stocksAPI.searchTickers(query: "tesla")
            print(tickers)

            print("\n/**** Charts ******/\n")
            if let chart = try await stocksAPI.fetchChartData(symbol: "TSLA", range: .oneDay) {
                print(chart)
            }

        } catch {
            print(error.localizedDescription)
        }
    }
}
