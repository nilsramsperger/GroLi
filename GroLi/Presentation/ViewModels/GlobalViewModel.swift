//
//  GlobalViewModel.swift
//  GroLi
//
//  Created by Nils Ramsperger on 30.06.25.
//

import Foundation

class GlobalViewModel: ObservableObject {
    @Published var nonDismissableMessage: String = ""
    @Published var dismissableMessage: String = ""
    
    func showPersistenceError() {
        nonDismissableMessage = NSLocalizedString("PersistenceErrorMessage", comment: "Error message to show on persistence errors")
    }
    
    func showValidationError(error: ValidationError) {
        switch error {
        case .stringTooLong:
            dismissableMessage = NSLocalizedString("ValidationErrorStringTooLong", comment: "Error message for string too long")
        }
    }
}
