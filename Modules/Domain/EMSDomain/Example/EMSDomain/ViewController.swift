//
//  ViewController.swift
//  EMSDomain
//
//  Created by llenyador on 02/09/2022.
//  Copyright (c) 2022 llenyador. All rights reserved.
//

import UIKit
import EMSDomain
import Combine

class ViewController: UIViewController {

    var cancellables: Set<AnyCancellable> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let liveData: GetLiveDataUseCaseProtocol = EMSDomainFactory.build()
        liveData.execute()
            .sinkOnMain { liveData in
                print(liveData)
            } onFailure: { error in
                print(error)
            }.store(in: &cancellables)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

