//
//  TopGamesSpec.swift
//  desafioZapVivaRealTests
//
//  Created by Mac on 10/02/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import desafioZapVivaRealTests

class TopGamesTests: QuickSpec {

    override func spec() {
        
        var topGamesVC: TopGamesViewController!
        
        describe("TopGamesViewController") {
        
            beforeEach() {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc: TopGamesViewController = storyboard.instantiateViewController(withIdentifier: "TopGamesViewController") as! TopGamesViewController
                topGamesVC = vc
                _ = topGamesVC.view // To call viewDidLoad
            }
            
            it("Should start with a hidden collection view") {
                expect(self.vc.collectionView.isHidden) == true
            }
        
        }
    }
}
