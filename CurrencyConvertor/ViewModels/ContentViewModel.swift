//
//  ContentViewModel.swift
//  CurrencyConvertor
//
//  Created by Zoltan Vegh on 15/11/2025.
//

import Foundation

class ContentViewModel: ObservableObject {
	
	@Published var convertedAmount = 1.0
	@Published var baseAmount = 1.0
	@Published var baseCurrency: CurrencyChoice = .Usa
	@Published var convertedCurrency: CurrencyChoice = .Usa
	@Published var rates: Rates?
	
	var numberFormatter: NumberFormatter {
		let numberFormatter = NumberFormatter()
		numberFormatter.numberStyle = .currency
		numberFormatter.currencySymbol = ""
		return numberFormatter
	}
	
	func fetchRates() async {

		guard let url = URL(string: "https://openexchangerates.org/api/latest.json?app_id=\(OpenExchangeRates.appId)") else { return }
		let urlRequest = URLRequest(url: url)
		
		do {
			let (data, _) = try await URLSession.shared.data(for: urlRequest)
			rates = try JSONDecoder().decode(Rates.self, from: data)
		} catch {
			print(error.localizedDescription)
		}
	}
	
}
