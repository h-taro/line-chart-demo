//
//  ViewController.swift
//  demo
//
//  Created by 平石　太郎 on 2023/01/04.
//

import Charts
import UIKit

class ViewController: UIViewController {
    private lazy var entries: [ChartDataEntry] = {
        let collection: [Double] = [10, 40, 20, 60, 40, 30]
        return collection.enumerated().map {
            ChartDataEntry(x: Double($0.offset), y: collection[$0.offset])
        }
    }()
    
    @IBOutlet weak var customLineChart: CustomLineChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customLineChart.updateChartEntries(entries)
    }
}

