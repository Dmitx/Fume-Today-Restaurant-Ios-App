//
//  LocationView.swift
//  RestaurantApp
//
//  Copyright © 2019 Dmitx. All rights reserved.
//

import UIKit

@IBDesignable class LocationView: BaseView {

    @IBOutlet weak var allowButton: UIButton!
    @IBOutlet weak var denyButton: UIButton!

    var didTapAllow: (() -> Void)?

    @IBAction func allowAction(_ sender: UIButton) {
        didTapAllow?()
    }

    @IBAction func denyAction(_ sender: UIButton) {

    }
}
