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
	
	var numberFormatter: NumberFormatter {
		let numberFormatter = NumberFormatter()
		numberFormatter.numberStyle = .currency
		numberFormatter.currencySymbol = ""
		return numberFormatter
	}
	
}
