//
//  ViewCode.swift
//  reminders-app-mvvm
//
//  Created by Igor Cotrim on 25/10/24.
//

import Foundation

protocol ViewCode {

    func buildHierarchy()
    func setupConstraints()
    func applyAdditionalChanges()
}

extension ViewCode {

    func setupView() {
        buildHierarchy()
        setupConstraints()
        applyAdditionalChanges()
    }

    func buildHierarchy() {}

    func setupConstraints() {}

    func applyAdditionalChanges() {}
}
