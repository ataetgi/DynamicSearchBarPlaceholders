//
//  Placeholders+UIKit.swift
//  DynamicSearchBarPlaceholders
//
//  Created by Ata Etgi on 29.09.2021
//  Copyright © 2021 Ata Etgi. All rights reserved.
//

import UIKit

protocol TextFieldPlaceholder: Equatable {
    func set(on textField: UITextField)
}

extension String: TextFieldPlaceholder {
    func set(on textField: UITextField) {
        textField.placeholder = self
    }
}

extension NSAttributedString: TextFieldPlaceholder {
    func set(on textField: UITextField) {
        textField.attributedPlaceholder = self
    }
}

extension UITextField {
    struct PlaceholderChange<Placeholder: TextFieldPlaceholder> {
        private let _setNewPlaceholder: (Placeholder, UITextField) -> ()

        public func setNewPlaceholder(_ placeholder: Placeholder, on textField: UITextField) {
            guard let text = textField.text, text.isEmpty else { return }
            _setNewPlaceholder(placeholder, textField)
        }
        
        public init(setNewPlaceholder: @escaping (Placeholder, UITextField) -> ()) {
            self._setNewPlaceholder = setNewPlaceholder
        }
    }
}

extension UITextField.PlaceholderChange {
    public enum Constants: Double {
        case defaultDuration = 0.35
    }

    static func caTransition(_ transition: @escaping () -> CATransition) -> UITextField.PlaceholderChange<Placeholder> {
        return UITextField.PlaceholderChange { (placeholder, textField) in
            let transition = transition()
            let placeholderLabel = (textField.value(forKey: "placeholderLabel") as? UILabel)
            placeholderLabel?.layer.add(transition, forKey: nil)
            placeholder.set(on: textField)
        }
    }
    
    static func pushTransition(_ direction: TransitionPushDirection,
                                      duration: TimeInterval = Constants.defaultDuration.rawValue,
                                      timingFunction: CAMediaTimingFunction = .init(name: CAMediaTimingFunctionName.easeInEaseOut)) -> UITextField.PlaceholderChange<Placeholder> {
        return .caTransition {
            let transition = CATransition()
            transition.duration = duration
            transition.timingFunction = timingFunction
            transition.type = CATransitionType.push
            transition.subtype = direction.coreAnimationConstant
            return transition
        }
    }
}


extension Placeholders: Equatable where Element: TextFieldPlaceholder {
    static func == (lhs: Placeholders<Element>, rhs: Placeholders<Element>) -> Bool {
        lhs.iterator.prefix(lhs.placeholderCount ?? .zero).map({$0}) == rhs.iterator.prefix(rhs.placeholderCount ?? .zero).map({$0})
    }

    func start(interval: TimeInterval,
               fireInitial: Bool = true,
               textField: UITextField,
               animation change: UITextField.PlaceholderChange<Element>) {
        self.start(interval: interval, fireInitial: fireInitial) { [weak textField, weak self] (placeholder) in
            if let textField = textField {
                change.setNewPlaceholder(placeholder, on: textField)
            } else {
                self?.timer?.invalidate()
            }
        }
    }
}
