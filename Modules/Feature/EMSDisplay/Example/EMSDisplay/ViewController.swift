//
//  ViewController.swift
//  EMSDisplay
//
//  Created by llenyador on 02/10/2022.
//  Copyright (c) 2022 llenyador. All rights reserved.
//

import CoreLayout
import GaugeKit
import SharedUtilities



class ViewController: UIViewController {
//    let gauge = GaugeInfoView()

    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .white
//        view.addSubview(gauge)
//        gauge.snp.makeConstraints {
//            $0.center.equalToSuperview()
//            $0.left.right.equalToSuperview().priority(.high)
//            $0.width.lessThanOrEqualTo(200).priority(.required)
//        }
//        gauge.layer.borderWidth = 1
//        gauge.layer.borderColor = UIColor.green.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        gauge.display(viewModel: .init(infoText: " HOLAAAA ",
//                                       value: 0.5,
//                                       valueText: "0.5 kWh"),
//                      animateValueChange: true)
    }

}

